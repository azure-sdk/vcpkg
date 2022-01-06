vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ae3e5e021b779bcadcc5d015dbeee913c44ff305
    SHA512 1ee5e236457cbff4fe12fa4dc3ce1d05f7d1fe10979aeb292e51509cf69f77ee5f0daa455a8aac9340edd97fdd2e63244e9b41f24ae171f24639ff13c836d19b
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
