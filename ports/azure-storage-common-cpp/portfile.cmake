vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 411331d0ec9af29a92f8312993e9e762837b6ad9
    SHA512 ef2b86aa3d74344889d9d59fabaad28252bc5d175d9bc63946415d7f66cbae2f361dc6dbd38bfd298e9dd8656a7a8d46449bd1395cba9d51dd1bca87656876ea
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
