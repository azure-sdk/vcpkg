vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ef24dfda2ef64d9282020adc5cb351eac0cf2834
    SHA512 d558e30cba69508e7cc6cb2289da6fe088fa600881543f6f20dac4dffdacc5f23dbf93c3717194b3ed121476861fe2ee6e8e25cf500f5fce46b91fc203e0aa8b
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/attestation/azure-security-attestation/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
