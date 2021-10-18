vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5d4024f6838fd832a2e6ae5aee2a165c369fbe8e
    SHA512 36229a4ac3d83d8f11e759099f6f44b58159fde73c08bc0e077b9e2df0911a993f9ec9c6501ec8d45c66b051ee00790d768bbbb1eb8bcf472c35ddb4af33f3e4
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-queues/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
