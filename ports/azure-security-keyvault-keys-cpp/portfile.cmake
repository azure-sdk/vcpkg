vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b5ee71b676a476dd654969ce10e3746b61b59d65
    SHA512 2758ce6e027b1d0e8d86a6bcfadc9540510bfdf6f7ca33d3d2ab58b337e0efdc232254f03757e3b6550f63b6c8bace4dd3915d1f6de1828b290b9fc13a73e930
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-keys/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
