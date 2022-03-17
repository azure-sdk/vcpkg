vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF c4678c9a10f3b7f0bc9545f3a5a603da09820863
    SHA512 5386164a4741ff4280a423e5cc3991de31098c8e42a6a7c6b769776e1e7e6d05581afc94839bf7de02f0d2c6077bed4d1d2b16e74e7f30e27d1894e2f20d4bd7
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
