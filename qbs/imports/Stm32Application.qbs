import qbs

Stm32Product {
    type: "application" // To suppress bundle generation on Mac
    consoleApplication: true
    
    cpp.positionIndependentCode: false
//    cpp.executableSuffix: ".elf"
    cpp.linkerFlags: {
        return base;
    }
}
