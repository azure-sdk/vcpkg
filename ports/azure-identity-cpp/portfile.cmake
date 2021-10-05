vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e5f190c7a504f7aea3ac499a1c82fb8255650a69
    SHA512 9a66e2ce1d38786514215bab22f841df4daa79a847dfcbf773bd4afccbdf9c5d4166bc82ef13069c3af0f5d1845a52741b4f42f65db3b8719fa49da22ec455ee
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
