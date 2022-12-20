vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 8747eacbc5d0d27e2dd9b89a5f59f59dc450d9e6
    SHA512 4ae638f3fd1aa225eab2c432bb199133ca48dadd5fd2b3ee2b9941bf951712f73b86e81d301dcc338da2184d6e6ceaffd75428c03274349337242afb516d9ed5
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
