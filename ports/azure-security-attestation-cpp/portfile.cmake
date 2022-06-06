vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 8ec7a9958ae87edb3ba5299b9f32ff33e93b7ca3
    SHA512 0676616638ccdf4aa2b2eaa97bd6c98887edf73f86a6111ee93508eb87697c856b227e6f72a897e827d80b7def0d33562c7bf4e30e314d9d5443b19b00084c48
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
