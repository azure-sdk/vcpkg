vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 9b4672be9324f218ecdedfe85cae184a59e2e482
    SHA512 04c46ccd88dd29935f55117d1ce7e6a11bdfe0fc588a9595bea3bc7d4d3d9fa5d2e0739d4d48dcddbbd532063508a05e5f3847ebd40374bb0421b2fa8d5fadb3
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-common/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
