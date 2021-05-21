vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e5a589beecbfd6017e1a5825d1e1ca80c98e5ece
    SHA512 90d7d2ff9c98e392e997b5156ff45be25cfe92d08a4b0a6639f82f2761bbfad90f3541db862c39b90077da6e21ceed67a9af3568880458697e533e1a95fcd23d
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
