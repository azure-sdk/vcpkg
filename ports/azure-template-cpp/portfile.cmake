vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f7841a89b44e6276cc78f6f58c41b278eadc7cfc
    SHA512 4dac65c74abef469bceed0afe09aacc7a84617f7cb8706b86d56fed56e0e47373ee2f906f2df373b8099deac273bdc0cb3fe67f093180113138d0ff1c33d2c0f
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
