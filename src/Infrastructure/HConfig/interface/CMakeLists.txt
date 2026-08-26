set(SOURCEC ESMCI_HConfig_F.C)
set(SOURCEF ESMF_HConfig.F90)
set(STOREH  )

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
