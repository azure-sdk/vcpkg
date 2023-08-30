vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 11775485401ed9410fc339b54b07f88aa416b340
    SHA512 426ba6636b34b8accdc856a8f42a4863c300e352d0c0f5683ca026c6141ce2e166d51ad30e5beb7f265853a9c95fc604d782ef158d5f0be8cada08d22fddf13c
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
