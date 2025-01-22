# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f2b8257b8f410d19ed06fd3c92060b45be61128c
    SHA512 90f134b35025902fde160658a174ecae8aa547c5d294cb84d55203d484535ccfeca94bbc6ff21c31c008ee8b08c87a2199887fab8351603525a2bb7c9e2d50c3
    HEAD_REF main
)

if(EXISTS "${SOURCE_PATH}/sdk/tables/azure-data-tables")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/tables/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/tables/azure-data-tables" "${SOURCE_PATH}/sdk/tables/_")
  file(RENAME "${SOURCE_PATH}/sdk/tables" "${SOURCE_PATH}/sdk/_")
  file(RENAME "${SOURCE_PATH}/sdk" "${SOURCE_PATH}/_")
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/_/_/_"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
