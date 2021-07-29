vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 79143d4a1aed3aa6dbf7f8f91cc25fae3f59b03b
    SHA512 b5259e6c4511bd78a4ae756b6f0eb55290061baacfd80ef987d17102967ee1574e60c69e9360fba34be211e89f9a1fe34fc2ac3d426c46a000d6f5f8bc591424
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
