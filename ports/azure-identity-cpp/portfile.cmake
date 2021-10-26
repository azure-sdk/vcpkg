vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a9094d0933ad7e804928c60208fd3bfd1ef9b4c6
    SHA512 9e091c520ad169d5299a3826b908dcffbf47a887ee30a4ad3de2723b00dc04a3b60640913eedb6cc071cf7bf6536d54d7f0996e41945ad641b4690d93bf2d0b9
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
