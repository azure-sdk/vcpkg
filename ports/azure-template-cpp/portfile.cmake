vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 3fec13f7a65a0cdfd9a82bc001c6e598228dc3c2
    SHA512 f72dd464be42374d6b6298ffcb1c4369f087f49f1389e83b16693af37a1e397ed5b64d1e1d699db0ea115b715a5c5e20e38630715f2c9121792deb3dc4b716a9
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
