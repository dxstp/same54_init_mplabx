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

#include <sam.h>
#include "gclk.h"

/**
 * connect GCLK0 to DPLL0 (120 MHz)
 * connect GCLK1 to DPLL1 (200 MHz), divide by 200 => 1 MHz for Pin Output (to check clock)
 * connect GCLK2 to DPLL1 (200 MHz), divide by 2 => 100 MHz for PWM
 * connect GCLK3 to XOSC1 (12 MHz) => 12 MHz for SERCOM core
 * connect GCLK4 to XOSC32K (32.768 kHz) => for RTC and SERCOM slow
 */
void GCLK_Init(void) {
    // GCLK0: source is FDPLL0, no divisor
    // for main clock
    GCLK->GENCTRL[0].reg =
            (1 << GCLK_GENCTRL_GENEN_Pos)
            | GCLK_GENCTRL_SRC_DPLL0;

    // GLCK1: source is FDPLL1, divided by 200, Output enabled (PB15)
    // to assert right PLL clocking
    GCLK->GENCTRL[1].reg =
            GCLK_GENCTRL_DIV(200)
            | (1 << GCLK_GENCTRL_GENEN_Pos)
            | (1 << GCLK_GENCTRL_OE_Pos)
            | GCLK_GENCTRL_SRC_DPLL1;

    // GLCK2: source is FDPLL1, divided by 2
    // for PWM TC7 (max 100 MHz)
    GCLK->GENCTRL[2].reg =
            GCLK_GENCTRL_DIV(2)
            | (1 << GCLK_GENCTRL_GENEN_Pos)
            | GCLK_GENCTRL_SRC_DPLL1;

    // GLCK3: source is XOSC1
    // for SERCOM
    GCLK->GENCTRL[3].reg =
            GCLK_GENCTRL_DIV(1)
            | (1 << GCLK_GENCTRL_GENEN_Pos)
            | GCLK_GENCTRL_SRC_XOSC1;

    //GCLK4: source is 32K
    GCLK->GENCTRL[4].reg =
            GCLK_GENCTRL_DIV(1)
            | (1 << GCLK_GENCTRL_GENEN_Pos)
            | GCLK_GENCTRL_SRC_XOSC32K;
}