vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 14a4459ae02ae377f9da0d6ca272291ffb77f4d5
    SHA512 79daa376ccc2c1c03dfbbbfb0cf89c4d86d744d3357389adad9c459e8a776b35dcce87dfd7a730217b834dd2342fd1621d4e834736a9ff693bb90dc1ccb8a8d9
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
