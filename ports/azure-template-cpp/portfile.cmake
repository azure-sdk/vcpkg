vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF de6ed1da385a45e9e26afaae01e09a9671324bec
    SHA512 0d1ff3375c68bfdf9f00d2924e3ca1ccbea499e43a350f34aefb24fe85eaed669577e4b85c82de96eabe59e4281dde5478ad9f3fe0ce147951311ed5e1ffb00f
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
