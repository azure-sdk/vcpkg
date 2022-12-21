vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b67b46b05939ddff4cb1e2a691127860503b0b22
    SHA512 08f6c7dab04c6628d77bfabff9fcb0c3f9a18408d5542793bdc44da41ffd48579661b081d05bb8cbc9665f6cdeba9498987150aa8cbcf828b27a5279bfbe2e1f
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
