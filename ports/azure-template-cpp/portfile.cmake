vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF c8d79610e0204aeb31e13d94593a9c37cf8181ee
    SHA512 d248c8097dd7a703640c5d94f2232e5018410fc13cca164df1da1fead423323f7ab73e176f32b32b4d9e3bb32b9d97d8d9b32dcd26c3c55d2cee72801958cdce
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
