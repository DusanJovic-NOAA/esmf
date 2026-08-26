set(SOURCEC )
set(SOURCEF ESMF_Init.F90 ESMF.F90)
set(STOREH  )

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
