vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 80cf3d09fdebbf4a427a0a8b89d054250bb48ec9
    SHA512 d908f93ebcb31f6fefdd85cfcbb456e52b816344f5bf873bfc0f46b5c76fb510ec5918ae2283ec18392d1aed403f98c7b55aa7370e50c62bfab5fc1e2e7340c9
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
