set(SOURCEC ESMCI_State.C ESMC_State.C ESMCI_State_F.C)
set(SOURCEF ESMF_State_C.F90)
set(STOREH  ESMCI_State.h ESMC_State.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
