vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 95d24e9d8ab385932f724bed6f15dc27c8c9ad7c
    SHA512 722b672f5b51e981961fb9abdaaec5e21196b172486509b35a5a9fbb15c0716569495a4327617ba0e1f4aaf5e2f6ab74ae5164483b55ece69fa3e4cbb4226620
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-administration/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
