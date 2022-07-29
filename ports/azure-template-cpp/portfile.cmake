vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 9eae0dff88df72b19f6853709a30b3126e4464d0
    SHA512 1b95f0e0a485e001ede773ec69ea1c1dc249f5b0cf56a8a872ff7e67676dfdd95df831ec2f4274c35ab60b3130e682ed9b3b52a7dd71501a4e4ae3e4984f1978
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
