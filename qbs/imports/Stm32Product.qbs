import qbs

Product {
    Depends { name: "cpp" }
    
    cpp.commonCompilerFlags: [
        "-mcpu=cortex-m3",
        "-mthumb",
        "-c",
        "-g",
        "-fno-common",
        "-fmessage-length=0",
        "-Wall",
        "-Wextra",
        "-fno-exceptions",
        "-ffunction-sections",
        "-fdata-sections",
        "-fomit-frame-pointer",
//        "-MMD",
//        "-MP"
    ]
    cpp.linkerFlags: [
        "-mcpu=cortex-m3",
        "-mthumb",
        "-Wl,--gc-sections",
        "--specs=nano.specs"
    ]
}
