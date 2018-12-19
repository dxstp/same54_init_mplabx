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
#include "pwm.h"

/** 
 * init the PWM module to generate two 16-bit PWMs
 */
void PWM_Init(void) {

    // unmask TC7 in MCLK to enable clock to user interface
    MCLK->APBDMASK.reg |= MCLK_APBDMASK_TC7;

    // connect GLCK with TC7 module
    GCLK->PCHCTRL[TC7_GCLK_ID].reg = GCLK_PCHCTRL_GEN_GCLK2 | (1 << GCLK_PCHCTRL_CHEN_Pos);

    // do a software reset of the module (write-synchronized)
    TC7->COUNT16.CTRLA.reg = TC_CTRLA_SWRST;
    while(TC7->COUNT16.SYNCBUSY.reg & TC_SYNCBUSY_SWRST);

    // set the modes
    TC7->COUNT16.CTRLA.reg = TC_CTRLA_MODE(TC_CTRLA_MODE_COUNT16_Val);
    TC7->COUNT16.WAVE.reg = TC_WAVE_WAVEGEN_NPWM_Val;

    // set the duty cycles for each output
    TC7->COUNT16.CC[0].reg = 32767;
    while(TC7->COUNT16.SYNCBUSY.reg & TC_SYNCBUSY_CC0);
    TC7->COUNT16.CC[1].reg = 10000;
    while(TC7->COUNT16.SYNCBUSY.reg & TC_SYNCBUSY_CC1);

    // enable the PWM module
    TC7->COUNT16.CTRLA.reg |= TC_CTRLA_ENABLE;
    while(TC7->COUNT16.SYNCBUSY.reg & TC_SYNCBUSY_ENABLE);

}