vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF eb3074d5c0b1689a8447c7c5fe55098a5d169030
    SHA512 2ca3d068e19ccef433eb55c6856cf95c863fd092afffe15c23702aed7f90ebc9dc951ee539bd6ed46d189213e8eb85307f3e4f86a245b00de63ef774805cbcfc
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-keys/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
