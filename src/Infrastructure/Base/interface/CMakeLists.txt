
set(SOURCEC	ESMCI_Base_F.C)
set(SOURCEF ESMF_Base.F90 ESMF_FactorRead.F90 ESMF_Info.F90)

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
