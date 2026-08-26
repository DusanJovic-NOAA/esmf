set(SOURCEC ESMC_Config.C)
set(SOURCEF ESMF_Config_C.F90)
set(STOREH  ESMC_Config.h ESMCI_Config.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
