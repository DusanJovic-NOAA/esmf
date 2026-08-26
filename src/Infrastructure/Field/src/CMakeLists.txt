set(AUTOGEN ESMF_FieldGet.F90 ESMF_FieldEmpty.F90 ESMF_FieldCreate.F90 ESMF_FieldGather.F90 ESMF_FieldScatter.F90)
set(SOURCEC )
set(SOURCEF ESMF_Field.F90 ESMF_FieldPr.F90 ESMF_FieldGetAllocBounds.F90
            ESMF_FieldWr.F90 ESMF_FieldRedist.F90 ESMF_FieldSMM.F90
            ESMF_FieldHalo.F90 ESMF_FieldRegrid.F90 ESMF_FieldSet.F90 ESMF_UtilRWG.F90)
set(STOREH  )

run_cppF90_to_F90()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
