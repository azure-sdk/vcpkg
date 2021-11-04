vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4614b80d2214f28e3613f20c9ff3a3c79225c43f
    SHA512 ed2ca7f5772c17607737d776fae9eab4bb897282e2888b3b807d7eb19e00af6c8a8e6eac7ccc9c7cd432184b4c5ada3915da4eeba132faf93689bba6132ad2ea
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
