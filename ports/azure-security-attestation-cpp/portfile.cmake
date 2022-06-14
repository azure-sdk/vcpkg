vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a0f9a2d25fdba14593f7cb7d6e2142375d3e1825
    SHA512 815ee3a24f76820c935e9ff7a0096c289c2a0ebf97814b61d6359c08bbee5850149e71e7ec5c2d7880a1642731e3476a0d6e9dd420739c5b36edb3b7c08cad9f
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/attestation/azure-security-attestation/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
