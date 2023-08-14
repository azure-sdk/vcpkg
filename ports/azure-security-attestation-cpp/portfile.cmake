vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF d75e140049d41b6c8193f85e5cdb3b1fc3ece8ac
    SHA512 6788f0e63bf337417d58fedc0035e9daf151467f192fa512258fb48dacb6e272e20215a0df1b05fe49e710362deb84f4c70d789e44cbe4460259631db0132515
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/attestation/azure-security-attestation/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
