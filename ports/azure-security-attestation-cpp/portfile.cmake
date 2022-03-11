vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 8672f985aa3d554504325498a9ce5d18d4d7b9ba
    SHA512 5cb9fa2010c001f6ac943999f3dc2d445224dc9eae7d8f1ad3f1020e6b985728981815f8e1f2cfcd75286b676721699f9e857b89cc9d6f3e161d81d8e19bfad1
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
