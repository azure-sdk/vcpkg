vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF cd9ae61a8ed437fbcb7c5f9629db10f5f51ba1af
    SHA512 d5a92b8f164c82644d3aa26447f274d705c9a0a0fa634dc9f67d1f0bffe4240b9d725c843eaf3a470f300f8c83b6aa5265836ff68e0a42a03b19812f360832a7
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-certificates/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
