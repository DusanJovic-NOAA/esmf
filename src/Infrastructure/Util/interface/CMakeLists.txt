set(SOURCEC ESMCI_Util_F.C ESMC_Util.C ESMCI_F90Interface_F.C ESMC_Interface.C
            ESMCI_Fraction_F.C)
set(SOURCEF ESMF_Util.F90 ESMF_F90Interface.F90 ESMF_Fraction.F90 ESMF_Util_C.F90)

set(STOREH  ESMC_Arg.h ESMC_Interface.h ESMC_Macros.h ESMC_Util.h ESMC_ReturnCodes.h
            ESMC_CoordSys.h)

copy_storeh()

# ESMCI_Util_F.C includes "dmp_diff.hpp" from ../include
set_source_files_properties(ESMCI_Util_F.C DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/../include)

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
