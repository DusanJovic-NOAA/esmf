set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_AppMainEx
              SOURCES ESMF_AppMainEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests"
              PRE_RUN_SCRIPT "
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/setup.rc .
")

esmf_add_test(NAME ESMF_CplEx
              SOURCES ESMF_CplEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_GCompEx
              SOURCES ESMF_GCompEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_SCompEx
              SOURCES ESMF_SCompEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_CompTunnelEx
              SOURCES ESMF_CompTunnelEx.F90
              NP 6
              LABELS "examples_tests")
