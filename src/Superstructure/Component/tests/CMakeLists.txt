set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

set(PRE_RUN_SCRIPT "
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/comp.yaml .
")

esmf_add_test(NAME ESMF_ComponentUTest
              SOURCES ESMF_ComponentUTest.F90
              NP 4
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})

esmf_add_test(NAME ESMF_GridCompCreateUTest
              SOURCES ESMF_GridCompCreateUTest.F90
              NP 4
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})

esmf_add_test(NAME ESMF_CplCompCreateUTest
              SOURCES ESMF_CplCompCreateUTest.F90
              NP 4
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})

esmf_add_test(NAME ESMF_SciCompCreateUTest
              SOURCES ESMF_SciCompCreateUTest.F90
              NP 4
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})

esmf_add_test(NAME ESMF_CompSetServUTest
              SOURCES ESMF_CompSetServUTest.F90 ESMF_SetServCode.F90
              NP 4
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})

esmf_add_test(NAME ESMF_StdCompMethodsUTest
              SOURCES ESMF_StdCompMethodsUTest.F90
              NP 4
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})

esmf_add_test(NAME ESMF_CompTunnelUTest
              SOURCES ESMF_CompTunnelUTest.F90
              NP 8
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})

esmf_add_test(NAME ESMC_ComponentUTest
              SOURCES ESMC_ComponentUTest.c ESMF_MyRegistrationInFortran.F90
              NP 4
				  LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})
