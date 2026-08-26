set(SOURCEC
  V_EdgeMetric.cpp VerdictVector.cpp VerdictWrapper.cpp
  V_GaussIntegration.cpp V_HexMetric.cpp V_KnifeMetric.cpp
  V_PyramidMetric.cpp V_QuadMetric.cpp V_TetMetric.cpp
  V_TriMetric.cpp V_WedgeMetric.cpp)

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            COMPILE_DEFINITIONS "IS_BUILDING_MB;HAVE_VSNPRINTF;LINUX;USE_MPI")

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            INCLUDE_DIRECTORIES
                           "${CMAKE_CURRENT_SOURCE_DIR}/..")

target_sources(esmf PRIVATE ${SOURCEC})
