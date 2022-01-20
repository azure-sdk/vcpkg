vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF c10de791cceeb393694e86c912267d5faa89bb94
    SHA512 f2c7f3b63dc1e1a4fb9d3a9678a3feba26d86ff444e8d1e913b66a104b212c9467ba4ab2367c1c76a801784c345b7b26ba3dac5866bdf060fab96e1d1d4b65d0
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-shares/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
