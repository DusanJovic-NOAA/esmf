set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMC_VMUTest
              SOURCES ESMC_VMUTest.c
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMUTest
              SOURCES ESMF_VMUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMAccUTest
              SOURCES ESMF_VMAccUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMOpenMPUTest
              SOURCES ESMF_VMOpenMPUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMUserMpiInitUTest
              SOURCES ESMF_VMUserMpiInitUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMSendVMRecvUTest
              SOURCES ESMF_VMSendVMRecvUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMSendNbVMRecvNbUTest
              SOURCES ESMF_VMSendNbVMRecvNbUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMSendRecvUTest
              SOURCES ESMF_VMSendRecvUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMSendRecvNbUTest
              SOURCES ESMF_VMSendRecvNbUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMScatterUTest
              SOURCES ESMF_VMScatterUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMGatherUTest
              SOURCES ESMF_VMGatherUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMAllGatherUTest
              SOURCES ESMF_VMAllGatherUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMAllGatherVUTest
              SOURCES ESMF_VMAllGatherVUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMBroadcastUTest
              SOURCES ESMF_VMBroadcastUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMAllToAllUTest
              SOURCES ESMF_VMAllToAllUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMAllToAllVUTest
              SOURCES ESMF_VMAllToAllVUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMBarrierUTest
              SOURCES ESMF_VMBarrierUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMEpochLargeMsgUTest
              SOURCES ESMF_VMEpochLargeMsgUTest.F90
              NP 2
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_VMComponentUTest
              SOURCES ESMF_VMComponentUTest.F90
              NP 4
              LABELS "unit_tests")
