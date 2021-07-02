vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f2413d11f508ee2fe305d022525ebf8bd781cc85
    SHA512 6b41b1c700fe17545f6850f48617522fc89bf4cd0fa7fa93aadfa1f5c6753e508421f2bf1ae65cee8d259d0fb5fed13ebd138b1100ec351a178ba0bac510e5ed
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
