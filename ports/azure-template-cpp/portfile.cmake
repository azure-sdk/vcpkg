vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF cad042256b2aec77f65203e8ae66ea8d93dd382f
    SHA512 0674bd20b38205ad56a4ed4e6c7a375a08ddb1c22a289441a5f1df333596e4c23ce8b29fdc2f3c4d056d5463288c0d699c364685718465d602a44805ffdc680f
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
