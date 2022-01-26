vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF acdd028d5631a154a3cd3deade33324ce6970c36
    SHA512 a50aef7fa737ad3adf58692d4fad00081b0f6170956e06864bf04096ef1f59166a5dd4d5dd3ea15f9c0c74b8ed70945e08857f0d5ad54d14d94fcfaefa181877
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
