add_executable(ESMF_PrintInfo ESMF_PrintInfo.F90)
set_property(TARGET ESMF_PrintInfo PROPERTY LINKER_LANGUAGE Fortran)

target_link_libraries(ESMF_PrintInfo PRIVATE esmf)

install(TARGETS ESMF_PrintInfo)
