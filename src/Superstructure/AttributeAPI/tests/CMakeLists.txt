set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

set(AUTOGEN ESMF_AttPackABundleUTest.F90
            ESMF_AttPackArrayUTest.F90
            ESMF_AttPackCplCompUTest.F90
            ESMF_AttPackDistGridUTest.F90
            ESMF_AttPackFBundleUTest.F90
            ESMF_AttPackFieldUTest.F90
            ESMF_AttPackGridCompUTest.F90
            ESMF_AttPackGridUTest.F90
            ESMF_AttPackLocStreamUTest.F90
            ESMF_AttPackSciCompUTest.F90
            ESMF_AttPackStateUTest.F90
            ESMF_AttributeABundleUTest.F90
            ESMF_AttributeArrayUTest.F90
            ESMF_AttributeCplCompUTest.F90
            ESMF_AttributeDistGridUTest.F90
            ESMF_AttributeFBundleUTest.F90
            ESMF_AttributeFieldUTest.F90
            ESMF_AttributeGridCompUTest.F90
            ESMF_AttributeGridUTest.F90
            ESMF_AttributeLocStreamUTest.F90
            ESMF_AttributeSciCompUTest.F90
            ESMF_AttributeStateUTest.F90)

run_cppF90_to_F90()


esmf_add_test(NAME ESMF_AttPackABundleUTest
              SOURCES ESMF_AttPackABundleUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttPackArrayUTest
              SOURCES ESMF_AttPackArrayUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttPackCplCompUTest
              SOURCES ESMF_AttPackCplCompUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttPackDistGridUTest
              SOURCES ESMF_AttPackDistGridUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttPackFBundleUTest
              SOURCES ESMF_AttPackFBundleUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttPackFieldUTest
              SOURCES ESMF_AttPackFieldUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttPackGridCompUTest
              SOURCES ESMF_AttPackGridCompUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttPackGridUTest
              SOURCES ESMF_AttPackGridUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttPackLocStreamUTest
              SOURCES ESMF_AttPackLocStreamUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttPackSciCompUTest
              SOURCES ESMF_AttPackSciCompUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttPackStateUTest
              SOURCES ESMF_AttPackStateUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeArrayUTest
              SOURCES ESMF_AttributeArrayUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeABundleUTest
              SOURCES ESMF_AttributeABundleUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeCplCompUTest
              SOURCES ESMF_AttributeCplCompUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeDistGridUTest
              SOURCES ESMF_AttributeDistGridUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeFBundleUTest
              SOURCES ESMF_AttributeFBundleUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeFieldUTest
              SOURCES ESMF_AttributeFieldUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeGridCompUTest
              SOURCES ESMF_AttributeGridCompUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeGridUTest
              SOURCES ESMF_AttributeGridUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeLocStreamUTest
              SOURCES ESMF_AttributeLocStreamUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeSciCompUTest
              SOURCES ESMF_AttributeSciCompUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeStateUTest
              SOURCES ESMF_AttributeStateUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeUpdateUTest
              SOURCES ESMF_AttributeUpdateUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeUpdateComponentUTest
              SOURCES ESMF_AttributeUpdateComponentUTest.F90
              NP 8
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeUpdateContainerStressUTest
              SOURCES ESMF_AttributeUpdateContainerStressUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeUpdateMultiReconcileUTest
              SOURCES ESMF_AttributeUpdateMultiReconcileUTest.F90
              NP 6
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeUpdateRemoveOnlyUTest
              SOURCES ESMF_AttributeUpdateRemoveOnlyUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeUpdateReconcileUTest
              SOURCES ESMF_AttributeUpdateReconcileUTest.F90
              NP 2
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AttributeUtilUTest
              SOURCES ESMF_AttributeUtilUTest.F90
              NP 2
              LABELS "unit_tests")
