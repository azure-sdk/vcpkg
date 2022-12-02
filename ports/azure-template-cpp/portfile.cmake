vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 75285bc4cbd063a3a0726c4756892a382a59d8f4
    SHA512 49ae6e0d78efb5a27baa8da0c723c3998b79b9ea6b0fcbd7d713ad03205126e7329f97efdd4748b3202b6f9a543e27840e9d0758054c83cb3d03fa5b65fb3dbb
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
