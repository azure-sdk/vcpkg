vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 6aec2a380719f73fe497845dd917ffd0a7ee898f
    SHA512 96db6f50bca12832b4a921f92ba2232485ce21eca7d68484a0aa6cee715dbc9e6d12330f63cc1162eebfa1bfb5e76d0c3d75ee95eb6729666507f174e65dfc9b
)

if(EXISTS "${SOURCE_PATH}/sdk/template/azure-template")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/template/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/template/azure-template" "${SOURCE_PATH}/sdk/template/_")
  file(RENAME "${SOURCE_PATH}/sdk/template" "${SOURCE_PATH}/sdk/_")
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
