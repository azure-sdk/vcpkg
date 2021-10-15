vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f4e6390dfff41ca40b260c60f8b17b59d5ffa295
    SHA512 ae50e22f6a11cfdf0ad169143965dbd768c495fedbcb755eec7667d496cd1ad1bba263dacef771b425b438b678f7c9e9d6b9c3d5a8b74fd5d03cdca5ccf0c893
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
