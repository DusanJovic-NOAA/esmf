set(SOURCEC ESMCI_RHandle_F.C ESMC_RHandle.C)
set(SOURCEF ESMF_RHandle.F90)
set(STOREH  ESMC_RHandle.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
