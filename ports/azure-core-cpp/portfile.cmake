vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4a72b62e396c0aae11eb6b1b1b99f517f7fa750e
    SHA512 7b6a5aac5c796155e095f9d6a3514fcee4bc213f7c4ee0326bb8fac5b8293b16f8e9adb8489d573e9c8e5701f6bd224363470cddf5be1d18a3392fdf8ce593c0
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        curl BUILD_TRANSPORT_CURL
        winhttp BUILD_TRANSPORT_WINHTTP
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/core/azure-core/
    OPTIONS
        ${FEATURE_OPTIONS}
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
