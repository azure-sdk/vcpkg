vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 40afee9c16d0c2bd91edf55a82ae9fbd7c2936ff
    SHA512 83e9fec5d068bc6e337afad9ac4053ff948137574411188fd72f605db01a676f65d67cbdcd6f109c98bc7a5e0167ad33aea924f7f8f13418328d75f8690578bd
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
