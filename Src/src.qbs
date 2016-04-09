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
            "../Drivers/STM32L1xx_HAL_Driver/Inc"
        ]
        cpp.defines: [
            "USE_HAL_DRIVER",
            "STM32L152xB",
            "ARM_MATH_CM3"
        ]
        Properties {
            condition: cpp.debugInformation
            cpp.defines: outer.concat("DEBUG")
        }

        cpp.linkerScripts: [
            "../STM32L152RB_FLASH.ld",
            //"../TrueSTUDIO/F1032/libs.ld",
        ]

        Group {
            name: "app"
            prefix: "../"
            files: [
                "Src/*.c",
                "Src/*.cpp",
                "Inc/*.h"
            ]
            excludeFiles: [
            ]
            cpp.cxxFlags: [ "-std=c++11" ]
            cpp.cFlags: [ "-std=gnu99" ]
            cpp.warningLevel: "all"
        }

        Group {
            name: "hal"
            prefix: "../Drivers/STM32L1xx_HAL_Driver/**/"
            files: [
                "*.c",
                "*.cpp",
                "*.h"
            ]
            excludeFiles: [
                "stm32f1xx_hal_msp_template.c"
            ]
            cpp.cxxFlags: [ "-std=c++11" ]
            cpp.cFlags: [ "-std=gnu99" ]
            cpp.warningLevel: "all"
        }

        Group {
            name: "cmsis"
            prefix: "../Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/"
            files: [
                "system_stm32l1xx.c",
                "gcc/startup_stm32l152xb.s"
            ]
            cpp.cxxFlags: [ "-std=c++11" ]
            cpp.cFlags: [ "-std=gnu99" ]
            cpp.warningLevel: "all"
        }
    }
}

