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


/**
 *   https://github.com/dxstp/same54_init
 */

#include <sam.h>
#include <stdio.h>
#include "my_init/oscctrl.h"
#include "my_init/gclk.h"
#include "my_init/dpll.h"
#include "my_init/gpio.h"
#include "my_init/pwm.h"
#include "my_init/uart.h"

/** 
 * this examples is designed for the ATSAM E54 Xplained Pro board.
 */

int main(void) {

    OSCCTRL_Init();
    GCLK_Init();
    UART2_Init();
    GPIO_Init();

    printf("\r\n-- SAME54 Xplained Pro boot example --\r\n");
    printf("Build "__TIME__" at "__DATE__"\r\n");
    printf("OSCCTRL initialized.\r\n");
    printf("GCLK initialized.\r\n");
    printf("GPIO initialized.\r\n");

    DPLL_Init();
    printf("DPLL initialized.\r\n");

    PWM_Init();
    printf("PWM initialized.\r\n");

    while(1) {
        __NOP();
    }
}
