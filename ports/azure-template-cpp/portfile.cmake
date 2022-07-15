vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 73bb61d64ba0cfafb2b624c1d677a67e97b18978
    SHA512 7db1d31bbf2ae80a9a7240f14b6d15969cf5f7ee70dfaa0d748dd455142bec16a9dae8c9d63d4b618b8e6fd7fed95b1f4339bfb85ebd4ff84ab89a603517c2d9
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
