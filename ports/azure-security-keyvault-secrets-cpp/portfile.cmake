vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e89625e85c787cdf7a929df6400b1e29935866e0
    SHA512 c71fe51547973762b9d04706e12588cc5551c04e194e628941a799581a3b3b94576d55a5b4264d5ff122498a75f0453eae6f491439a4a11ad2c7d63ff9ce55f5
)

if(EXISTS "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-secrets")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/keyvault/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-secrets" "${SOURCE_PATH}/sdk/keyvault/_")
  file(RENAME "${SOURCE_PATH}/sdk/keyvault" "${SOURCE_PATH}/sdk/_")
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
