vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 0b59e5a94c3551cf550196db1ee7175972e69d10
    SHA512 3c159c796f9ca8606ff01a27117e848ef8db884be4c471b1887e227d7cda8d178321b8204855a81e5ae076cecea77a156e225f1d19250f48cd2a2a7c87f7f852
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/attestation/azure-security-attestation/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
