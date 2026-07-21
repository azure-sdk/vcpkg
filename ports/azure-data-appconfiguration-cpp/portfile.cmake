# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ae0aa269433de33de1f382c62577f220b871ee3a
    SHA512 0e9aafc1b7efe1aa7ef0c3400d15b56e820b527e47de995bff3c32ef6698089707c6aabae0fa03fc14fdaa65b5ca143d827fd40b39040a949877ceb3fad8cc47
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
