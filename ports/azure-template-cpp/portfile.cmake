vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 67d6bd167eaebc5d4c64aad1aff7b4a873c39c67
    SHA512 46da551d87a1ef4aa9968baf4f502a5247b535873a6a39cca628e71ab5db41a0abc343ff11c10472af9ad185a1df3cbad19e92d2f13dd01a8d1d43200d9cef8e
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
