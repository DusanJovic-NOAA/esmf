if(ENABLE_INTERNAL_YAMLCPP)
  add_subdirectory(yaml-cpp)
  target_compile_definitions(esmf PRIVATE ESMF_YAMLCPP=1)
endif()

if(ENABLE_UNIT_TESTS)
  add_subdirectory(tests)
endif()
