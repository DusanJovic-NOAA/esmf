set(SOURCEC )
set(SOURCEF ESMF_RegridWeightGenCheck.F90 ESMF_RegridWeightGen.F90 ESMF_FileRegrid.F90 ESMF_FileRegridCheck.F90)
set(STOREH  )

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
