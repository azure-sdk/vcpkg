vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ffafda06343b6fd6b5b1ded4937de332712dab18
    SHA512 ea3091c2be16b0e00f525428a22ae4caeb229de279ca3ed067d34d048c79f45fcbf2c79d1cb71f121311592f2e04e2deda292b35e1b1e7fb27dacf2b2402b26a
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
