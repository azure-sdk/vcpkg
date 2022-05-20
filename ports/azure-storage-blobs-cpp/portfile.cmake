vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 593464cedaf21b00d7b6fd1467f25ab9284ebe1b
    SHA512 e3fe1b8cd8c6cd8055872d0744d3b50c14686d5a4a0ec46f79770f45ccc16a18df34ce7aea97986c9606fffadb467576ed471d2bcad8623842529cdfbe51706f
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-blobs/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
