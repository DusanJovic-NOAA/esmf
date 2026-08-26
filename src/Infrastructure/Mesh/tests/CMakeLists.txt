set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

include_directories(../include ../include/Legacy ../include/Regridding)
if(ESMF_MOAB STREQUAL "internal")
include_directories(../.. ../src/Moab ../src/Moab/parallel ../src/Moab/LocalDiscretization)
endif()


esmf_add_test(NAME ESMCI_MBMesh_ExtrapolateUTest
              SOURCES ESMCI_MBMesh_ExtrapolateUTest.C
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_MBMesh_UtilUTest
              SOURCES ESMCI_MBMesh_UtilUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_MeshCapGenUTest
              SOURCES ESMCI_MeshCapUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
# remove the old alternate test file in the source directory
rm -f ${CMAKE_CURRENT_SOURCE_DIR}/ESMCI_MeshCapGenUTest.C
# copy the source file to the execution directory under the new name
cp ${CMAKE_CURRENT_SOURCE_DIR}/ESMCI_MeshCapUTest.C ESMCI_MeshCapGenUTest.C
"
              POST_RUN_SCRIPT "
# move the updated source file from the execution directory to the source directory
mv ESMCI_MeshCapGenUTest.C ${CMAKE_CURRENT_SOURCE_DIR}/ESMCI_MeshCapGenUTest.C
")

esmf_add_test(NAME ESMCI_MeshCapRegridGenUTest
              SOURCES ESMCI_MeshCapRegridUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
# remove the old alternate test file in the source directory
rm -f ${CMAKE_CURRENT_SOURCE_DIR}/ESMCI_MeshCapRegridGenUTest.C
# copy the source file to the execution directory under the new name
cp ${CMAKE_CURRENT_SOURCE_DIR}/ESMCI_MeshCapRegridUTest.C ESMCI_MeshCapRegridGenUTest.C
"
              POST_RUN_SCRIPT "
# move the updated source file from the execution directory to the source directory
mv ESMCI_MeshCapRegridGenUTest.C ${CMAKE_CURRENT_SOURCE_DIR}/ESMCI_MeshCapRegridGenUTest.C
")

esmf_add_test(NAME ESMCI_MeshMOABUTest
              SOURCES ESMCI_MeshMOABUTest.C
              NP 1
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_IntegrateUTest
              SOURCES ESMCI_IntegrateUTest.C
              NP 1
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_MeshUTest
              SOURCES ESMCI_MeshUTest.C
              NP 1
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -r ${CMAKE_CURRENT_SOURCE_DIR}/data .
")

esmf_add_test(NAME ESMC_MeshUTest
              SOURCES ESMC_MeshUTest.c
              NP 1
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -r ${CMAKE_CURRENT_SOURCE_DIR}/data .
")

esmf_add_test(NAME ESMCI_DInfoUTest
              SOURCES ESMCI_DInfoUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_MeshVTKUTest
              SOURCES ESMC_MeshVTKUTest.c
              NP 6
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -r ${CMAKE_CURRENT_SOURCE_DIR}/data .
chmod u+rw data/*
")

esmf_add_test(NAME ESMF_MeshOpUTest
              SOURCES ESMF_MeshOpUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_MeshUTest
              SOURCES ESMF_MeshUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_MeshFileIOUTest
              SOURCES ESMF_MeshFileIOUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -r ${CMAKE_CURRENT_SOURCE_DIR}/data .
")

esmf_add_test(NAME ESMCI_Proj4UTest
              SOURCES ESMCI_Proj4UTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests")
