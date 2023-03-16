vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f8ae5d9d8b641aefcdd664c2c3cf204a072d3934
    SHA512 a5949a5a0afa8af264ea969026b70b1d314566fcc7cac0b25511dbd9c04e957f5dc1dbf8b23fe39ab45a72b0ab11b3191981bc2c6e910e038c656e01f377f598
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
