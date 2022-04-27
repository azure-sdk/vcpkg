vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 84b581e1a354d38d523d749b3a9a1d49a09b0e83
    SHA512 f18fbafa5e2dcd2f476bedc95d135d76ce2ffa0a43d4e5f2853fc0bb4b6d3da5605b1613353519f6775096312a0c8091cb26e9b91051a45e41ffeb7ba51eb5dd
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/attestation/azure-security-attestation/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
