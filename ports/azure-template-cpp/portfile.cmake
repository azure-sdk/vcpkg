vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF cef3d3144b1005a36194fd126eebf742364b5a6a
    SHA512 6eb047d8931766b883d0f24730f6a7e09f5289a58fe0554100ef2d32a5afc9af4f61178b3f9c7042ba74acc1eb054b68b0444a3ca2a2104703dcdb46fad4e554
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
