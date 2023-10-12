vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f437eb0f23dc3a94a0910df6fa80d72b2a91953d
    SHA512 9df25d81bbf25003864eacec6f8ba425488b0557bad5ec7282474ba0ca189f3a6e283d0df8ca48379fe97dd630a34a0c6bb5e9f32e5aac5d9029cec7cd6e27e8
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
