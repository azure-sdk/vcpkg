vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF cff96f8598d318bbdae8df103e078502d9ad15c2
    SHA512 c0faaebf64af4b50d3c5a76a7c7423b4652dc33b883e3716172f7b89b9e82ab967e0f91273e00bb3d197d2e2fe07710ae2994dc17042cd55faa5140f80d88c1f
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
