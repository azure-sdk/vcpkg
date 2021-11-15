vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 57e7a4e4f3e09be5b00fa8ee4d981c893c8dfe94
    SHA512 77242e34f30cf11c1bc47b03f98543faa47874068891193d13bb00d8aee9e002f5b5cae812fd055da8aa66732a5e31eab7269ef03724cc35cabaf9c8e9e08b12
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-keys/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
