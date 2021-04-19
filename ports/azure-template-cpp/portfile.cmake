vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF d3d4fdfe2ae999899848d3ad1e78a2765acf9d7d
    SHA512 5780a3fe4c8e76087a94ce0077dd67b3c8ac075af08e3828dfd65d6ea162d56a2fc9bd376ee2a19da8a6f3b9540f0ee9e6df00eeddaf7d2f1ac79b925d972117
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_install_cmake()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_fixup_cmake_targets()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
