vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a11a93b48a3a4f1072fecda2a82f6c11ad800b35
    SHA512 334861dab170c39ff62885c526712ba30d500d81b3995b9878dd0999bf4857a8be55740c84ae56103060f7b10fe54af920ab7980b71c182d5ed5162c557b5b08
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/storage/azure-storage-queues/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
