vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 699957280939d4ba7d8c6e0606f0b71cd59f2970
    SHA512 6b84afe3abd13ca519e3d7ca596e7c2a56e4b6684ad992ca143df3fc169e8d7dfe1deb9c2781c4b32b602a2ec11e93016bce941418c2711ca040de2c1a68eb0e
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
