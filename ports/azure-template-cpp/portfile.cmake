vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 146460ec5ac9a9d43b23c32a6a044a32b04c0e9f
    SHA512 41a9a9fdfbf11b533652bcf2e01e5ef2001b8b42ff28db1239ee44f2e97dd7ed8c033d9f1675deb49d17fa2516ec756d4fc8f6e559d0fa854489c0f5dea87fec
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
