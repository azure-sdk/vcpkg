vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 221a17509904d9917dd9eb861319fb1281c1c0db
    SHA512 96ddeb9b0736bb1dce932c45e655d86f3784d75cb97b3342e561341ef52c800c397977f6027e664f4c22fe2dbbf3706ec19950e79db7e5bf8d4cb10cb5587f87
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
