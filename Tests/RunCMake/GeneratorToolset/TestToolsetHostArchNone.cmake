message(STATUS "CMAKE_VS_PLATFORM_TOOLSET='${CMAKE_VS_PLATFORM_TOOLSET}'")
message(STATUS "CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE='${CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE}'")

if(CMAKE_GENERATOR MATCHES "Visual Studio 1[6]")
  cmake_host_system_information(RESULT is_64_bit QUERY IS_64BIT)
  if(is_64_bit)
    if(NOT "${CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE}" STREQUAL "x64")
      message(FATAL_ERROR "CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE is not 'x64' as expected.")
    endif()
  endif()
else()
  if(NOT "${CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE}" STREQUAL "")
    message(FATAL_ERROR "CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE is not empty as expected.")
  endif()
endif()
