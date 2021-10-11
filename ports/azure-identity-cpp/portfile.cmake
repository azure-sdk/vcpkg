vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF eb2fab16a0712d3dc529805ec9d48ecabf15ac4f
    SHA512 a2ef6d9d12dd8536a2962b0bf9a7abe3cfb384f2368ad02d59b629f496f9792028b2b8ba42be055abe5b0127cbc64ad13d68556ba8ffbd8b03f02a89679e4a9d
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
