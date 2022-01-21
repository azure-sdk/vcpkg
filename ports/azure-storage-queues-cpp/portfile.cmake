vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 88f234d9760328709d54c0fa6aa19f023c41fbf6
    SHA512 a9be61c2d7cad74a65eace9ea9ff2dcaf2c6427a0adf38fc2078fc4e7666570f9830b8a1bfe19469e26af58287ed8d0bb87396667c34be96600fdd2cbbee3497
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-queues/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
