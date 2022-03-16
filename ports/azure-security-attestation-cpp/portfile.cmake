vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 6dc2599141e0f152aecea8215dc7e7be91d8d2ae
    SHA512 92132833f91d157b5328385a213b1a197786a63caf213e96712499efe844cc37fbab09bf863c938413a7dc2e7f25db182d87f1c3c957db2592d6a7274f7735e5
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
