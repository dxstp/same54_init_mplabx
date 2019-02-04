#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-Release.mk)" "nbproject/Makefile-local-Release.mk"
include nbproject/Makefile-local-Release.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Release
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../Device_Startup/startup_same54.c ../Device_Startup/system_same54.c ../my_init/dpll.c ../my_init/gclk.c ../my_init/gpio.c ../my_init/oscctrl.c ../my_init/pwm.c ../my_init/uart.c ../print.c ../main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1301743165/startup_same54.o ${OBJECTDIR}/_ext/1301743165/system_same54.o ${OBJECTDIR}/_ext/171753868/dpll.o ${OBJECTDIR}/_ext/171753868/gclk.o ${OBJECTDIR}/_ext/171753868/gpio.o ${OBJECTDIR}/_ext/171753868/oscctrl.o ${OBJECTDIR}/_ext/171753868/pwm.o ${OBJECTDIR}/_ext/171753868/uart.o ${OBJECTDIR}/_ext/1472/print.o ${OBJECTDIR}/_ext/1472/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1301743165/startup_same54.o.d ${OBJECTDIR}/_ext/1301743165/system_same54.o.d ${OBJECTDIR}/_ext/171753868/dpll.o.d ${OBJECTDIR}/_ext/171753868/gclk.o.d ${OBJECTDIR}/_ext/171753868/gpio.o.d ${OBJECTDIR}/_ext/171753868/oscctrl.o.d ${OBJECTDIR}/_ext/171753868/pwm.o.d ${OBJECTDIR}/_ext/171753868/uart.o.d ${OBJECTDIR}/_ext/1472/print.o.d ${OBJECTDIR}/_ext/1472/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1301743165/startup_same54.o ${OBJECTDIR}/_ext/1301743165/system_same54.o ${OBJECTDIR}/_ext/171753868/dpll.o ${OBJECTDIR}/_ext/171753868/gclk.o ${OBJECTDIR}/_ext/171753868/gpio.o ${OBJECTDIR}/_ext/171753868/oscctrl.o ${OBJECTDIR}/_ext/171753868/pwm.o ${OBJECTDIR}/_ext/171753868/uart.o ${OBJECTDIR}/_ext/1472/print.o ${OBJECTDIR}/_ext/1472/main.o

