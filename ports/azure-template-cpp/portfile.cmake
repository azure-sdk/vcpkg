vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 2418581e2e5d8747539e4638052543472572aeb1
    SHA512 cfa9f821f740dc8542db43b6acfaa7cc9b0e73ca821f0af3c2ac1bdf24aa42bdfbaf47ab151a3d81d76b90842a9417d720183b97a9ab2bb2549cb4b071461f5d
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
