vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e4a18b5eb3b556fae7bde96c43444f27f2fcbdb8
    SHA512 47359d54ca348eb0465b67e04b54994642dd8b0688cfda8bbe3d1bd5fcf7566fe758ae1353f6e537b67c41e74490a397b1eb87a5e8d7090b75c41f8b2333ee44
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-common/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
