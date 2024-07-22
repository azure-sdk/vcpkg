# Common Ambient Variables:
#   CURRENT_BUILDTREES_DIR    = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR      = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#   CURRENT_PORT_DIR          = ${VCPKG_ROOT_DIR}\ports\${PORT}
#   CURRENT_INSTALLED_DIR     = ${VCPKG_ROOT_DIR}\installed\${TRIPLET}
#   DOWNLOADS                 = ${VCPKG_ROOT_DIR}\downloads
#   PORT                      = current port name (zlib, etc)
#   TARGET_TRIPLET            = current triplet (x86-windows, x64-windows-static, etc)
#   VCPKG_CRT_LINKAGE         = C runtime linkage type (static, dynamic)
#   VCPKG_LIBRARY_LINKAGE     = target library linkage type (static, dynamic)
#   VCPKG_ROOT_DIR            = <C:\path\to\current\vcpkg>
#   VCPKG_TARGET_ARCHITECTURE = target architecture (x64, x86, arm)
#   VCPKG_TOOLCHAIN           = ON OFF
#   TRIPLET_SYSTEM_ARCH       = arm x86 x64
#   BUILD_ARCH                = "Win32" "x64" "ARM"
#   MSBUILD_PLATFORM          = "Win32"/"x64"/${TRIPLET_SYSTEM_ARCH}
#   DEBUG_CONFIG              = "Debug Static" "Debug Dll"
#   RELEASE_CONFIG            = "Release Static"" "Release DLL"
#   VCPKG_TARGET_IS_WINDOWS
#   VCPKG_TARGET_IS_UWP
#   VCPKG_TARGET_IS_LINUX
#   VCPKG_TARGET_IS_OSX
#   VCPKG_TARGET_IS_FREEBSD
#   VCPKG_TARGET_IS_ANDROID
#   VCPKG_TARGET_IS_MINGW
#   VCPKG_TARGET_EXECUTABLE_SUFFIX
#   VCPKG_TARGET_STATIC_LIBRARY_SUFFIX
#   VCPKG_TARGET_SHARED_LIBRARY_SUFFIX
#
# 	See additional helpful variables in /docs/maintainers/vcpkg_common_definitions.md

# # Specifies if the port install should fail immediately given a condition
# vcpkg_fail_port_install(MESSAGE "wasmer currently only supports Linux and Mac platforms" ON_TARGET "Windows")

# vcpkg_from_github(OUT_SOURCE_PATH SOURCE_PATH
#     REPO wasmerio/wasmer
#     REF 1.0.2
#     SHA512 f8058cbd5a8a807cd84b4a839c87ff76dae5475c655e804b27262cd5cb22ddb6c43da3a01b6cdbed29502afc38aa9ee589022f67fab27b189453f2500478c4a9
#     HEAD_REF master
# )
message(STATUS "Archive: ${VCPKG_TARGET_IS_LINUX} and ${VCPKG_TARGET_ARCHITECTURE}")

if(VCPKG_TARGET_IS_LINUX AND VCPKG_TARGET_ARCHITECTURE STREQUAL "x64")
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/wasmerio/wasmer/releases/download/1.0.2/wasmer-linux-amd64.tar.gz"
    FILENAME "wasmer.tar.gz"
    SHA512 a0a96413f9117861d2ff6f99460b20f4516825adafaac28cf08cc8ec20a0b35e72bd08832f6501778b78c3aae43e1870bbda5df07918a0e0d22c78d33aa1cbb7
)
elseif(VCPKG_TARGET_IS_LINUX AND VCPKG_TARGET_ARCHITECTURE STREQUAL "ARM")
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/wasmerio/wasmer/releases/download/1.0.2/wasmer-linux-aarch64.tar.gz"
    FILENAME "wasmer.tar.gz"
    SHA512 4781F48823842E244A298A8068857310CDBEFB22114319267A05E7BBF637D5A2F1BB89D4A1825117E27E56F7FA8B87A8486685DDE1A8AB8860BCE8FDFDDEAC72
)
elseif(VCPKG_TARGET_IS_OSX AND VCPKG_TARGET_ARCHITECTURE STREQUAL "x64")
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/wasmerio/wasmer/releases/download/1.0.2/wasmer-darwin-amd64.tar.gz"
    FILENAME "wasmer.tar.gz"
    SHA512 09DC1A729C5A152D91734F63D97641C4DF7F8DD71F02FB79F59852896183D5003F62B93E01A72ACA52FD8A5D1DD8E4E69A854ECD926AB354F2824E024E05EDCE
)
elseif(VCPKG_TARGET_IS_OSX AND VCPKG_TARGET_ARCHITECTURE STREQUAL "ARM")
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/wasmerio/wasmer/releases/download/1.0.2/wasmer-darwin-arm64.tar.gz"
    FILENAME "wasmer.tar.gz"
    SHA512 B11DBADB4E9A0476761D9F1F9BEACAD560FD08A66FFB698DBD1FD66BD7ECD24DAE3BCA240DE32894F21A0BABEA5B71C262A65A4DC5CF4D8469DD75AAB939214B
)
endif()

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    NO_REMOVE_ONE_LEVEL
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
configure_file("${SOURCE_PATH}/LICENSE" "${CURRENT_PACKAGES_DIR}/share/wasmer/copyright" COPYONLY)
# message(STATUS "Wasmer currently requires the following libraries from the system package manager:\n 
#     cargo \n")


# # Check if one or more features are a part of a package installation.
# # See /docs/maintainers/vcpkg_check_features.md for more details
# vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
#   FEATURES # <- Keyword FEATURES is required because INVERTED_FEATURES are being used
#     tbb   WITH_TBB
#   INVERTED_FEATURES
#     tbb   ROCKSDB_IGNORE_PACKAGE_TBB
# )

# file(TOUCH ${SOURCE_PATH}/configure)



# vcpkg_configure_make(
#     SOURCE_PATH ${SOURCE_PATH}
#     NO_ADDITIONAL_PATHS
#     SKIP_CONFIGURE
# )

# file(GLOB_RECURSE SRC_FILES "${SOURCE_PATH}/*")
# foreach(SRC_FILE ${SRC_FILES})
#     file(RELATIVE_PATH RPATH  ${SOURCE_PATH} ${SRC_FILE})
#     get_filename_component(DST_DIR ${RPATH} DIRECTORY)
#     # message(STATUS "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/${DST_DIR}")
#     file(COPY ${SRC_FILE} DESTINATION "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/${DST_DIR}")
#     file(COPY ${SRC_FILE} DESTINATION "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg/${DST_DIR}")
# endforeach(SRC_FILE ${SRC_FILES})



# vcpkg_install_make(
#     BUILD_TARGET "build-capi"
    
#     INSTALL_TARGET "package-capi"
#     # MAKEFILE "${SOURCE_PATH}/Makefile"
#     # MAKEFILE "${SOURCE_PATH}/Makefile"
# )

# # Moves all .cmake files from /debug/share/wasmer/ to /share/wasmer/
# # See /docs/maintainers/vcpkg_fixup_cmake_targets.md for more details
# vcpkg_fixup_cmake_targets(CONFIG_PATH cmake TARGET_PATH share/wasmer)

# # Handle copyright
# file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/wasmer RENAME copyright)
