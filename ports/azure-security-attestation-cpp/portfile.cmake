vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 7a644fe113c1b0e2d0cbafc9496d5e8f9b67d95d
    SHA512 5e39b7e452a3b32316184f03e36ca72d66b07bf248329f12b817650f853d5edef03000c77df51b7fdd2530c92d2903529f10d30b6d386ba69c016f0563d0f84c
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
