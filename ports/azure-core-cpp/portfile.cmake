vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ba714bebd179bba1c2c643ad67ae5c668a8d1ddf
    SHA512 233d2b347e9ea808b877e93eadbdb468f62d03f9f914c9012f9583849abc601a800e05b3a7e76467c116105d75750d1b54948d67d37d4fe24b5caefc63cea468
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        curl BUILD_TRANSPORT_CURL
        winhttp BUILD_TRANSPORT_WINHTTP
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/sdk/core/azure-core/
    PREFER_NINJA
    OPTIONS
        ${FEATURE_OPTIONS}
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_install_cmake()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_fixup_cmake_targets()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
