vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF fbf20bf8b9aaa46fde1314ab8fa30854736c67ae
    SHA512 596aa14f3ce8e42d0d00e788f2e95f1179e818bc3f6785a8acf928bff8671e960cb0951c87eaa0f5a3f519dd35779df806e0674eaa1e47ed8aae4c66fade05c9
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
