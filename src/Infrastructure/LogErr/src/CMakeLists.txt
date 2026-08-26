
set(SOURCEC	ESMCI_LogErr.C)
set(SOURCEF )
set(SOURCEH )
set(STOREH ESMC_LogErr.h ESMCI_LogErr.h)

copy_storeh()

# ESMCI_LogErr.C includes "ESMCI_ErrMsgs.C" from ../include
set_source_files_properties(ESMCI_LogErr.C DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/../include)

target_sources(esmf PRIVATE ${SOURCEC})
