vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f3c3d5fa0b4fba937894cccba931790e4b440236
    SHA512 9b8ad8ec2678bb1b9b58e582cb401b2d3bee74c05ccf89f248e0b50a4c19acaaf107c55b0baf9cb121746d6dfa94b740424e0d4167fb8a1951ffcc825f7914a8
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
