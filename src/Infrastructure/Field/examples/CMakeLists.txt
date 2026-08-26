set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_FieldCreateEx
              SOURCES ESMF_FieldCreateEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldEx
              SOURCES ESMF_FieldEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldRegridEx
              SOURCES ESMF_FieldRegridEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldRegridMaskEx
              SOURCES ESMF_FieldRegridMaskEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldSphereRegridEx
              SOURCES ESMF_FieldSphereRegridEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldMeshRegridEx
              SOURCES ESMF_FieldMeshRegridEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldRepDimEx
              SOURCES ESMF_FieldRepDimEx.F90
              NP 4
              LABELS "examples_tests")


esmf_add_test(NAME ESMF_FieldArbGridEx
              SOURCES ESMF_FieldArbGridEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldCommEx
              SOURCES ESMF_FieldCommEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldRedistEx
              SOURCES ESMF_FieldRedistEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldSMMEx
              SOURCES ESMF_FieldSMMEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldHaloEx
              SOURCES ESMF_FieldHaloEx.F90
              NP 4
              LABELS "examples_tests")
