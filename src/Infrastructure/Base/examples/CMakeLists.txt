set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_InfoTutorialEx
              SOURCES ESMF_InfoTutorialEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_InfoGetFromHostEx
              SOURCES ESMF_InfoGetFromHostEx.F90
              NP 4
              LABELS "examples_tests")
