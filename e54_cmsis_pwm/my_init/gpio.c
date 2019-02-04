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
#include "gpio.h"

/**
 * init the GPIO module to output GLCK1
 * PWM from TC7, WO0 and WO1
 * RX = PB24, TX = PB25 (for Xplained Board) 
 */
void GPIO_Init(void) {

    // Set Board LED to On
    PORT->Group[GPIO_PORTC].OUTCLR.reg = 1 << 18;
    PORT->Group[GPIO_PORTC].PINCFG[18].reg = 0x0;
    PORT->Group[GPIO_PORTC].DIRSET.reg = 1 << 18;
    
    // set GLCK1 output
    PORT->Group[GPIO_PORTB].WRCONFIG.reg =
            PORT_WRCONFIG_PMUX(MUX_PB15M_GCLK_IO1)
            | PORT_WRCONFIG_WRPMUX
            | PORT_WRCONFIG_PMUXEN
            | PORT_WRCONFIG_WRPINCFG
            | ((1 << 15) & 0xffff);

    // set PWM WO0 output
    PORT->Group[GPIO_PORTB].WRCONFIG.reg =
            PORT_WRCONFIG_PMUX(MUX_PB00E_TC7_WO0)
            | PORT_WRCONFIG_WRPMUX
            | PORT_WRCONFIG_PMUXEN
            | PORT_WRCONFIG_WRPINCFG
            | ((1 << 0) & 0xffff);

    // set PWM WO1 output
    PORT->Group[GPIO_PORTB].WRCONFIG.reg =
            PORT_WRCONFIG_PMUX(MUX_PB01E_TC7_WO1)
            | PORT_WRCONFIG_WRPMUX
            | PORT_WRCONFIG_PMUXEN
            | PORT_WRCONFIG_WRPINCFG
            | ((1 << 1) & 0xffff);

    // set UART RX input
    PORT->Group[GPIO_PORTB].WRCONFIG.reg =
            PORT_WRCONFIG_PMUX(MUX_PB24D_SERCOM2_PAD1)
            | PORT_WRCONFIG_WRPMUX
            | PORT_WRCONFIG_PMUXEN
            | PORT_WRCONFIG_WRPINCFG
            | PORT_WRCONFIG_HWSEL
            | ((1 << 8) & 0xffff);

    // set UART TX output
    PORT->Group[GPIO_PORTB].WRCONFIG.reg =
            PORT_WRCONFIG_PMUX(MUX_PB25D_SERCOM2_PAD0)
            | PORT_WRCONFIG_WRPMUX
            | PORT_WRCONFIG_PMUXEN
            | PORT_WRCONFIG_WRPINCFG
            | PORT_WRCONFIG_HWSEL
            | ((1 << 9) & 0xffff);
}
