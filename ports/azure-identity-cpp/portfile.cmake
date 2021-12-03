vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF aa324ab9f599e178d4fe5b4469e453c3c6c950e9
    SHA512 ede8f35e2da4060317be0e4e22202fa58b5acf25146f50c0270ab0ac002f2e21893431192930225189f973bcb7d6ba2a330cd88ae0aa4f1511d662481615d0ac
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
