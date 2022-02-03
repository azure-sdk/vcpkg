vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 679f5ecbd315aeda4f4de8a778f377186a55ddc3
    SHA512 b038ecbdb3c3957bca6bcb9bc07d1a0812819fa782cd37254317ad574171198c27a5b30648844cb4214038dfae6a4fe7730e4b4eaced4aacbc8baef85f8019e6
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
