/*
 * YET ANOTHER ONLINE JUDGE -- UNIX DEAMON 1.0
 *
 * Copyright <c> 2014. All rights reserved.
 * Description: this file used to be general header file.
 */

#ifndef __INTERNAL_HEADER__
#define __INTERNAL_HEADER__

/* external header files */

 #define DEBUG_MODE

// ISO C
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <signal.h>
#include <time.h>
#include <fcntl.h>
#include <stdarg.h>

// POSIX and Linux Standards
#include <unistd.h>
#include <sys/types.h>
#include <sys/ptrace.h>
#include <sys/errno.h>
#include <sys/stat.h>
#include <sys/resource.h>
#include <unistd.h>
#include <sys/wait.h>

// Database libarary
#include <mysql/mysql.h>

/* symbolics */

// online Judge Responce
#define WAIT_FOR_JUDGE          1
#define ACCEPTED                2
#define WRONG_ANSWER            3
#define MEMORY_LIMIT_EXCEEDED   7
#define TIME_LIMIT_EXCEEDED     6
#define COMPILE_ERROR           4
#define RUNTIME_ERROR           5

// unit for measure
#define KILO_BYTE               1024
#define MEGA_BYTE               (1024 * 1024)

// limit
#define FILENAME_BUFFER         KILO_BYTE
#define COMMAND_LINE_BUFFER     (4 * KILO_BYTE)
#define SOURCE_CODE_BUFFER      (256 * KILO_BYTE)
#define TEXT_DATA_BUFFER        (64 * KILO_BYTE)

// default value
#define DEFAULT_TIME_LIMIT      1000
#define DEFAULT_MEMORY_LIMIT    (64 * MEGA_BYTE)

#define MAX_QUEUE_ELEMENT       32

/* structures */
struct Submit
{
    int         execute_id;
    int         compiler_id;
    int         judge_type;
    int         callback_state;
    int         memory_limit;
    int         memory_consume;
    int         time_limit;
    int         time_consume;

    int         problem_id;
    char        pre_completed_source_code[SOURCE_CODE_BUFFER];
    char        source_code[SOURCE_CODE_BUFFER];
    char        check_file[COMMAND_LINE_BUFFER];
    int         count_case;
    char        external[TEXT_DATA_BUFFER];
};

int download(struct Submit *submission, int submission_id);

// database infomation

/* connection.c */
MYSQL mySql;
#define DEFAULT_DATABASE_NAME   "onlinejudge"
#define MAX_SQL_LENGTH          (16 * KILO_BYTE)

int initial_connection(const char *db_login, const char *db_password);
int termiate_connection();
char *build_sql(const char *select, const char *from, const char *where);
int acquire_queue_id(int queue[]);
int receive_data_record(struct Submit *submission);
int receive_data_problem(struct Submit *submission);
int upload(struct Submit *submission);

/* log.c */
FILE                            *log_fd;
#define LOG_MESSAGE_BUFFER      KILO_BYTE

int start_log(const char *logfile);
void finish_log();
int append_log(char const *fmt, ...);

/* download.c */
int download(struct Submit *submission, int submission_id);

int style_check(struct Submit *submission);

/* compile.c */
int compile(struct Submit *submission);


/* execute.c */
int get_proc_status(int pid, const char *param);
int execute(struct Submit *submission, int );

/* compare.c */
int compare(struct Submit *submission, int );
void find_next_nonspace(int *c1, int *c2, FILE *f1, FILE *f2, struct Submit *submission);
void make_diff_out(FILE *f1, FILE *f2, int c1, int c2, struct Submit *submission);
char * get_file_content(const char *filename);

/* afterward.c */
int cleanup();


#endif // __INTERNAL_HEADER__
