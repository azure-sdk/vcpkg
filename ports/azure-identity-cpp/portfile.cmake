vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 9d14632f1c307e8f00dd4a2e4d15bc7855e31137
    SHA512 0bafbc2bd1c27423b44d27737c8e27fae28566bfd7e808e81ce1b188e9a642d342ac39ee432bf3386b6a56790fce0a172a40fba50aea1b34f049b2c9d43c7f8f
)

if(EXISTS "${SOURCE_PATH}/sdk/identity/azure-identity")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/identity/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/identity/azure-identity" "${SOURCE_PATH}/sdk/identity/_")
  file(RENAME "${SOURCE_PATH}/sdk/identity" "${SOURCE_PATH}/sdk/_")
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
