vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF dfe9a2be1f09f932ce0e36ae13c660cbad5f88a5
    SHA512 98d0bb9c71aafbf450545654039cf76c2cc965bcc2e8b080a90bbd494216247f4c22142b6c4497bb96a0e21985e05f8cb56e6736df9e1a15d80104b04acc34f1
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
