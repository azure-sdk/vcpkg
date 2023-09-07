vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a8dd2b021bf815aff0da69208e47d2d91824efdd
    SHA512 1caccf278a8372d9499396689c3e9cf2bfcfa2bf669c22447a44b92c55edd5bcda25fb4ec32e7d6d6cc1a9bcf28b0d3c8671ab501d9bc27a6e2b1affc1818abd
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
