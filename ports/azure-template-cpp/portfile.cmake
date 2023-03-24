vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e9f900f7d27c95b1b1c279991606079939bec8fc
    SHA512 8290f09a18074d75a1b5d6e7c499deb4abbf1e916a3486d97df47bb6f872558fb2df19c2dcf63215cc4b9cc1eb3efaf3eff26acbd0c527e1d90bbc3a12873f5d
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
