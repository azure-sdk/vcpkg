vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4ccdf2f822ef1197d4443acc7ff21c2cf884ce0e
    SHA512 edfd3146f59fa572ff862a25b8ad3e99810ac9045fb43125430aa1ee46a0aa86c6ab16e7c4ca86f1e3bd67026bcb843e4fa1a9f81317f2d22b94b8c47bdb0f93
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-keys/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
