vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 97c7630c2d31f52c79d5a44a0b4d6f8af973ee76
    SHA512 dbbdbb5975806ace0e0bddabade57e6e12d2700cfd1fc1c27925e9a3d8cdab4fe17cd0e0acaf27b597f51a14a2458bac9ece09189216eb3c1c16c153033bba0d
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
