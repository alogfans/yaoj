/*
 * YET ANOTHER ONLINE JUDGE -- UNIX DEAMON 1.0
 *
 * Copyright <c> 2014. All rights reserved.
 * Description: this file used to be general header file.
 */

#include "internal.h"

int download(struct Submit *submission, int submission_id)
{
    submission->execute_id = submission_id;
    receive_data_record(submission);
    receive_data_problem(submission);

    mkdir("./sandbox",  S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    chdir("./sandbox");

    char zipped_file[COMMAND_LINE_BUFFER];
    sprintf(zipped_file, "unzip -o ../../main/media/%s -d . > /dev/null", submission->check_file);
    system(zipped_file);

    FILE *fp = fopen("Main.cpp", "w");
    fprintf(fp, "%s\n%s", submission->pre_completed_source_code, submission->source_code);
    fclose(fp);

    fp = fopen("config.ini", "r");
    fscanf(fp, "%d", &submission->count_case);

    return 0;
}
