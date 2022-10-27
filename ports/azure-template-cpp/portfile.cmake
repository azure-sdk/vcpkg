vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 7cc5f4628be5fab7c77710d3ec7f589113b4eeeb
    SHA512 139278a0567b3c99447f8791ecf7a1ef360fc2b0e502fcdad5e7074e0c13b3108c33d3b3fc1db2aaf2b65d33d5ecd521920ef8d047cf46774a3d6014c4c3c353
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
