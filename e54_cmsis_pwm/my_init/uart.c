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
#include <stdio.h>
#include "uart.h"

UART2_DATA uart2;

UART2_DATA *UART2_GetReference(void) {
    return &uart2;
}

/** 
 * init the UART module to 115200 baud, 8N1
 */
void UART2_Init(void) {

    // unmask SERCOM2 in MCLK to enable clock to user interface
    MCLK->APBBMASK.reg |= MCLK_APBBMASK_SERCOM2;

    // connect GLCK3 with SERCOM2 module (core and slow clock)
    GCLK->PCHCTRL[SERCOM2_GCLK_ID_CORE].reg = GCLK_PCHCTRL_GEN_GCLK3 | (1 << GCLK_PCHCTRL_CHEN_Pos);
    GCLK->PCHCTRL[SERCOM2_GCLK_ID_SLOW].reg = GCLK_PCHCTRL_GEN_GCLK4 | (1 << GCLK_PCHCTRL_CHEN_Pos);

    // do a software reset of the module (write-synchronized)
    SERCOM2->USART.CTRLA.reg = SERCOM_USART_CTRLA_SWRST;
    while(SERCOM2->USART.SYNCBUSY.reg & SERCOM_USART_SYNCBUSY_SWRST);

    // configure UART mode and bit order
    SERCOM2->USART.CTRLA.reg =
            SERCOM_USART_CTRLA_MODE(1)
            | SERCOM_USART_CTRLA_RXPO(1)
            | SERCOM_USART_CTRLA_DORD;

    // enable transmitter and receiver
    SERCOM2->USART.CTRLB.reg =
            SERCOM_USART_CTRLB_TXEN
            | SERCOM_USART_CTRLB_RXEN;
    while(SERCOM2->USART.SYNCBUSY.reg & SERCOM_USART_SYNCBUSY_CTRLB);

    // setup baud rate
    SERCOM2->USART.BAUD.reg = CONF_SERCOM_2_USART_BAUD_RATE_REGISTER_VAL;

    // enable UART
    SERCOM2->USART.CTRLA.reg |= SERCOM_USART_CTRLA_ENABLE;
    while(SERCOM2->USART.SYNCBUSY.reg & SERCOM_USART_SYNCBUSY_ENABLE);

    // set STDIO to unbuffered
    setbuf(stdout, NULL);
    setbuf(stdin, NULL);
}

/*
 *  in order to use printf, a couple of system calls have to be defined
 * 
 */

int32_t UART2_write_(void) {
    uint32_t offset = 0;

    while(!(SERCOM2->USART.INTFLAG.reg & SERCOM_USART_INTFLAG_DRE));

    do {
        SERCOM2->USART.DATA.reg = uart2.pBuffer[offset];
        while(!(SERCOM2->USART.INTFLAG.reg & SERCOM_USART_INTFLAG_DRE));
    }while(++offset < uart2.n);

    while(!(SERCOM2->USART.INTFLAG.reg & SERCOM_USART_INTFLAG_TXC));

    return (int32_t) offset;
}

int32_t UART2_write(const uint8_t * const buf, const uint16_t length) {
    uint32_t offset = 0;

    while(!(SERCOM2->USART.INTFLAG.reg & SERCOM_USART_INTFLAG_DRE));

    do {
        SERCOM2->USART.DATA.reg = buf[offset];
        while(!(SERCOM2->USART.INTFLAG.reg & SERCOM_USART_INTFLAG_DRE));
    }while(++offset < length);

    while(!(SERCOM2->USART.INTFLAG.reg & SERCOM_USART_INTFLAG_TXC));

    return (int32_t) offset;
}

int32_t UART2_read(uint8_t * const buf, const uint16_t length) {
    uint32_t offset = 0;

    do {
        while(!(SERCOM2->USART.INTFLAG.reg & SERCOM_USART_INTFLAG_RXC));
        buf[offset] = SERCOM2->USART.DATA.reg;
    }while(++offset < length);

    return (int32_t) offset;
}

int __attribute__((weak)) _read(int file, char *ptr, int len) {
    int n = 0;

    if (file != 0) {
        return -1;
    }

    n = UART2_read((uint8_t *) ptr, len);
    if (n < 0) {
        return -1;
    }

    return n;
}

int __attribute__((weak)) _write(int file, char *ptr, int len) {
    int n = 0;

    if ((file != 1) && (file != 2) && (file != 3)) {
        return -1;
    }

    n = UART2_write((const uint8_t *) ptr, len);
    if (n < 0) {
        return -1;
    }

    return n;
}