vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 634df137e3829037fadc267359f78354d883c6c6
    SHA512 27da9cf058c1568f6963b3136b4a9adcfcdfd494e8d5d6d435dd419015e625bee6eadcaa44ef6c9bf062c6c6e368fb1dc7a6de733a7a140b87f495a0c0b1270a
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
