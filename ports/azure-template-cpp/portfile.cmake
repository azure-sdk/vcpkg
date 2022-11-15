vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF dd8a5ef5425f930b4fa2c7992812a98b7c37292e
    SHA512 d2fb5765d19da1448a2fe793fb2c5c8ef3c8aa12d26547fcf61325ac4136fc2c3a6497fc2d6e1d930ed8429edfd5dfd269b0c3d8772fb4eac90c7979739159a3
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
