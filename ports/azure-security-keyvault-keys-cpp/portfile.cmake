vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 413b4b7665b2a0365ef44ba3d1e04673d414d2f7
    SHA512 4cc27da3d3e47b2ac954736a05b5906f3fb312eb559573eaa42a911d99e0977450bc907246b8e64e8e8716de1eb9907d7d7e478f9a28fa1b700eae0f4a618946
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
