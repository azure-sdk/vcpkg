vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4c70c2fdc6af56fcf0cb04059b9cca50056069d9
    SHA512 79e84473c9656c1051ecf0a8b24fa8db17743e781f01441624bae169dd599e43cec07abd1ed5e92a3e7e4f39e1e0e68d077ec15a537e307568d31acbffeb1540
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
