vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e7995c0fc0b6ee5a8017d5822f56d938fb3d327e
    SHA512 7814e8036fd199254f1339c30b5fdef4a0a39c04362eb41307fdf82e4b190776e1de4528ac13c34e115652e1332b11392013ca46b7ed1f0de6a3cfdd0162c568
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/identity/azure-identity/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
