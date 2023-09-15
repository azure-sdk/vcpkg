vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 27919d0f91e5a56aea0837105eec271061a684d2
    SHA512 2306a99fe9dbd4727da4ed930ecae70de7c838be8b6d38136c72b6373b338d750aa1113a16da89553782212ce1f2caf08f59c31ba6aab06211b97be5f4a1c779
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
