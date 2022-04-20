vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 225e8ff9142c164cfb61ccc6f0e92c334825c8d8
    SHA512 f1ab683a904a8046a4358a3155c8c58bf9c0f08f0f6d3a6aeaa4f691ae4a4c6dd90a0aef321a6656427053c4000ffd7a2d6d914b4a8db3f3bce3157d9dab4e0c
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-keys/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
