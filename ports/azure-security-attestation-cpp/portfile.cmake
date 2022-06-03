vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 3a26df28525807c1dfc4b8f481cd166be6b3438b
    SHA512 9bc471fa6e3ed5af1b9d8bab2da2251ddbeacb25b3ad2724a66ac5ef66a1b4ca3858869504488a95ebf6ddcf4bfe8fc1a2a9954ee5e81e27541b8e70389dcdeb
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/attestation/azure-security-attestation/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
