vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 31748339516536c9ce2bd44c517fb196d2c24a1e
    SHA512 44ee4235d4e8e35ce1b7a3cd926382838a6deb517fed3eb258cc265a832abda0848dc243fa40e82fe1b56d5d2be9db5e066f580e3a7e7198e8256e6eff92ec2d
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
