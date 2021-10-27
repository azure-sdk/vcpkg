vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 30f62eb3aa9dc802039ff46cda05033e8b85e728
    SHA512 465a7d3ee1b8b8c17dd6aa2ade148dc40004b6b2ef65e0f0dcc0dbcef5525ab9de79f25f08a97365db55593c462f1935d22a724cec0ae3218d7d3982eeae0a6d
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
