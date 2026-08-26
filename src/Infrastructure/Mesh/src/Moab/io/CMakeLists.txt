set(SOURCEC
	ExoIIUtil.cpp FileTokenizer.cpp GmshUtil.cpp
	IODebugTrack.cpp ReadABAQUS.cpp ReadGmsh.cpp
	ReadIDEAS.cpp ReadMCNP5.cpp
	ReadNASTRAN.cpp ReadOBJ.cpp ReadRTT.cpp ReadSmf.cpp ReadSms.cpp
	ReadSTL.cpp ReadTemplate.cpp ReadTetGen.cpp ReadVtk.cpp
	SMF_State.cpp Tqdcfr.cpp VtkUtil.cpp WriteAns.cpp
	WriteGmsh.cpp WriteGMV.cpp
	WriteSmf.cpp WriteSTL.cpp WriteTemplate.cpp WriteVtk.cpp)

if(ESMF_NETCDF)
    list(APPEND SOURCEC NCHelper.cpp NCHelperEuler.cpp NCHelperFV.cpp
  NCHelperGCRM.cpp NCHelperHOMME.cpp NCHelperMPAS.cpp
  NCWriteEuler.cpp NCWriteFV.cpp NCWriteGCRM.cpp
  NCWriteHelper.cpp NCWriteHOMME.cpp NCWriteMPAS.cpp
  ReadNC.cpp ReadNCDF.cpp)
endif()

set(SOURCEF )
set(STOREH  )

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            COMPILE_DEFINITIONS "IS_BUILDING_MB;HAVE_VSNPRINTF;LINUX;USE_MPI")

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            INCLUDE_DIRECTORIES
                           "${CMAKE_CURRENT_SOURCE_DIR}/..;${CMAKE_CURRENT_SOURCE_DIR}/../parallel")

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
