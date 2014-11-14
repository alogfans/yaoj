/*
 * YET ANOTHER ONLINE JUDGE -- UNIX DEAMON 1.0
 *
 * Copyright <c> 2014. All rights reserved.
 * Description: this file used to be general header file.
 */

#include "internal.h"

/* Modify by HUSTOJ , and he said that : it's from zoj... */
int compare(struct Submit *submission, int iCase)
{
    FILE *f1, *f2;
    f1 = fopen("out", "r");
    char infile_name[256];
    sprintf(infile_name, "%d.out", iCase);
    freopen(infile_name, "r", stdin);
    f2 = fopen(infile_name, "r");
    submission->callback_state = ACCEPTED;
    if (!f1 || !f2)
    {
        submission->callback_state = RUNTIME_ERROR;
        return -1;
    }

    int c1, c2;

    while(1)
    {
        // Find the first non-space character at the beginning of line.
        // Blank lines are skipped.
        c1 = fgetc(f1);
        c2 = fgetc(f2);
        find_next_nonspace(&c1, &c2, f1, f2, submission);
        // Compare the current line.
        for (;;)
        {
            // Read until 2 files return a space or 0 together.
            while ((!isspace(c1) && c1) || (!isspace(c2) && c2))
            {
                if (c1 == EOF && c2 == EOF)
                    goto end;

                if (c1 == EOF || c2 == EOF)
                    break;

                if (c1 != c2)
                {
                    // Consecutive non-space characters should be all exactly the same
                    submission->callback_state = WRONG_ANSWER;
                    goto end;
                }
                c1 = fgetc(f1);
                c2 = fgetc(f2);
            }
            find_next_nonspace(&c1, &c2, f1, f2, submission);
            if (c1 == EOF && c2 == EOF)
                goto end;
            if (c1 == EOF || c2 == EOF)
            {
                submission->callback_state = WRONG_ANSWER;
                goto end;
            }

            if ((c1 == '\n' || !c1) && (c2 == '\n' || !c2))
                break;
        }
    }
end:
    // make_diff_out(f1, f2, c1, c2, submission);
    sprintf(submission->external, "%sTest Case %d: ", submission->external, iCase);
    if (submission->callback_state == ACCEPTED)
        sprintf(submission->external, "%sAccepted\n", submission->external);
    else
    {
        sprintf(submission->external, "%sWrong Answer\n", submission->external);
        sprintf(infile_name, "%d.in", iCase);
        sprintf(submission->external, "%sInput:\n%s", submission->external, get_file_content(infile_name));
        sprintf(infile_name, "%d.out", iCase);
        sprintf(submission->external, "%sCorrect Output:\n%s", submission->external, get_file_content(infile_name));
        sprintf(submission->external, "%sYour Output:\n%s", submission->external, get_file_content("out"));
    }
    fclose(f1);
    fclose(f2);
    return 0;
}

char * get_file_content(const char *filename)
{
    FILE *fp = fopen(filename, "r");
    static char buf[1024 * 64];
    char *beg = buf;
    while ((*beg = fgetc(fp)) != EOF)
        beg++;
    *beg = '\0';
    fclose(fp);
    return buf;
}

void find_next_nonspace(int *c1, int *c2, FILE *f1, FILE *f2, struct Submit *submission)
{
    // Find the next non-space character or \n.
    while ((isspace(*c1)) || (isspace(*c2)))
    {
        if (*c1 != *c2)
        {
            if (*c2 == EOF)
            {
                do
                {
                    *c1 = fgetc(f1);
                } while (isspace(*c1));
                continue;
            }
            else if (*c1 == EOF)
            {
                do
                {
                    *c2 = fgetc(f2);
                } while (isspace(*c2));
                continue;
            }
            else if ((*c1 == '\r' && *c2 == '\n'))
            {
                *c1 = fgetc(f1);
            }
            else if ((*c2 == '\r' && *c1 == '\n'))
            {
                *c2 = fgetc(f2);
            }
            else
            {
                submission->callback_state = WRONG_ANSWER; // presentation error
            }
        }
        if (isspace(*c1))
        {
            *c1 = fgetc(f1);
        }
        if (isspace(*c2))
        {
            *c2 = fgetc(f2);
        }
    }
}


void make_diff_out(FILE *f1, FILE *f2, int c1, int c2, struct Submit *submission)
{

}

