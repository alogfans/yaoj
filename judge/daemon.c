#include "internal.h"

// reference: apue

int daemon (int nochdir, int noclose)
{
    pid_t pid;
        
    if (!nochdir && chdir("/") != 0)
        return -1;

    if (!noclose)
    {
        int fd = open("/dev/null", O_RDWR);
        if (fd < 0)
            return -1;
        if (dup2(fd, 0) < 0 || dup2(fd, 1) < 0 || dup2(fd, 2) < 0)
        {
            close (fd);
            return -1;
        }
        close(fd);
    }

    pid = fork();
    if (pid < 0)
        return -1;
    if (pid > 0)
    {
        printf("pid = %d\n", pid);
        _exit(0);
    }
    if (setsid() < 0)
        return -1;

    return 0;

}