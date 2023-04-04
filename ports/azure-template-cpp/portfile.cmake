vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 3cb49934238aad9a1615e4ce98dbf360d48158c6
    SHA512 692a3c5539fa075e87eca1ddc0a1209f55471247325e407f441eb305a9a723a4e6d2b64a8a869c5b15ea9779fa1c8ba0f37f3738eaed5acde8f60a2cc424f187
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
