/*
 * YET ANOTHER ONLINE JUDGE -- UNIX DEAMON 1.0
 *
 * Copyright <c> 2014. All rights reserved.
 * Description: this file used to be general header file.
 */

#include "internal.h"

int get_proc_status(int pid, const char *param)
{
    FILE *pf;
    char fn[TEXT_DATA_BUFFER], buf[TEXT_DATA_BUFFER];
    int ret = 0;
    sprintf(fn, "/proc/%d/status", pid);
    pf = fopen(fn, "r");
    if (pf == 0)
        return -1;
    int m = strlen(param);
    while (fgets(buf, TEXT_DATA_BUFFER - 1, pf))
    {
        buf[strlen(buf) - 1] = 0;
        if (strncmp(buf, param, m) == 0)
            sscanf(buf + m + 1, "%d", &ret);
    }
    fclose(pf);
    return ret;
}


int execute(struct Submit *submission, int iCase)
{
    pid_t pid;
    pid = vfork();

    if (pid == 0)
    {
        struct rlimit limit;
        // forbid the system to do core dump;
        limit.rlim_cur = 0;
        setrlimit(RLIMIT_CORE, &limit);

        // set the limit on the child process's CPU time
        getrlimit(RLIMIT_CPU, &limit);
        limit.rlim_cur = submission->time_limit / 1000;
        if (limit.rlim_cur < 1)
            limit.rlim_cur = 1;

        setrlimit(RLIMIT_CPU, &limit);

        // set the limit on the child process's memory
        getrlimit(RLIMIT_AS, &limit);
        limit.rlim_cur = submission->memory_limit * MEGA_BYTE;
        setrlimit(RLIMIT_AS, &limit);

        // set the limit on the Maximum size of file created by child process
        getrlimit(RLIMIT_FSIZE, &limit);
        limit.rlim_cur = 4096;
        setrlimit(RLIMIT_FSIZE, &limit);

        system("rm -f out err");
        char infile_name[256];
        sprintf(infile_name, "%d.in", iCase);
        freopen(infile_name, "r", stdin);
        freopen("out", "w", stdout);
        freopen("err", "w", stderr);

        execl("./Main", "Main", (char *)NULL);

        printf("online judge internal error.\n");
    }
    else
    {

        struct rusage contest_usage;
        int ret;
        int contest_status;

        int child_process_max_vm = 0;

        do
        {
            // non-block wait, so as to monitor the child proccess' status
            ret = wait4(pid, &contest_status, WNOHANG, &contest_usage);
            int current_vm_cost = get_proc_status(pid, "VmPeak:") / 1024;  // measured in MB
            // printf("%d\n", current_vm_cost);
            if (current_vm_cost > child_process_max_vm)
                child_process_max_vm = current_vm_cost;

            if (current_vm_cost > 1024 * submission->memory_limit)
            {
                submission->callback_state = MEMORY_LIMIT_EXCEEDED;
                kill(pid, SIGXCPU);
            }
        } while(ret == 0);

        if(WIFEXITED(contest_status))
        {
            // the child process terminated normally
            double utime, stime;
            utime = contest_usage.ru_utime.tv_sec * 1000.0 + contest_usage.ru_utime.tv_usec / 1000.0;
            stime = contest_usage.ru_stime.tv_sec * 1000.0 + contest_usage.ru_stime.tv_usec / 1000.0;
            submission->memory_consume = child_process_max_vm;
            submission->time_consume = (int) (utime + stime);
            // printf("%d %d\n", submission->time_consume, submission->memory_consume);
            if (submission->time_consume > submission->time_limit)
            {                
                submission->callback_state = TIME_LIMIT_EXCEEDED;
                return -1;                
            }
            return 0;
        }
        if(WIFSIGNALED(contest_status))
        {
            //printf("There might be some error!\n");
            int sig = WTERMSIG(contest_status);
            //printf("error id: %d \n", sig);
            if(sig == SIGXCPU)
            {
                submission->callback_state = TIME_LIMIT_EXCEEDED;
            }
            if(sig == SIGXFSZ)
            {
                // puts("output limit exceeded");
                submission->callback_state = RUNTIME_ERROR;
            }
            if(sig == SIGSEGV)
            {
                //puts("runtime error");
                submission->callback_state = RUNTIME_ERROR;
            }
            if(sig == SIGKILL)
            {
                //puts("memory limit exceeded");
                submission->callback_state = MEMORY_LIMIT_EXCEEDED;
            }
            return -1;
        }
    }
}
