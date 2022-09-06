vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 7b68b31fe1c9b2ae1185b19550d745e92f62c22c
    SHA512 456aba37b1e9467f4b680020c2382b700975c915586da7ff751daee23a5a7d2e7c064406366b4ffb3165fac9c9509aa7364be7d0b1b97e8f8ee9f87a18952d55
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
