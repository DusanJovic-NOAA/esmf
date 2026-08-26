set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_VMDefaultBasicsEx
              SOURCES ESMF_VMDefaultBasicsEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMGetMPICommunicatorEx
              SOURCES ESMF_VMGetMPICommunicatorEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMUserMpiEx
              SOURCES ESMF_VMUserMpiEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMUserMpiCommEx
              SOURCES ESMF_VMUserMpiCommEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMUserMpiCommMultiEx
              SOURCES ESMF_VMUserMpiCommMultiEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMComponentEx
              SOURCES ESMF_VMComponentEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMControlMPIThreadSupportEx
              SOURCES ESMF_VMControlMPIThreadSupportEx.F90
              NP 4
              MPIUNI
              MPIRUN_ENV "ESMF_RUNTIME_MPI_THREAD_SUPPORT=MPI_THREAD_SINGLE"
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMSendVMRecvEx
              SOURCES ESMF_VMSendVMRecvEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMNonBlockingEx
              SOURCES ESMF_VMNonBlockingEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMScatterVMGatherEx
              SOURCES ESMF_VMScatterVMGatherEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMAllFullReduceEx
              SOURCES ESMF_VMAllFullReduceEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_VMHigherRankDataEx
              SOURCES ESMF_VMHigherRankDataEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")
