vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 803c7e22e45cad8937e82b8d23688219125ff817
    SHA512 cf3744d6ba244f66fe13919e4a5cdc6f04cae1f28f2d381aef049d23ae003684b17cddb86d88c30176b36f5780b3da079a014c1f8336db34399a4d4a4adee4c9
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/messaging/azure-messaging-eventhubs/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
