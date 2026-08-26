set(SOURCEC ESMCI_ArraySpec.C ESMC_ArraySpec.C)
set(SOURCEF ESMF_ArraySpec_C.F90)
set(STOREH  ESMCI_ArraySpec.h ESMC_ArraySpec.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
