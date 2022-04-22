vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 42eff2eb4b02bea852576fe22a9329d40348d0b7
    SHA512 858269f52ceb2551c950dc6f87adbdb29be8de8fc4d28c8363a66b4e3b4abced86ee8dd07272f9b657ca319d9f23981a199870b490699fb3c8bb6ddf4ce7d0c5
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
