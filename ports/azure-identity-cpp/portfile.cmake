vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 9fbc3856ad2fc017fb25facdfaa76a4fc456af46
    SHA512 51455ce2dc0875ad15d6b4d00ae24b26bbcd1bafa2c8e9d4316e93af9fccbb4adb4d3c321716c2e6929df0428974caa711e74029345e42a176ee9e6067633661
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/identity/azure-identity/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
