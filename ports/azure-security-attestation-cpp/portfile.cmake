vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 80bf41f131fdf51b1d0f8b707a13772106fc6949
    SHA512 ea74a5fd61381629f16344b18d754a128c4cabf386740d78a841acd964463f4ab82120a104c3047290ec924ee0ae4809c8932423c7f0d0cbb34b17649cf35482
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/attestation/azure-security-attestation/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
