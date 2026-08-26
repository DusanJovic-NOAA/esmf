set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_ArrayFarrayEx
              SOURCES ESMF_ArrayFarrayEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArrayFarrayHaloEx
              SOURCES ESMF_ArrayFarrayHaloEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArrayLarrayEx
              SOURCES ESMF_ArrayLarrayEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArrayEx
              SOURCES ESMF_ArrayEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArrayScatterGatherEx
              SOURCES ESMF_ArrayScatterGatherEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArrayHaloEx
              SOURCES ESMF_ArrayHaloEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArrayArbHaloEx
              SOURCES ESMF_ArrayArbHaloEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArrayRedistEx
              SOURCES ESMF_ArrayRedistEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArraySparseMatMulEx
              SOURCES ESMF_ArraySparseMatMulEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArrayScatterGatherArbEx
              SOURCES ESMF_ArrayScatterGatherArbEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArrayCommNBEx
              SOURCES ESMF_ArrayCommNBEx.F90
              NP 4
              LABELS "examples_tests")
