vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF eae7b14f576f7a2dfbd0979bba0b82b5257e49fa
    SHA512 a4f8b99c6ca7fcb1b619a5a11cc36166e26c1a5e4a6062af5be15f56b0b2a36bfb6826e9af8ad701e23225b0c95b2273453cd310264fa536115a5fd9bf5c5854
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
