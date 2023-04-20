vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 00b38d6b9fc4798ddccdd79b37319bc729aadfcc
    SHA512 e25ba92c1e742e72f4bbd9ee841e425fb5906d33846efa6dab4af2a78c63b538ed633c690a1c25cbbcf54a4c8daa50e6957eab3049d9a2ae14beb2e1bc0d153e
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-secrets/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
