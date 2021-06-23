vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 39c20347f35ee19fb5bc3c8bc2fc98df339158b4
    SHA512 50638f289684c034b9c7cf17e2a2265f6afbdf5f1e9e5f0ba5ba6cf58bd0de338b9c0c0fc9dd935a89292d84e38581753cd0bcb61dfc2b47d8a068598465c1a4
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-shares/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