# Source Files
SOURCEFILES=../Device_Startup/startup_same54.c ../Device_Startup/system_same54.c ../my_init/dpll.c ../my_init/gclk.c ../my_init/gpio.c ../my_init/oscctrl.c ../my_init/pwm.c ../my_init/uart.c ../print.c ../main.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-Release.mk dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=SAME54P20A
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1301743165/startup_same54.o: ../Device_Startup/startup_same54.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1301743165" 
	@${RM} ${OBJECTDIR}/_ext/1301743165/startup_same54.o.d 
	@${RM} ${OBJECTDIR}/_ext/1301743165/startup_same54.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1301743165/startup_same54.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4 -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/1301743165/startup_same54.o.d" -o ${OBJECTDIR}/_ext/1301743165/startup_same54.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/Device_Startup/startup_same54.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1301743165/system_same54.o: ../Device_Startup/system_same54.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1301743165" 
	@${RM} ${OBJECTDIR}/_ext/1301743165/system_same54.o.d 
	@${RM} ${OBJECTDIR}/_ext/1301743165/system_same54.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1301743165/system_same54.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4 -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/1301743165/system_same54.o.d" -o ${OBJECTDIR}/_ext/1301743165/system_same54.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/Device_Startup/system_same54.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/dpll.o: ../my_init/dpll.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/dpll.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/dpll.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/dpll.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4 -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/dpll.o.d" -o ${OBJECTDIR}/_ext/171753868/dpll.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/dpll.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/gclk.o: ../my_init/gclk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/gclk.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/gclk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/gclk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4 -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/gclk.o.d" -o ${OBJECTDIR}/_ext/171753868/gclk.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/gclk.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/gpio.o: ../my_init/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4 -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/gpio.o.d" -o ${OBJECTDIR}/_ext/171753868/gpio.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/gpio.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/oscctrl.o: ../my_init/oscctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/oscctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/oscctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/oscctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4 -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/oscctrl.o.d" -o ${OBJECTDIR}/_ext/171753868/oscctrl.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/oscctrl.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/pwm.o: ../my_init/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4 -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/pwm.o.d" -o ${OBJECTDIR}/_ext/171753868/pwm.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/pwm.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/uart.o: ../my_init/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/uart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4 -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/uart.o.d" -o ${OBJECTDIR}/_ext/171753868/uart.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/uart.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1472/print.o: ../print.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/print.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/print.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/print.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4 -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/print.o.d" -o ${OBJECTDIR}/_ext/1472/print.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/print.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4 -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d" -o ${OBJECTDIR}/_ext/1472/main.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/main.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/1301743165/startup_same54.o: ../Device_Startup/startup_same54.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1301743165" 
	@${RM} ${OBJECTDIR}/_ext/1301743165/startup_same54.o.d 
	@${RM} ${OBJECTDIR}/_ext/1301743165/startup_same54.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1301743165/startup_same54.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/1301743165/startup_same54.o.d" -o ${OBJECTDIR}/_ext/1301743165/startup_same54.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/Device_Startup/startup_same54.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1301743165/system_same54.o: ../Device_Startup/system_same54.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1301743165" 
	@${RM} ${OBJECTDIR}/_ext/1301743165/system_same54.o.d 
	@${RM} ${OBJECTDIR}/_ext/1301743165/system_same54.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1301743165/system_same54.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/1301743165/system_same54.o.d" -o ${OBJECTDIR}/_ext/1301743165/system_same54.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/Device_Startup/system_same54.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/dpll.o: ../my_init/dpll.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/dpll.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/dpll.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/dpll.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/dpll.o.d" -o ${OBJECTDIR}/_ext/171753868/dpll.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/dpll.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/gclk.o: ../my_init/gclk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/gclk.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/gclk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/gclk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/gclk.o.d" -o ${OBJECTDIR}/_ext/171753868/gclk.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/gclk.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/gpio.o: ../my_init/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/gpio.o.d" -o ${OBJECTDIR}/_ext/171753868/gpio.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/gpio.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/oscctrl.o: ../my_init/oscctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/oscctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/oscctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/oscctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/oscctrl.o.d" -o ${OBJECTDIR}/_ext/171753868/oscctrl.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/oscctrl.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/pwm.o: ../my_init/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/pwm.o.d" -o ${OBJECTDIR}/_ext/171753868/pwm.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/pwm.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/171753868/uart.o: ../my_init/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/171753868" 
	@${RM} ${OBJECTDIR}/_ext/171753868/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/171753868/uart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/171753868/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/171753868/uart.o.d" -o ${OBJECTDIR}/_ext/171753868/uart.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/my_init/uart.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1472/print.o: ../print.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/print.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/print.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/print.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/print.o.d" -o ${OBJECTDIR}/_ext/1472/print.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/print.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m4  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb  -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\Atmel\SAME54_DFP\1.0.94\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include" -I"C:\Program Files (x86)\Microchip\MPLABX\v5.10w1\packs\arm\CMSIS\5.0.1\CMSIS\include"  -Os -ffunction-sections -mlong-calls -DNDEBUG -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d" -o ${OBJECTDIR}/_ext/1472/main.o "C:/Work/Software/SAMD51/check/same54_init/e54_cmsis_pwm/main.c"  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=cortex-m4  -D__MPLAB_DEBUGGER_ICD4=1 -gdwarf-2  -D__$(MP_PROCESSOR_OPTION)__    -mthumb -Wl,-Map="dist\${CND_CONF}\${IMAGE_TYPE}\e54_cmsis_pwm.X.${IMAGE_TYPE}.map"  -o dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1  -L"../Device_Startup" -Wl,--gc-sections  -Wl,-lm  -Tsame54p20a_flash.ld
	${MP_CC_DIR}\\arm-none-eabi-objcopy -O binary "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.bin"
	
	${MP_CC_DIR}\\arm-none-eabi-objcopy -j .eeprom --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0 --no-change-warnings -O binary "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.eep" || exit 0
	${MP_CC_DIR}\\arm-none-eabi-objdump -h -S "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" > "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.lss"
	${MP_CC_DIR}\\arm-none-eabi-objcopy -O srec -R .eeprom -R .fuse -R .lock -R .signature "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.srec"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=cortex-m4  -D__$(MP_PROCESSOR_OPTION)__    -mthumb -Wl,-Map="dist\${CND_CONF}\${IMAGE_TYPE}\e54_cmsis_pwm.X.${IMAGE_TYPE}.map"  -o dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)  -L"../Device_Startup" -Wl,--gc-sections  -Wl,-lm  -Tsame54p20a_flash.ld
	${MP_CC_DIR}\\arm-none-eabi-objcopy -O binary "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.bin"
	${MP_CC_DIR}\\arm-none-eabi-objcopy -O ihex -R .eeprom -R .fuse -R .lock -R .signature "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.hex"
	${MP_CC_DIR}\\arm-none-eabi-objcopy -j .eeprom --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0 --no-change-warnings -O binary "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.eep" || exit 0
	${MP_CC_DIR}\\arm-none-eabi-objdump -h -S "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" > "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.lss"
	${MP_CC_DIR}\\arm-none-eabi-objcopy -O srec -R .eeprom -R .fuse -R .lock -R .signature "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/e54_cmsis_pwm.X.${IMAGE_TYPE}.srec"
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Release
	${RM} -r dist/Release

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
