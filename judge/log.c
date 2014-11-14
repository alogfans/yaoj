/*
 * YET ANOTHER ONLINE JUDGE -- UNIX DEAMON 1.0
 *
 * Copyright <c> 2014. All rights reserved.
 * Description: this file used to be general header file.
 */

#include "internal.h"

int start_log(const char *logfile)
{
    log_fd = fopen(logfile, "a+");
    if (log_fd == NULL)
    {
        printf("log system error.\n");
        exit(-16);
    }
    return 0;
}

void finish_log()
{
    fclose(log_fd);
}

int append_log(char const *fmt, ...)
{
    char log_text[LOG_MESSAGE_BUFFER];
    char log_time[32];

    time_t now = time(NULL);
    struct tm *now_tm = localtime(&now);
    sprintf(log_time, "[%02d-%02d %02d:%02d:%02d]",
            now_tm->tm_mon, now_tm->tm_mday, now_tm->tm_hour, now_tm->tm_min, now_tm->tm_sec);

    va_list args;
    va_start(args, fmt);
    int n = vsprintf(log_text, fmt, args);
    va_end(args);

    fprintf(log_fd, "%s %s", log_time, log_text);
    return 0;
}
