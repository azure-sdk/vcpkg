vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b22b38dd5ec86fd4a6a11644193d9f035247f1d3
    SHA512 5a7cd88dfbd4e4f68ee5ec6bc773a2b74da536b4bfb435946bd34ab75a7e2325b65732c453f35b17d9eaa3f2ddd385470d5c2a3e4c745d956129103a30afe31b
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-datalake/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_install_cmake()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_fixup_cmake_targets()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
