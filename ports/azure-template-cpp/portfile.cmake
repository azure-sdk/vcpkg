vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 13175a4f41433297cd2548106fd36b19880b26cf
    SHA512 c737ad571c3622bf4b51620ee27c2fc4bb9be843084a0c07fee62514c0d5e2d8b4f126f4cfeb53e5530da52c7cb364c15f4cba3f60e393c665fa6604ad73b1b8
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
