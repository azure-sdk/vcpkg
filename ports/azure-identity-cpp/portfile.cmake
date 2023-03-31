vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 3d17447cceec68f2e191ebc2f8e5b6a49241d833
    SHA512 e253f1b75350ea26c3fc060a52cdbbd771290dae4506edd9105bb224792d4ac2b969b62c389fe181400d4b286525e346f5b166f1e77b66aa3b49d5c8f25f7ff0
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/identity/azure-identity/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
