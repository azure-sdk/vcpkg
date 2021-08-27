vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 2ef96b0b72b73f0c8cab490334fc42e18e7c9798
    SHA512 ca4883a6857065885ffeadd9d6cd8e51ad74bf8342526457ae27798db1a574228884d3616c8de81a12035c51c9f1cbd2235fbefebdeac5ef7fdb33fab3518a09
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
