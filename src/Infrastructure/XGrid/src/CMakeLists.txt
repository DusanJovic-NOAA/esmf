set(SOURCEC )
set(SOURCEF ESMF_XGrid.F90 ESMF_XGridGet.F90 ESMF_XGridCreate.F90)
set(STOREH  )

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
