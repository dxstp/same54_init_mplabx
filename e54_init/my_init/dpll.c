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
#include "dpll.h"

/**
 * init DPLL0 and DPLL1
 * clock input is XOSC1, which will by divided by 4 beforehand
 * maximum clock input frequency is 3 MHz
 */
void DPLL_Init(void) {
    // FDPLL0: ref is XOSC1 (0x03), divided by 4 (max input is 3.2 MHz!)
    // divider is fosc/(2 � (DIV + 1)) -> DIV is 1
    // Multiplier is 40 (3*40 = 120) -> LDR is 39
    // for main clock
    OSCCTRL->Dpll[0].DPLLRATIO.reg = OSCCTRL_DPLLRATIO_LDR(39);

    // this register is write-synchronized, wait until the
    // corresponding syncbusy bit clears
    while(OSCCTRL->Dpll[0].DPLLSYNCBUSY.reg & OSCCTRL_DPLLSYNCBUSY_MASK);

    // divide XOSC clock by 4
    OSCCTRL->Dpll[0].DPLLCTRLB.reg =
            OSCCTRL_DPLLCTRLB_DIV(1)
            | OSCCTRL_DPLLCTRLB_REFCLK(0x03);

    OSCCTRL->Dpll[0].DPLLCTRLA.reg = 1 << OSCCTRL_DPLLCTRLA_ENABLE_Pos;

    while(OSCCTRL->Dpll[0].DPLLSYNCBUSY.reg & OSCCTRL_DPLLSYNCBUSY_MASK);

    // wait for PLL to lock
    while(!(
            ((OSCCTRL->Dpll[0].DPLLSTATUS.reg & OSCCTRL_DPLLSTATUS_LOCK) 
            >> OSCCTRL_DPLLSTATUS_LOCK_Pos)
            || ((OSCCTRL->Dpll[0].DPLLSTATUS.reg & OSCCTRL_DPLLSTATUS_CLKRDY) 
            >> OSCCTRL_DPLLSTATUS_CLKRDY_Pos)
            ));


    // FDPLL1: ref is XOSC1 (0x03), divided by 6 (max input is 3.2 MHz!)
    // divider is fosc/(2 � (DIV + 1)) -> DIV is 2
    // Multiplier is 100 (2*100 = 200) -> LDR is 99
    // for peripherals (will be divided down as needed)
    OSCCTRL->Dpll[1].DPLLRATIO.reg = OSCCTRL_DPLLRATIO_LDR(99);

    while(OSCCTRL->Dpll[1].DPLLSYNCBUSY.reg & OSCCTRL_DPLLSYNCBUSY_MASK);

    OSCCTRL->Dpll[1].DPLLCTRLB.reg =
            OSCCTRL_DPLLCTRLB_DIV(2)
            | OSCCTRL_DPLLCTRLB_REFCLK(0x03);

    OSCCTRL->Dpll[1].DPLLCTRLA.reg = 1 << OSCCTRL_DPLLCTRLA_ENABLE_Pos;

    while(OSCCTRL->Dpll[1].DPLLSYNCBUSY.reg & OSCCTRL_DPLLSYNCBUSY_MASK);

    // wait for PLL to lock
    while(!(
            ((OSCCTRL->Dpll[1].DPLLSTATUS.reg & OSCCTRL_DPLLSTATUS_LOCK) 
            >> OSCCTRL_DPLLSTATUS_LOCK_Pos)
            || ((OSCCTRL->Dpll[1].DPLLSTATUS.reg & OSCCTRL_DPLLSTATUS_CLKRDY) 
            >> OSCCTRL_DPLLSTATUS_CLKRDY_Pos)
            ));
}
