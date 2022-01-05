vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e7c610dcb3c5ed11cc7d175931f8c7e3d970d602
    SHA512 90a9fd958e0d4944185afcd69b090ccb80fb94ad9097082d9612dc9bc71242fdea95d0d2469ca7abf1eb531f500ea9a2f333e4edc038ed3062fd9fb2ab560b27
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
