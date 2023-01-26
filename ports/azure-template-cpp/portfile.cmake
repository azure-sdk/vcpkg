vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 74a1ad7714b90ca5dd6bafa0a839978db1e6a6b6
    SHA512 0dfc683638df4ab0e839f69e382276a39f36fcb063b282f72f3fb6b933b9d4b3b0b16afb8d755409eeda1b80d44772c41f5d1b7db7e32e1df186844864fda9a9
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
