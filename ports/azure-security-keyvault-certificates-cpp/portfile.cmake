vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF bd4984015f6a19d566c884258d29daf912cc2052
    SHA512 45a9e79f0e9be4d74757c43d5a92f4ed207a98e309b8e7d4aa0f3bb2d7843b43407ef85254fb2193b65bd61fdd3cb0a48d8588d75e89722d3bfa8b20761c0bd5
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
