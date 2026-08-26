set(SOURCEC ESMCI_Test.C ESMC_Test.C)
set(SOURCEF ESMF_Test.F90 ESMF_ComplianceIC.F90)
set(STOREH  ESMCI_Test.h ESMC_Test.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
