vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5ddcbe8cc09a0a08f2a0e169b7cd4a45c92d1f54
    SHA512 4a3d659c3dc13eabb1b48b63d6810c7854b45df539992d6c3b17c7a8e0fd0cba001fbfb1882f53a93251029eb2006830ffcf40555a51a87704a0a253b6cc7e0b
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
