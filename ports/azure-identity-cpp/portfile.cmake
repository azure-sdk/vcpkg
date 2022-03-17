vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF abb6ac0c9a5bcb63228e68e8594ab243c4c4f9ce
    SHA512 c042c2cb6fcc59cddb378d6a156ae23f9da45b5f5c76d7d976f84fbac37069835a3e2b89f48e01201dc3ef5e3c8ff0393d939e04f514ea8d744f03db3ab5cf54
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
