vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f07a8e2656e3649e016e2ad3a5bf2b85db7bfe41
    SHA512 cb24195dff3b0e2d8916f1dbcb04a5dd02e0b0beeaef82a6fe7d1693eed6776afd8234e6cd11cabdfd1aa96441f48838f8bb75274c770a62b12bebe16fbccbb1
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
