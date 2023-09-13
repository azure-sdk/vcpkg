vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e0bda0b406484be516ed8e0c3baa9f3e0c390fc7
    SHA512 2d70551616544a045e25c647e4e2f59c4f9dfbda4517049bb88bab81618012ad788d0ca3dd5550d72d757b27ce4451ac8986a2aed018ee825f524e5cfb44ddb9
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
