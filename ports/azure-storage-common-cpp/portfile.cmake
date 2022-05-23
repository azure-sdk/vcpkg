vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f3e2f6f2a5c41649c5b67edfc4010b2fa5094cef
    SHA512 60e58c4f0f7e4943f6b2454f32bdc51192e28ee3429c9a98a27515bae3f24ac071ba793e8af165d23fa6f40e6381bbdbf9ab18a67157cb0ca30fd2fd3ab81097
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
