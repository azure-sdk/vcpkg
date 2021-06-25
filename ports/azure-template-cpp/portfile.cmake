vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 015c34a0295594dbe6d82bcaffcc6cb70ff5f57f
    SHA512 5a6dc14820a1bfc6a2f486f40b7f95536aeae3d097691893a1ae027c305e10982435265fe20d12ee5e5c0a4a34d7e6cf9471bf492f4f98283ba30c91c36f7df0
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
