vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a4f2e510e58ca5077ab3d28717a6dd22c58e2ced
    SHA512 21b8967be8f4254cdeadb62b32c13c3e3280ab253a7aa5bb0096c44d7e370b1485dbfe5148f18af7d2b770de53b75d654d32705c8c6181c28544d1a69684ea53
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
