vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b91dce9debb85c5424fd0373870effa46bfb5bfe
    SHA512 d377656786d98f463d4aa68aa4c27a86a3c4e1ecb313dc28c03a4727be5250e3bd3fb14ce83c7716c36cb8b989622ebbea30666a8cbe89509b5ee6ad9111c517
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-datalake/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
