set(SOURCEC ESMCI_LogErr_F.C ESMC_LogErr.C)
set(SOURCEF ESMF_LogErr_C.F90 ESMF_LogPublic.F90)
set(SOURCEH ESMC_LogErr.h)

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
