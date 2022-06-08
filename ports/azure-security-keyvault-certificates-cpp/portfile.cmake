vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 99f45a5f18f20f44e87556c4f240c055c5e4c2d2
    SHA512 bdc50af0a8b415cfdc983d9da30a15dcdb5d7fa098fc4e143acbab317f80f0a1206f196fa30d3edaf542197e049de31c8f16ac31a740d59633524902e633ac62
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
