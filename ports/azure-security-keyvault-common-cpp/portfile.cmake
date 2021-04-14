vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 1ea5afa961383072c622248157c622943592217d
    SHA512 c0f6baf6cae6c37e00578c36f72cc4d0513ac55cc792431f2a3796ccf33f5e42a6e06db1d24ea2e90cb5d2ae044dc07e8f2100b1df315075c91fdd55362d1b5f
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-common/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_install_cmake()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_fixup_cmake_targets()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
