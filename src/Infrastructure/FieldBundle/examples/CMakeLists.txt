set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_FieldBundleCreateEx
              SOURCES ESMF_FieldBundleCreateEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldBundleRedistEx
              SOURCES ESMF_FieldBundleRedistEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldBundleSMMEx
              SOURCES ESMF_FieldBundleSMMEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_FieldBundleHaloEx
              SOURCES ESMF_FieldBundleHaloEx.F90
              NP 4
              LABELS "examples_tests")
