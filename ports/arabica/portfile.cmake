include(vcpkg_common_functions)

if(VCPKG_TARGET_IS_WINDOWS)
  vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif()

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO jezhiggins/arabica
  REF 2020-April
  SHA512 6397b4ba140acb528ae9cca4a29752363fbe694ecb53b00f7301de108cb0792f961239df2aede00ab95b0d06ac2a220071b8cec3c71b3c14ee562b3af7968c82
  HEAD_REF master
)

set(ARABICA_ROOT ${SOURCE_PATH})
set(ARABICA_INCLUDE_PATH ${ARABICA_ROOT}/include)

if(VCPKG_TARGET_IS_WINDOWS)
  vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
      -DBUILD_ARABICA_EXAMPLES=OFF
      -DBUILD_WITH_BOOST=ON
      "-DCMAKE_CXX_FLAGS=-DARABICA_NO_CODECVT_SPECIALISATIONS=1 -DARABICA_USE_WINSOCK=1 -DARABICA_WINDOWS=1"
      -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON
  )
else()
  vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
      -DBUILD_ARABICA_EXAMPLES=OFF
      -DBUILD_WITH_BOOST=ON
  )
endif()

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/arabica RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")