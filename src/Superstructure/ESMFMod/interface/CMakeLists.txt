set(SOURCEC ESMCI_Init.C ESMC_Init.C ESMCI_Init_F.C)
set(SOURCEF ESMF_Init_C.F90)
set(STOREH  ESMC_Init.h ESMC.h ESMCI_Init.h ESMCI.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
