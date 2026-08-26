
set(SOURCEC	ESMCI_IO_NetCDF_Utils.C ESMCI_IO_NetCDF.C ESMCI_IO.C ESMCI_IO_Handler.C ESMCI_IO_Gridspec.C ESMCI_IO_Scrip.C ESMCI_IO_YAML.C)
set(SOURCEF )
set(SOURCEH )
set(STOREH  ESMCI_IO_NetCDF_Utils.h ESMCI_IO_NetCDF.h ESMCI_IO.h ESMCI_IO_Handler.h ESMCI_IO_Gridspec.h ESMCI_IO_Scrip.h ESMCI_IO_YAML.h)

if(ESMF_PIO)
   list(APPEND SOURCEC ESMCI_PIO_Handler.C)
   list(APPEND STOREH  ESMCI_PIO_Handler.h)
endif()

copy_storeh()

# include esmf_io_debug.h
set_source_files_properties(ESMCI_IO.C ESMCI_IO_Handler.C ESMCI_PIO_Handler.C DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/../include)

target_sources(esmf PRIVATE ${SOURCEC})
