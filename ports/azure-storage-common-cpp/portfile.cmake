vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF fe54edf01770d02242a9968901511a5df0af4d3c
    SHA512 e42ff58cd4823f5ea6fa9f96d3a465edbbcc392d608cc5a9814100ff0c95b639ca18fdb4c34ac4965d1bda4bc398ba1669904a9aaf2e47080570b8b40bd9d2bf
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
