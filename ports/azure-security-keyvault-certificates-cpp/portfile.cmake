vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a627ab3f22e5f3a71fdcbca4f9426ce11ab2f6e2
    SHA512 facfcc651bfbbb7834bd58cf09e7d419a2cdb7db15a1473d9be09016ab4132cf435664739bb52e46991d1601beb8efa80a5d7568b99f9dfb007d8e928c4233c6
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-certificates/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
