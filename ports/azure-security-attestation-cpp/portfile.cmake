vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 16a64ab3e9cc3aa090bbfda399f04fdbb3e7dc6f
    SHA512 605a9a61bee031ce553761153b10c89e13d41a577faa6ca1f3ac409ec45bbf33637112e35f0a6019dec7fd91d7d77fa57b3ce8c018ee792ab61424a1ecefee87
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/attestation/azure-security-attestation/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
