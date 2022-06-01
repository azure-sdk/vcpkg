vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 0fd02674fee2b1fefd0608e02320d80376a42b6e
    SHA512 af951a2a631b620e84cb1b0137a8f9b82a8a9aeb6c36d8a2f38b19c40bc99ef8bb56bce278c638a237ccfff0d933907f9ef56d793d2ffb3b382f61d2f4ecbcba
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
