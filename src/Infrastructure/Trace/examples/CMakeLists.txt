set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_TraceEx
              SOURCES ESMF_TraceEx.F90
              NP 4
              MPIUNI
              MPIRUN_ENV "ESMF_RUNTIME_TRACE=ON"
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_TraceUserEx
              SOURCES ESMF_TraceUserEx.F90
              NP 4
              MPIUNI
              MPIRUN_ENV "ESMF_RUNTIME_TRACE=ON"
              LABELS "examples_tests")
