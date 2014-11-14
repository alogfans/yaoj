/*
 * YET ANOTHER ONLINE JUDGE -- UNIX DEAMON 1.0
 *
 * Copyright <c> 2014. All rights reserved.
 * Description: this file used to be general header file.
 */

#include "internal.h"

int cleanup()
{
    chdir("../");
    system("rm -rf sandbox");
    return 0;
}
