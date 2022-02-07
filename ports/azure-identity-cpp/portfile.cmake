vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5290690be0b779e0c0c7b22f10cfc4d6c99eb051
    SHA512 6c3e6711276ea6dce5c1b2861dd5579c2143cf9e7d010217649b5bfd9a2e0c9c84452bb6466c6bd1cdf6002d63bc5a63f6ee947ae56c30a3137d5d8635aa1a83
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
