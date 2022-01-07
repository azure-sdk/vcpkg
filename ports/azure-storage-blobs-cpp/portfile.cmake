vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 12bae6e64bf4c3012bde6b9841b4fccb5dfc1e38
    SHA512 bd94cdb76f2569113f969dcdab4e0ce1419766a3d4f246839d015fa344ebc1fd04b7decb0957e58bd9bb81936169cb116943936a935a2c0a5d5c1a6a512ae226
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
