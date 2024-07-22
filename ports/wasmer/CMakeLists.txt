cmake_minimum_required(VERSION 3.11)
project(wasmer)
# Refs: https://gitlab.kitware.com/cmake/community/-/wikis/doc/tutorials/Exporting-and-Importing-Targets

add_library(wasmer STATIC IMPORTED)

set_property(TARGET wasmer PROPERTY IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/lib/libwasmer.a")
# set_target_properties(wasmer PROPERTIES INTERFACE_INCLUDE_DIRECTORIES  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_include_directories(wasmer INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/wasmer>
  $<INSTALL_INTERFACE:include/wasmer>  # <prefix>/include/wasmer
)

# message(FATAL_ERROR "CMAKE_INSTALL_LIBDIR: ${CMAKE_INSTALL_LIBDIR}")
# message(FATAL_ERROR "CMAKE_INSTALL_PREFIX: ${CMAKE_INSTALL_PREFIX}")

install( FILES "${CMAKE_CURRENT_SOURCE_DIR}/lib/libwasmer.a"
    # ARCHIVE 
    DESTINATION "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}"
    # PUBLIC_HEADER DESTINATION "include/wasmer"
)
install( FILES "${CMAKE_CURRENT_SOURCE_DIR}/include/wasmer.hh"
    # ARCHIVE 
    DESTINATION "${CMAKE_INSTALL_PREFIX}/include"
    # PUBLIC_HEADER DESTINATION "include/wasmer"
)
# if(NOT DISABLE_INSTALL_HEADERS)
# install( FILES wasmer PUBLIC_HEADER DESTINATION include/alac)
# endif()
# install( FILES wasmer PUBLIC_HEADER 
#     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/wasmer
# )