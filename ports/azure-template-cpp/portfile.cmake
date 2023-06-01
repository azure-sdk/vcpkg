vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b303a70eaa6f853967e8f7135920094aaf1492e5
    SHA512 1513d8e499fd10961e8abb4dc34f9bd4841b93383e2dfa13a2035a93c576dd848df8ffd9ae5ec2e16b8c8021f5e45a92dbb17b0659fee6b6c75c7cd985ed904b
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
