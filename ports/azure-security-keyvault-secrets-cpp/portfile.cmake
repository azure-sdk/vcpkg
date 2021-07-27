vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f5ab6a525256ed0bb0fea1b7f4f9c559f850d2a0
    SHA512 21a67ea1d18a1ddb330146c57823c2be1c3c5c47e05b4a5c7503c96acef2edfb7534f6f1d01d8bf7aab138d2c8cabd0af64b49f79606f1733195317a07ca822c
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-secrets/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
