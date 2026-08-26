set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMC_FieldUTest
              SOURCES ESMC_FieldUTest.c
              NP 1
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -r ${CMAKE_CURRENT_SOURCE_DIR}/data .
chmod u+rw data/*
")

esmf_add_test(NAME ESMC_FieldRegridUTest
              SOURCES ESMC_FieldRegridUTest.c
              NP 1
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_FieldRegridCsrvUTest
              SOURCES ESMC_FieldRegridCsrvUTest.c
              NP 1
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_FieldGridRegridUTest
              SOURCES ESMC_FieldGridRegridUTest.c
              MPIUNI
              NP 1
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_FieldGridRegrid2UTest
              SOURCES ESMC_FieldGridRegrid2UTest.c
              MPIUNI
              NP 1
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_FieldGridRegridCsrvUTest
              SOURCES ESMC_FieldGridRegridCsrvUTest.c
              MPIUNI
              NP 1
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_FieldGridRegridCsrv2UTest
              SOURCES ESMC_FieldGridRegridCsrv2UTest.c
              NP 1
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_FieldGridRegridParUTest
              SOURCES ESMC_FieldGridRegridParUTest.c
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_FieldGridGridRegridUTest
              SOURCES ESMC_FieldGridGridRegridUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_FieldGridGridRegridCsrvUTest
              SOURCES ESMC_FieldGridGridRegridCsrvUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")

# esmf_add_test(NAME ESMC_FieldTripoleRegridUTest
#               SOURCES ESMC_FieldTripoleRegridUTest.c
#               NP 4
#               LABELS "unit_tests")

esmf_add_test(NAME ESMC_FieldSMMFromFileUTest
              SOURCES ESMC_FieldSMMFromFileUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
mkdir -p data
rm -f data/weights_esmc_smmsff.nc
")

esmf_add_test(NAME ESMC_FieldRegridDynMaskPredefSrcUTest
              SOURCES ESMC_FieldRegridDynMaskPredefSrcUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_FieldRegridDynMaskPredefVoteUTest
              SOURCES ESMC_FieldRegridDynMaskPredefVoteUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")




esmf_add_test(NAME ESMF_FieldUTest
              SOURCES ESMF_FieldUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldCreateGetUTest
              SOURCES ESMF_FieldCreateGetUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldRegridCsrvUTest
              SOURCES ESMF_FieldRegridCsrvUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldRegridCsrv2ndUTest
              SOURCES ESMF_FieldRegridCsrv2ndUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldRegridUTest
              SOURCES ESMF_FieldRegridUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldRegridCSUTest
              SOURCES ESMF_FieldRegridCSUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -r ${CMAKE_CURRENT_SOURCE_DIR}/data .
chmod u+rw data/*
")

esmf_add_test(NAME ESMF_FieldArbGridUTest
              SOURCES ESMF_FieldArbGridUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldIOUTest
              SOURCES ESMF_FieldIOUTest.F90
              NP 4
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
rm -f *.nc
")

esmf_add_test(NAME ESMF_FieldRegridXGSMMUTest
              SOURCES ESMF_FieldRegridXGSMMUTest.F90
              NP 2
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldRegridXGUTest
              SOURCES ESMF_FieldRegridXGUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldStressUTest
              SOURCES ESMF_FieldStressUTest.F90
              NP 1
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldGatherUTest
              SOURCES ESMF_FieldGatherUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldRedistUTest
              SOURCES ESMF_FieldRedistUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldLSSMMUTest
              SOURCES ESMF_FieldLSSMMUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldSMMUTest
              SOURCES ESMF_FieldSMMUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldRedistArbUTest
              SOURCES ESMF_FieldRedistArbUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldMeshSMMUTest
              SOURCES ESMF_FieldMeshSMMUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldHaloUTest
              SOURCES ESMF_FieldHaloUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldSMMFromFileUTest
              SOURCES ESMF_FieldSMMFromFileUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
mkdir -p data
rm -f data/test_smm_from_file_weights.nc
rm -f weights_esmf_smmsff.nc
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/../../IO/tests/T42_grid.nc data/
chmod u+rw data/*
")

esmf_add_test(NAME ESMF_FieldRegridDynMaskPredefDstUTest
              SOURCES ESMF_FieldRegridDynMaskPredefDstUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldRegridDynMaskPredefSrcUTest
              SOURCES ESMF_FieldRegridDynMaskPredefSrcUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldRegridDynMaskPredefVoteUTest
              SOURCES ESMF_FieldRegridDynMaskPredefVoteUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldRegridBinnUTest
              SOURCES ESMF_FieldRegridBinnUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

