set(AUTOGEN ESMF_ArrayCreate.F90 ESMF_ArrayGet.F90 ESMF_ArrayGather.F90 ESMF_ArrayScatter.F90)
set(SOURCEC ESMCI_Array_F.C ESMC_Array.C ESMC_DynamicMask.C ESMCI_DynamicMask.C)
set(SOURCEF ESMF_DynamicMask.F90 ESMF_ArrayHa.F90 ESMF_Array.F90 ESMF_DynamicMaskProcDst.F90
            ESMF_DynamicMaskProcSrc.F90 ESMF_DynamicMaskProcVote.F90 ESMF_DynamicMask_C.F90)

set(STOREH  ESMC_Array.h ESMC_DynamicMask.h ESMCI_DynamicMask.h)

copy_storeh()

run_cppF90_to_F90()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
