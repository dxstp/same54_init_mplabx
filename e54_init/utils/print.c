// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <sys/types.h>
#include <sys/stat.h>

#include "print.h"
#include "../my_init/uart.h"

extern int errno;
extern int _end;

/**
 * callback for printf to redirect the stdio output 
 */

void PRINT_Init(void) {

    /* set STDIO to unbuffered */
    setbuf(stdout, NULL);
    setbuf(stdin, NULL);

}

int _read(int file, char *ptr, int len) {
    int length = 0;

    if (file != 0) {
        return -1;
    }

    length = UART2_read(ptr, len);

    if (length < 0) {
        return -1;
    }

    return length;
}

int _write(int file, char *ptr, int len) {
    int length = 0;

    if ((file != 1) && (file != 2) && (file != 3)) {
        return -1;
    }

    length = UART2_write(ptr, len);

    if (length < 0) {
        return -1;
    }

    return length;
}

/**
 * \brief Replacement of C library of _sbrk
 */
caddr_t _sbrk(int incr) {
    static unsigned char *heap = NULL;
    unsigned char * prev_heap;

    if (heap == NULL) {
        heap = (unsigned char *) &_end;
    }
    prev_heap = heap;

    heap += incr;

    return (caddr_t) prev_heap;
}

/**
 * \brief Replacement of C library of link
 */
int link(char *old, char *_new) {
    (void) old, (void) _new;
    return -1;
}

/**
 * \brief Replacement of C library of _close
 */
int _close(int file) {
    (void) file;
    return -1;
}

/**
 * \brief Replacement of C library of _fstat
 */
int _fstat(int file, struct stat *st) {
    (void) file;
    st->st_mode = S_IFCHR;

    return 0;
}

/**
 * \brief Replacement of C library of _isatty
 */
int _isatty(int file) {
    (void) file;
    return 1;
}

/**
 * \brief Replacement of C library of _lseek
 */
int _lseek(int file, int ptr, int dir) {
    (void) file, (void) ptr, (void) dir;
    return 0;
}

/**
 * \brief Replacement of C library of _exit
 */
void _exit(int status) {
    printf("Exiting with status %d.\n", status);

    for (;;)
        ;
}

/**
 * \brief Replacement of C library of _kill
 */
void _kill(int pid, int sig) {
    (void) pid, (void) sig;
    return;
}

/**
 * \brief Replacement of C library of _getpid
 */
int _getpid(void) {
    return -1;
}


