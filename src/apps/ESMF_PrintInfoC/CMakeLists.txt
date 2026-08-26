add_executable(ESMF_PrintInfoC ESMF_PrintInfoC.c)
set_property(TARGET ESMF_PrintInfoC PROPERTY LINKER_LANGUAGE C)

target_link_libraries(ESMF_PrintInfoC esmf)

install(TARGETS ESMF_PrintInfoC)
