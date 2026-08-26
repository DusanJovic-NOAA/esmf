set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMCI_IO_NetCDF_UtilsUTest
              SOURCES ESMCI_IO_NetCDF_UtilsUTest.C
              NP 1
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_IO_NetCDFUTest
              SOURCES ESMCI_IO_NetCDFUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/io_netcdf_testdata.nc .
")

esmf_add_test(NAME ESMCI_IO_PIOUTest
              SOURCES ESMCI_IO_PIOUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_IO_InqUTest
              SOURCES ESMC_IO_InqUTest.c
              NP 1
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/T42_grid.nc .
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/GRIDSPEC_320x160.nc .
")

esmf_add_test(NAME ESMF_IO_YAMLUTest
              SOURCES ESMF_IO_YAMLUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/fd.yaml .
")

esmf_add_test(NAME ESMF_IOUTest
              SOURCES ESMF_IOUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests"
				  PRE_RUN_SCRIPT "
rm -f doodle*.nc
")

esmf_add_test(NAME ESMF_IO_MultitileUTest
              SOURCES ESMF_IO_MultitileUTest.F90
              NP 8
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
rm -f /ESMF_IO_MultitileUTest*.nc
")

esmf_add_test(NAME ESMF_IO_FileTypeCheckUTest
              SOURCES ESMF_IO_FileTypeCheckUTest.F90
              NP 1
				  MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/filetypecheck_data/*.nc .
")
