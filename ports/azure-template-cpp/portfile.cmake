vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 378ee6cbd4c7d985840e7dc4baa5e5055ae7520b
    SHA512 d71fd74c83438a6536720a38af4f5412c28c45fbab4b032ba71033763d08729e36d4e9ae058f3527cd56f67dbdb3cb83516bfc00069dc3b5f96a93f4ae111403
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
