vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 203028a1801fd243eabbbc0d7865ebdbdd19ec0f
    SHA512 d3b2da378f95eafbfdc8972ba50838e9de2569979f1cd388f0d2135115ce1b5bcc46a4ffe2703d2b22ac363e38ec6b644ea3da3009d09c097d86af408c7e36a8
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
