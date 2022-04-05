vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ba377c8c64499a9b4ab0ad0426ed32c1c76ae301
    SHA512 a9dbdcd2034f1c974bbe9dfa5f7694262bd3aea1ba8a3f453ca7546a6656d7af03c0a7a92c8f2e8db49314226daf7d4a9988b7a7f24c127496da68e415411303
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
