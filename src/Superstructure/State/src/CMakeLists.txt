set(AUTOGEN ESMF_StateInternals.F90 ESMF_StateRemRep.F90 ESMF_StateAPI.F90)
set(SOURCEC )
set(SOURCEF ESMF_StateItem.F90 ESMF_StateContainer.F90 ESMF_StateTypes.F90
            ESMF_StateVa.F90 ESMF_State.F90 ESMF_StateWr.F90 ESMF_StateSet.F90)
set(STOREH  ESMCI_StateItem.h ESMC_State.h)

copy_storeh()

run_cppF90_to_F90()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
