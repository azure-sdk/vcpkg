vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 2093f4ef815c91ab93c992d895e2ad9ff84e5a83
    SHA512 68edf74a9404ecdec2ea69276a4fe5e07f1034125a056d5ad08437b2b35924a440a708b00d8e4a047579912c1d08efb00a2a3c92434d5ad23dba6e40c591dba5
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
