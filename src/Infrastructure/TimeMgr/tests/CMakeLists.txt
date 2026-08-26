set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMC_ClockUTest
              SOURCES ESMC_ClockUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_TimeIntervalUTest
              SOURCES ESMC_TimeIntervalUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_TimeUTest
              SOURCES ESMC_TimeUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_CalendarUTest
              SOURCES ESMC_CalendarUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_CalendarUTest
              SOURCES ESMF_CalendarUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_AlarmUTest
              SOURCES ESMF_AlarmUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ClockUTest
              SOURCES ESMF_ClockUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_CalRangeUTest
              SOURCES ESMF_CalRangeUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_TimeIntervalUTest
              SOURCES ESMF_TimeIntervalUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_TimeUTest
              SOURCES ESMF_TimeUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")
