vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 8cf7746b6b688dc9e75dcf0d3d76d1b161a4a555
    SHA512 d3cadbc34a5fd83a09ddb3a2d56ebcd797bcc20e04ed916b36f021b9c88fe5ed434322d2365808f685ddf15e4a7a745cdffc595e19c6a75eeb94bd650e568ab8
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-datalake/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
