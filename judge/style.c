/*
 * YET ANOTHER ONLINE JUDGE -- UNIX DEAMON 1.0
 *
 * Copyright <c> 2014. All rights reserved.
 * Description: this file used to be general header file.
 */

#include "internal.h"

int style_check(struct Submit *submission)
{
    pid_t pid;
    pid = vfork();
    if (pid > 0)
    {
        int stat_loc;
        waitpid(pid, &stat_loc, 0);
        struct stat buf;
        stat("style", &buf);
        strcpy(submission->external, "------- Style Check (by Google Cpplint) ------\n\n");
        if (buf.st_size != 0)
        {
            FILE *fp = fopen("style", "r");
            char c;
            
            int i = strlen(submission->external);
            while((c = fgetc(fp)) != EOF)
            {
                submission->external[i++] = c;
            }
            submission->external[i] = '\0';
            return -1;
        }
        return 0;
    }
    else
    {
        freopen("style", "w", stdout);
        freopen("style", "w", stderr);
        execlp("python",
               "python", "../cpplint.py" ,"Main.cpp", (char *)NULL);
        printf("Internal error\n");
        exit(-32);
    }
    return 0;
}


