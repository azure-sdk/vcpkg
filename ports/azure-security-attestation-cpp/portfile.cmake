vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF cb1c35eb7771107dffa3b574f77349c63c3c3866
    SHA512 68a1ec78595238b1bd3ce0e502727b2e1bba3249ca1e37c88ca46c6a9e73992b01ec856cbebe8f5f81a04adfe23d6ba0f289cf3167da5ff85bc4302652171c1f
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
