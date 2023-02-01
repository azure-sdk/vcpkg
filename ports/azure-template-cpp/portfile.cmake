vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5d6b6f72c1578d561020c71f80d247a2f25b1f36
    SHA512 712fbb253e4f167f33c7ef5f6e6146cd37e92c9c1a288694a29bafb86bb8ae0bf3d44ed42130375f0c199dc336e5c3a5734031e6572199bb2887e7de7de5e954
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
