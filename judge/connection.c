/*
 * YET ANOTHER ONLINE JUDGE -- UNIX DEAMON 1.0
 *
 * Copyright <c> 2014. All rights reserved.
 * Description: this file used to be general header file.
 */

#include "internal.h"

int initial_connection(const char *db_login, const char *db_password)
{
    mysql_init(&mySql);
    mysql_real_connect(&mySql, "localhost", db_login, db_password, "onlinejudge", 0, NULL, CLIENT_LOCAL_FILES);
    // config charset
    mysql_query(&mySql, "set names utf8");
    return 0;
}

int termiate_connection()
{
    mysql_close(&mySql);
}

char *build_sql(const char *select, const char *from, const char *where)
{
    char sql_pattern[] = "SELECT %s FROM %s WHERE %s";
    static char __sql[MAX_SQL_LENGTH] = {0};
    sprintf(__sql, sql_pattern, select, from, where);
    return __sql;
}

int acquire_queue_id(int queue[])
{
    char *sql = build_sql("onlinejudge_record.id", "onlinejudge_record", "onlinejudge_record.commit_status_id = 1");
    mysql_real_query(&mySql, sql, strlen(sql));

    MYSQL_RES *result = mysql_use_result(&mySql);
    MYSQL_ROW row;
    int current_element = 0;
    while ((row = mysql_fetch_row(result)) && current_element < MAX_QUEUE_ELEMENT)
    {
        queue[current_element++] = atoi(row[0]);
    }
    return current_element;
}

int receive_data_record(struct Submit *submission)
{
    char where[MAX_SQL_LENGTH];
    sprintf(where, "onlinejudge_record.id = %d", submission->execute_id);

    char *sql = build_sql("*", "onlinejudge_record", where);
    mysql_real_query(&mySql, sql, strlen(sql));

    MYSQL_RES *result = mysql_use_result(&mySql);
    MYSQL_ROW row = mysql_fetch_row(result);
    submission->problem_id = atoi(row[2]);
    strcpy(submission->source_code, row[5]);
    while(mysql_fetch_row(result))
        ;  // ignore all remain value;
    return 0;
}

int receive_data_problem(struct Submit *submission)
{
    char where[MAX_SQL_LENGTH];
    sprintf(where, "onlinejudge_problem.id = %d", submission->problem_id);
    char *sql = build_sql("*", "onlinejudge_problem", where);

    mysql_real_query(&mySql, sql, strlen(sql));

    MYSQL_RES *result = mysql_use_result(&mySql);

    MYSQL_ROW row = mysql_fetch_row(result);

    while(mysql_fetch_row(result))
        ;  // ignore all remain value;

    submission->memory_limit = atoi(row[3]);
    submission->time_limit = atoi(row[4]);

    strcpy(submission->pre_completed_source_code, row[6]);
    strcpy(submission->check_file, row[7]);

    return 0;
}

int upload(struct Submit *submission)
{
    char uploadSqlPattern[] =
        "UPDATE onlinejudge_record SET commit_status_id = %d, commit_external = \'%s\', "
        "cost_time_ms = %d, cost_memory_mb = %d WHERE onlinejudge_record.id = %d";
    char uploadSql[MAX_SQL_LENGTH];
    sprintf(uploadSql, uploadSqlPattern, submission->callback_state, submission->external,
            submission->time_consume, submission->memory_consume, submission->execute_id);
    int responce = mysql_real_query(&mySql, uploadSql, strlen(uploadSql));
    return 0;
}
