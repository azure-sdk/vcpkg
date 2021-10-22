vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ef72f3c8a1156cbd7a160e5dc84cbda7524bb92d
    SHA512 d2d2c71978f3ac9128edabfcf56c0ef4a075292346c1a7580b3b9980dc7351a6122632476ef88678ee42e68378ecf58f242785b3868fc60bd49654cd9acdce8d
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
