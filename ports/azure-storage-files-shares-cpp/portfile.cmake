vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4d898ffa59f6198f804392d9fd6da3b1fe2d8713
    SHA512 96ef525a4a9eae37425b74da2b7454d952c178663ed7819494a4112c3c09e03ec99d0ee4ba07cb2d9fe1ac9260c92d6382991168b1f4a4f6996829d21a9cab7e
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/storage/azure-storage-files-shares/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
