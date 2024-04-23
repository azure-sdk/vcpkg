# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 886f01def1f60eb02d360e1a486da7f96f429f3a
    SHA512 6aad9c4b50c45d53a5b7424d2a0bf5fe981bdc8a9c4446d555fe1d51aad213de5c5666b90323662b04a48cd0f64f39debba0ef9d3acc5efe8b60a78a077bc598
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
