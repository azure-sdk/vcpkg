vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 2a734423c19f638c45f75bd73095d6d4b0442cdc
    SHA512 1
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-queues/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
