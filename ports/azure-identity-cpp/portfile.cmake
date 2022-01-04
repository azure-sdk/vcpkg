vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5ff89bb9e54517afe811dfdee4e6893e0637cda3
    SHA512 47c6cacf7b7a88eb96b6053479e5f39cb94bce87fda8f6f9ab8af8cfd1b4ff29ad2d6effa820926baeb8362e5c9d77cdf3e63ed720a58f7af31fe1c3ac127de1
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
