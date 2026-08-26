set(SOURCEC ESMCI_Field_F.C ESMCI_Field.C ESMC_Field.C)
set(SOURCEF ESMF_Field_C.F90)
set(STOREH  ESMC_Field.h ESMCI_Field.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
