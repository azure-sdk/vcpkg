vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 82261744eb126a0a8dbc86affc480c464657c3e3
    SHA512 9925bd2bc4f46256c1dae7c06b6c17425945992687b54aec7597d1828e3f17eb0e0aba91a1bb635f3a8f7528466e0c335aa3fe30c36822d22ddb9a04f717e882
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
