vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 12cec8c08f5f424271b53af13f31cbedddf853dc
    SHA512 ab079746107b719d3f762639cd0b992a724aaf53d8fc7f2c9ae1c0298777839792dd683deb5db52d84a80f6e73bf0f1606704e302169c8376984cd006ceaab09
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        curl BUILD_TRANSPORT_CURL
        winhttp BUILD_TRANSPORT_WINHTTP
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/core/azure-core/
    PREFER_NINJA
    OPTIONS
        ${FEATURE_OPTIONS}
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
