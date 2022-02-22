vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 0fd5d9cd9a8ca8d2f8b37c1a5d6d835a9c284002
    SHA512 d0a841fcf599b5c6efc90b94ce0d7c7e8b8ab99e86ca6e08a4cd57ff9c0ca5e56d671f45c042986527b9758dd38b7b2f4a58156678ce6f757557501624b38049
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-certificates/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
