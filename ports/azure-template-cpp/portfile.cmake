vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF c3ecbcddad43367f00ba61f168bc548e4bed31b5
    SHA512 4d53dbaf84e40f91b85a4ce1f8773678272106c352705fe993b2c3434eb813a7e7da15ebd9b0853c4247e0a2429b3f72fd9cd54e900f2aee386d0454053865ee
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
