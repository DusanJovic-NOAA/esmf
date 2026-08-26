set(SOURCEC ESMCI_Trace_F.C ESMC_Trace.C)
set(SOURCEF	ESMF_Trace.F90)
set(STOREH  ESMC_Trace.h)

copy_storeh()

set_source_files_properties(ESMCI_Trace_F.C ESMC_Trace.C DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/../include)

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
