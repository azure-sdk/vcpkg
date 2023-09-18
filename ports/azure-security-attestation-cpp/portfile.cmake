vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 526143d69d275968d7239ff06c434265257d0fcb
    SHA512 761d3424dd6c1094665f57e8c8e946d9bb2c998c78f24a5f5fbe8cef33d2fe8f2c7d484918a6c3094af512fa9cc344a8922308e19cc5bb3b5c9da32c6f739ecb
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/attestation/azure-security-attestation/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
