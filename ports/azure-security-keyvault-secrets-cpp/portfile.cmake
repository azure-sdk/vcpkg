vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF dd0fbec560bb862cd005c060ab5e7defa2a7b12c
    SHA512 c387bec16d5a67dd21e6acef4c18f5d0aeb05c09e41119a181457bba14e161ed6694a82fad016fbd9a53eccdebe1940fbefa730eb7ff7383747b02cb8f4ddffd
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
