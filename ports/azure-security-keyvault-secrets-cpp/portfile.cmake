vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e788cf6303aaf14a3170e34956a806590331c6ef
    SHA512 86b9641dcd06f8a07ef891c4d4f050ba4ebc71afc4d291028df8ecc3b94dba7c3760fc0a649f56b9391a5a4da0efc2a2f082fddb004aa61e9b032348a4e0bc42
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-secrets/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
