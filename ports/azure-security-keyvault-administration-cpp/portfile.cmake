vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF c8b028dce071cd3ae582075a5063c875a4b49bad
    SHA512 3afc99ffa77d2b8f73a651e893acb5b1f9b7b44277ee7adc59aa241270c5a0d6df4058aebb7f0fd8135372f6f65b7f43c7ff6867387cdd42a0d4b070a9fb4f67
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-administration/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
