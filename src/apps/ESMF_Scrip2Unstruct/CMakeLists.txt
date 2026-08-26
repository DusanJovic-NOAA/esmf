add_executable(ESMF_Scrip2Unstruct ESMF_Scrip2Unstruct.C)
set_property(TARGET ESMF_Scrip2Unstruct PROPERTY LINKER_LANGUAGE CXX)

if(ESMF_MOAB STREQUAL internal)
  set_source_files_properties(ESMF_Scrip2Unstruct.C DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTIES
                               INCLUDE_DIRECTORIES
                              "${CMAKE_SOURCE_DIR}/src/Infrastructure")
endif()

target_link_libraries(ESMF_Scrip2Unstruct esmf)

install(TARGETS ESMF_Scrip2Unstruct)
