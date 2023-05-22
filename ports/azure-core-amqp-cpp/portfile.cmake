vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b32fccd3034eb6b6a552411f3e8c4c6d3d96c289
    SHA512 ce08da411f30fcf212c39564df7611da8bc7c3971fa1b463e79b0a57e0c4c0a3d24965d64a8dbbb8aad0214308fe0266721844e96b04f62f6927b11f3b247904
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/core/azure-core-amqp/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
