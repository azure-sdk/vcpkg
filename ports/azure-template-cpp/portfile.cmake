vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 2dd3dbe3f68569a2bb1a55a6e8dc208bf83a0809
    SHA512 fe9d9c83f0d6d3049213a6dd2d1e05324f2098f7da5c0041691d81da488a36a73358fe9ead336e3738abd11e4810a27b9216fbacecf7dd7e47ecdedb80ed81be
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
