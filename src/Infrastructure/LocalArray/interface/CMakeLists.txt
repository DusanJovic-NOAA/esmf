set(AUTOGEN ESMF_LocalArrayWrapperType.F90 ESMF_LocalArrayCreate.F90 ESMF_LocalArrayGet.F90)
set(SOURCEC ESMCI_LocalArray_F.C)
set(SOURCEF ESMF_LocalArray.F90 ESMF_LocalArray_C.F90)
set(STOREH  )

run_cppF90_to_F90()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
