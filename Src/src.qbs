import qbs
import Stm32Application
import qbs.FileInfo
import qbs.ModUtils

Project {
    qbsSearchPaths: "qbs"

    Stm32Application {
        name: "Application"

        cpp.includePaths: [
            "../Inc",
            "../Drivers/CMSIS/Include",
            "../Drivers/CMSIS/Device/ST/STM32L1xx/Include",
            "../Drivers/STM32L1xx_StdPeriph_Driver/inc",
            "../Drivers/STMTouch_Driver/inc"
        ]
        cpp.defines: [
            "USE_STDPERIPH_DRIVER",
            "TSLPRM_STM32L1XX_SW_ACQ",
            "STM32L1XX_MD"
        ]
        Properties {
            condition: cpp.debugInformation
            cpp.defines: outer.concat("DEBUG")
        }

        cpp.linkerScripts: [
            "../STM32L152RB_FLASH.ld",
        ]

        Group {
            name: "app"
            prefix: "../"
            files: [
                "Src/*.c",
                "Src/*.cpp",
                "Inc/*.h"
            ]
            cpp.cxxFlags: [ "-std=c++11" ]
            cpp.cFlags: [ "-std=gnu99" ]
            cpp.warningLevel: "all"
        }

        Group {
            name: "stdperiph"
            prefix: "../Drivers/STM32L1xx_StdPeriph_Driver/**/"
            files: [
                "*.c",
                "*.h"
            ]
            excludeFiles: [

            ]
            cpp.cxxFlags: [ "-std=c++11" ]
            cpp.cFlags: [ "-std=gnu99" ]
            cpp.warningLevel: "all"
        }

        Group {
            name: "cmsis"
            prefix: "../Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/"
            files: [
                "TrueSTUDIO/startup_stm32l1xx_md.s"
            ]
            cpp.cxxFlags: [ "-std=c++11" ]
            cpp.cFlags: [ "-std=gnu99" ]
            cpp.warningLevel: "all"
        }

        Group {
            name: "stmtouch"
            prefix: "../Drivers/STMTouch_Driver/**/"
            files: [
                "*.c",
                "*.h"
            ]
            excludeFiles: [
                "tsl_acq_stm32l1xx_hw.h",
                "tsl_acq_stm32l1xx_hw.c",
                "*8l*",
                "*8tl5x*",
                "*32f3xx*",
                "*f0xx*"
            ]
            cpp.cxxFlags: [ "-std=c++11" ]
            cpp.cFlags: [ "-std=gnu99" ]
            cpp.warningLevel: "all"
        }
    }
}

