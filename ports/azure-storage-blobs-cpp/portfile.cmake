vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 41cda0d34d045912a0bd289825dddf1ea44ff0c2
    SHA512 052e26be7e7aa34cca07f6c34c0ae6f2f7afec9c7e83560d825d2b661843c465ebaa6b3d82b052eaffbc33c9cd86b148a0e2a9e805bfd71bd92ef8d4e8c3987a
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
