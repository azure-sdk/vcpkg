vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 172808eb1c9e3a87c8a8d0e710ec4f9c4e792bee
    SHA512 d29c7bac00ecb90c767f4eea803fdf67737926b61d1bf148eceb16ff7795f73eb6103bba09385efa40cadc1fec4c0889532c1b286ad82ca81487cb61d5d722ec
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/attestation/azure-security-attestation/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
