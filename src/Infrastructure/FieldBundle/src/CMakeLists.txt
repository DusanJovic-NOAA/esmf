set(AUTOGEN ESMF_FieldBundle.F90)
set(SOURCEC )
set(SOURCEF )
set(STOREH  )

run_cppF90_to_F90()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
