vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5157acbf6c0e61a2ff62324ef94cbb2c8552c7b5
    SHA512 3edce5a6f91f3aa374be241ef4a1d9da2b4e63e6090b35c16fbc8a54540cff0500ffcf8190c1f1183c6489df68b66cf81412e28502da47675e633cce3efb40c7
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
