vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF fa09034d5c3fe16d28f7baf50ca8237ba551d16f
    SHA512 9a5a6626875a5c4f65c6e594078d73870371f5d7313f843df304be5b70bf04f32e6677e244a509b928563ede6fcf378b06330ec29f2f8bf2c9c6d96525bf93d1
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
