#include "internal.h"

int main(int argc, char *argv[])
{
#ifndef DEBUG_MODE
    if (daemon(0,0))
    {
        printf("failure");
        return -1;
    }
#endif // DEBUG_MODE

    start_log("logfile");

    initial_connection("root", "p@ssw0rd");

    while(1)
    {
        // acquired infomation
        int queue[MAX_QUEUE_ELEMENT];
        int len = acquire_queue_id(queue);

#ifdef DEBUG_MODE
        printf("this round we fetched %d submissions.\n", len);
#endif // DEBUG_MODE
        
        if (len == 0)
            sleep(5);

        int current_process_queue_id = 0;
        for (; current_process_queue_id < len; current_process_queue_id++)
        {
            int current_execute_id = queue[current_process_queue_id];

            struct Submit submission;

            memset(&submission, 0, sizeof submission);
            submission.memory_consume = -1; // default
            submission.time_consume = -1;

            download(&submission, current_execute_id);
            style_check(&submission);
            strcat(submission.external, "\n------ Correct Vaildation ------\n\n");

            if (compile(&submission) == 0)
            {
                int iCase;
                for (iCase = 1; iCase <= submission.count_case; iCase++)
                {
                    if (execute(&submission, iCase) == 0)
                        compare(&submission, iCase);
                    // printf("%d %d\n", submission.time_consume, submission.memory_consume);
                    if (submission.callback_state != ACCEPTED)
                        break;
                }

            }

            upload(&submission);
            cleanup();
        }
    }

    termiate_connection();
    finish_log();
    exit(0);
}
