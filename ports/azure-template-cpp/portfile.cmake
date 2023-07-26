vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ce85f6f12c51b61b479341dffeeb0f97434cafbd
    SHA512 95ecfa9cf516a08db263b1644d0e36f42ff3de2ea380802003d97bec313c124d628b9c58ece003fcfb3cfd344bbd187938cb23c315e85ba895fc521c7f4b4d62
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
