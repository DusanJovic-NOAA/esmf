add_executable(ESMF_Regrid ESMF_Regrid.F90)
set_property(TARGET ESMF_Regrid PROPERTY LINKER_LANGUAGE Fortran)

target_link_libraries(ESMF_Regrid esmf)

install(TARGETS ESMF_Regrid)
