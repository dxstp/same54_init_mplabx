/*
 *  (c) 2019 Microchip Technology Inc. and its subsidiaries. 
 *  
 *  Subject to your compliance with these terms, you may use Microchip software and any 
 *  derivatives exclusively with Microchip products. It is your responsibility to comply with third party 
 *  license terms applicable to your use of third party software (including open source software) that 
 *  may accompany Microchip software.
 *  
 *  THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER 
 *  EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY 
 *  IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS 
 *  FOR A PARTICULAR PURPOSE.
 *  
 *  IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 *  INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 *  WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP 
 *  HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO 
 *  THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
 *  CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT 
 *  OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS 
 *  SOFTWARE.
 */


OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)
SEARCH_DIR(.)

ENTRY(Reset_Handler)

/* Memory Spaces Definitions */
MEMORY
{
  rom      (rx)  : ORIGIN = 0x00000000, LENGTH = 0x00100000
  ram      (rwx) : ORIGIN = 0x20000000, LENGTH = 0x00040000
  bkupram  (rwx) : ORIGIN = 0x47000000, LENGTH = 0x00002000
  qspi     (rwx) : ORIGIN = 0x04000000, LENGTH = 0x01000000
  userrow  (rw)  : ORIGIN = 0x00804000, LENGTH = 0x00000020
  userpage (rw)  : ORIGIN = 0x00804020, LENGTH = 0x000001E0
}

__rom_end = ORIGIN(rom) + LENGTH(rom);
__ram_end = ORIGIN(ram) + LENGTH(ram);

/*************************************************************************
 * Section Definitions - Map input sections to output sections
 *************************************************************************/
SECTIONS
{
    /*
     * The linker moves the .vectors section into itcm when itcm is
     * enabled via the -mitcm option, but only when this .vectors output
     * section exists in the linker script.
     */
    .vectors :
    {
        . = ALIGN(4);
        _sfixed = .;
        KEEP(*(.vectors .vectors.* .vectors_default .vectors_default.*))
        KEEP(*(.isr_vector))
        KEEP(*(.reset*))
        KEEP(*(.after_vectors))
    } > rom
    /*
     * Code Sections 
     */
    .text :
    {
        . = ALIGN(4);
        _sfixed = .;
        *(.glue_7t) *(.glue_7)
        *(.ARM.extab* .gnu.linkonce.armextab.*)
        *(.rodata .rodata* .gnu.linkonce.r.*)
        *(.text .text.* .gnu.linkonce.t.*)

        /* Support C constructors, and C destructors in both user code
           and the C library. This also provides support for C++ code. */
        . = ALIGN(4);
        KEEP(*(.init))
        . = ALIGN(4);
        __preinit_array_start = .;
        KEEP (*(.preinit_array))
        __preinit_array_end = .;

        . = ALIGN(4);
        __init_array_start = .;
        KEEP (*(SORT(.init_array.*)))
        KEEP (*(.init_array))
        __init_array_end = .;

        . = ALIGN(4);
        KEEP (*crtbegin.o(.ctors))
        KEEP (*(EXCLUDE_FILE (*crtend.o) .ctors))
        KEEP (*(SORT(.ctors.*)))
        KEEP (*crtend.o(.ctors))

        . = ALIGN(4);
        KEEP(*(.fini))

        . = ALIGN(4);
        __fini_array_start = .;
        KEEP (*(.fini_array))
        KEEP (*(SORT(.fini_array.*)))
        __fini_array_end = .;

        KEEP (*crtbegin.o(.dtors))
        KEEP (*(EXCLUDE_FILE (*crtend.o) .dtors))
        KEEP (*(SORT(.dtors.*)))
        KEEP (*crtend.o(.dtors))

        . = ALIGN(4);
        _efixed = .;            /* End of text section */
    } > rom

    /* .ARM.exidx is sorted, so has to go in its own output section.  */
    PROVIDE_HIDDEN (__exidx_start = .);
    .ARM.exidx :
    {
      *(.ARM.exidx* .gnu.linkonce.armexidx.*)
    } > rom
    PROVIDE_HIDDEN (__exidx_end = .);

    . = ALIGN(4);
    _etext = .;

    .relocate : AT (_etext)
    {
        . = ALIGN(4);
        _srelocate = .;
        *(.ramfunc .ramfunc.*);
        . = ALIGN(4);
        _erelocate = .;
    } > ram

    .bkupram (NOLOAD):
    {
        . = ALIGN(8);
        _sbkupram = .;
        *(.bkupram .bkupram.*);
        . = ALIGN(8);
        _ebkupram = .;
    } > bkupram

    .qspi (NOLOAD):
    {
        . = ALIGN(8);
        _sqspi = .;
        *(.qspi .qspi.*);
        . = ALIGN(8);
        _eqspi = .;
    } > qspi

    /* .bss section which is used for uninitialized data */
    .bss (NOLOAD) :
    {
        . = ALIGN(4);
        __bss_start__ = .;
        _sbss = . ;
        _szero = .;
        *(.bss .bss.*)
        *(COMMON)
        . = ALIGN(4);
        __bss_end__ = .;
        _ebss = . ;
        _ezero = .;
    } > ram

    . = ALIGN(4);
    _end = . ;

	/* User row section */
    .userRowBlock :{
        KEEP(*(.userrow))
    } > userrow

	/* User page section */
    .userpageBlock :{
        KEEP(*(.userpage))
    } > userpage
}
