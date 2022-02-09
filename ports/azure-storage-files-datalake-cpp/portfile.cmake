vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 1b12863281a7c1f19cf6cb6a9c4bbbbedb71da8e
    SHA512 b7073a838072829d559499b74deb4abf6a72e08ef124abaeda34971ed9c525d1215e4ca8fe30b06e95ef269d28f939a300020c1f06f17dcc453a2afa4bb9fbb3
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-datalake/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
