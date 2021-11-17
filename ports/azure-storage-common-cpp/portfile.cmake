vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5e0f1c9ac888c8e55f677671a43ab18625d5974f
    SHA512 48b1abeb40e5a3e75a2082c53839d46c21f849c55ec9217ef06c7dec5afbd0dd64febb8ee8d8509c27073bc2cc3b3d60ae0bb04d5aaf9c84a56288de4bbb8dcb
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-common/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
