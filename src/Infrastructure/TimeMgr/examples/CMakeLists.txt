set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_TimeEx
              SOURCES ESMF_TimeEx.F90
              NP 1
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_TimeIntervalEx
              SOURCES ESMF_TimeIntervalEx.F90
              NP 1
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_CalendarEx
              SOURCES ESMF_CalendarEx.F90
              NP 1
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ClockEx
              SOURCES ESMF_ClockEx.F90
              NP 1
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_AlarmEx
              SOURCES ESMF_AlarmEx.F90
              NP 1
              MPIUNI
              LABELS "examples_tests")

