vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 20181b5b01ee418b30cdd434695868193e63e293
    SHA512 22cf6f2ac3a75ff1ef7d1e3ae72d41e433a9c20e884e2c6b8635198c0f33d642f1f2fa650c0d52cafd7e244108d28bfaa154532b80cc78052f9a1b22cc873873
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        curl BUILD_TRANSPORT_CURL
        winhttp BUILD_TRANSPORT_WINHTTP
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/core/azure-core/"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
