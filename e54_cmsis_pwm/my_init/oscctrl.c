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
#include "oscctrl.h"

/**
 * OSCCTRL: setup XOSC1 with 12 MHz
 * multiplier and current according to table 28-7  
 * start external 32k crystal
 * set RTC to external 32k crystal
 * 
 * if everything is left on default, the controller will start with the
 * internal 48 MHz FDPLL0 oscillator, routed to GLCK0.
 * GLCK0 will provide the clock for MCLK, which clocks the CPU, the bus
 * and the modules connected to the bus.
 * However, some peripherals need a separate asynchronous clock and
 * some interfaces of modules must first be unmasked to be clocked by
 * the synchronous bus clock.
 * 
 * init an external crystal oscillator to 12 MHz
 */
void OSCCTRL_Init(void) {
    OSCCTRL->XOSCCTRL[1].reg =
            OSCCTRL_XOSCCTRL_IMULT(4)
            | OSCCTRL_XOSCCTRL_IPTAT(3)
            | (1 << OSCCTRL_XOSCCTRL_XTALEN_Pos)
            | (1 << OSCCTRL_XOSCCTRL_ENABLE_Pos);

    while(!(OSCCTRL->INTFLAG.reg & OSCCTRL_INTFLAG_XOSCRDY1));

    OSC32KCTRL->XOSC32K.reg =
            OSC32KCTRL_XOSC32K_ENABLE
            | OSC32KCTRL_XOSC32K_XTALEN;

    while(!(OSC32KCTRL->INTFLAG.reg & OSC32KCTRL_INTFLAG_XOSC32KRDY));

    OSC32KCTRL->RTCCTRL.reg =
            OSC32KCTRL_RTCCTRL_RTCSEL_XOSC32K;
}