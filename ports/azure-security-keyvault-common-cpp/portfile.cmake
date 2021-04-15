vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 6b50feb0d4c8be0086db7089543884c303a325be
    SHA512 8bed174ae64bd0a01589bfef092fd1481841eb9d888d83b33a6047c670686205b18be7df235ec96c1865b45a91e61c8d623fa72a2a637ce6a829f03fee4084bb
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
