vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF d693099d44c4f965cde6ff06d6f3cd0358ef01a8
    SHA512 2583f6a73d7432daced6bd45aac14d4b972298e1ba3edb891df7e18ef25a7209f8c0d039460518bb16d7d5a26ed5c0d6cafd2caed6406deb7c4ef889eeefe90c
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
