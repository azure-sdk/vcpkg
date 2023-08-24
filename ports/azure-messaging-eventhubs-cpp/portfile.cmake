vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF dd236311193c6a3debf3b12c47f14e49a20c72c7
    SHA512 2df5223d2e42fb75f8f35e00b3db33d24a7115e67306a54441dbe6565416e5f9f8bf4ac44c211b15405a31fb1235beab1356b9281a400da2b52cf068713fa337
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/eventhubs/azure-messaging-eventhubs/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
