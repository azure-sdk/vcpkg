vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ebe084bfc67c08f6d5aaf857dd7874729d9f5908
    SHA512 96ed8b5eb3ddb562aa7d112a95594ca9b5aefe13d7c01b77c420c8bac164bd47e685de46ec2df9864c4b6bfe96e74c7c561f3a6b761e9e81cc76dff18807c6d7
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
