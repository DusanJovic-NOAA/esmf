set(SOURCEC ESMCI_DELayout_F.C)
set(SOURCEF ESMF_DELayout.F90)
set(STOREH  )

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
