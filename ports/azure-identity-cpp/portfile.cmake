vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 47a43d2a0d35c5c8e7ee9b3eac9f4203ebf8c825
    SHA512 96ceb35d25d0a022fa5d207e4a5e92df1ad9c64f0d3329d6ca5e078cf2a45b826ff4e950e7f82aa4e1db4b777039547ea38af54e3bc308d1cc1e4930f151ff25
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
