set(SOURCEC ESMCI_LocStream_F.C ESMCI_LocStream.C ESMC_LocStream.C)
set(SOURCEF ESMF_LocStream_C.F90)
set(STOREH  ESMC_LocStream.h ESMCI_LocStream.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
