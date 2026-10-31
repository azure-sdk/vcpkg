# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 183a568af2b08756019adfd1aa8785e9463b1161
    SHA512 ac1c5ea7a0f331de44ac372f2d2e8651dcc180cba29150926de3762c627d3dadc4aaa4595d734eee32299f39ef3d41df3bc00b2bb7b70becad6b13e8b5d32b9e
    HEAD_REF main
)

file(GLOB_RECURSE unused "${SOURCE_PATH}/cgmanifest.json")
file(REMOVE_RECURSE ${unused})

file(GLOB_RECURSE unused "${SOURCE_PATH}/Cargo.toml")
file(REMOVE_RECURSE ${unused})

file(GLOB_RECURSE unused "${SOURCE_PATH}/Cargo.lock")
file(REMOVE_RECURSE ${unused})

if(EXISTS "${SOURCE_PATH}/sdk/appconfiguration/azure-data-appconfiguration")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/appconfiguration/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/appconfiguration/azure-data-appconfiguration" "${SOURCE_PATH}/sdk/appconfiguration/_")
  file(RENAME "${SOURCE_PATH}/sdk/appconfiguration" "${SOURCE_PATH}/sdk/_")
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
