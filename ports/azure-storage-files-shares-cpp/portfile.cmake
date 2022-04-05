vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 39d1b844ef3e9bf741ecafb5ca93b445b33608f0
    SHA512 8d91839f5cdfe4cda6c1a7581e610d9764562cb863a0c1c7807961aea621b5cb18221452efb854f86690f5166c9f38b2dbdd07ce93f13b16f47ffd2e92c2d2fc
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-shares/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
