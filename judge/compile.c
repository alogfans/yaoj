/*
 * YET ANOTHER ONLINE JUDGE -- UNIX DEAMON 1.0
 *
 * Copyright <c> 2014. All rights reserved.
 * Description: this file used to be general header file.
 */

#include "internal.h"

// return 0 -> ok, -1 -> compiler error, attach error
int compile(struct Submit *submission)
{
    pid_t pid;
    pid = vfork();
    if (pid > 0)
    {
        int stat_loc;
        waitpid(pid, &stat_loc, 0);
        struct stat buf;
        stat("compile", &buf);
        if (buf.st_size != 0)
        {
            submission->callback_state = COMPILE_ERROR;
            FILE *fp = fopen("compile", "r");
            char c;
            int i = 0;
            while((c = fgetc(fp)) != EOF)
            {
                submission->external[i++] = c;
            }
            submission->external[i] = '\0';
            return -1;
        }
        if (access("Main", R_OK) != 0)
        {
            // file no exist
            submission->callback_state = COMPILE_ERROR;
            strcpy(submission->external, "No Object File Found");
            return -1;
        }
        return 0;
    }
    else
    {
        freopen("compile", "w", stdout);
        freopen("compile", "w", stderr);
        execlp("g++",
               "g++", "Main.cpp", "-o", "Main", "--static", (char *)NULL);
        /*execlp("gcc",
               "gcc", "Main.c", "-o", "Main", "-ansi", "-fno-asm", "-O2", "-Wall", "-lm", "--static", (char *)NULL);*/
        printf("Internal error\n");
        exit(-32);
    }
    return 0;
}


