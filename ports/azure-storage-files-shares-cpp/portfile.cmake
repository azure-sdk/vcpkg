vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF af44672837da5a1ce0cb2e33f34f2e0108d93240
    SHA512 8cc53dbb33d3ec470f84b489a0645138251d88cc8dcb7b3c8a97393e173a5fa8d31e829986a8b45577f87e036b770ac3559cc286ee6aa25b23399c9e0c9dd7c8
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
