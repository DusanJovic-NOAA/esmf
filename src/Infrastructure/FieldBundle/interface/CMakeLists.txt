set(SOURCEC ESMCI_FieldBundle_F.C)
set(SOURCEF ESMF_FieldBundle_C.F90)
set(STOREH  )

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
