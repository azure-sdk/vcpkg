vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ccb435daa84f40c2dbe945f15c57bc987580dfe9
    SHA512 dc0f20c07e2c8cbb0e4705b4e8433d8cfe5c3e7f718b58a9c4cf4fb23387b90153cce1cd4ed823b7575f696d1939e773dd846b2a47e15e94b29e847447e5f2a7
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-blobs/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
