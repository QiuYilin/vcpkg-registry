vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO paceholder/nodeeditor
    REF "3.0.16"
    SHA512 1752968bbf0b0d6c6c2edbaa8a89a792a6cf079358dfcff4f7bcb6c622d01a588ee44a727e05f9fc7d1572971f1d62bb7fef7ebb502807e5c6c1f7bfb3f9cbbf
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
        -DBUILD_EXAMPLES=OFF
        -DBUILD_DOCS=OFF
        -DUSE_QT6=ON
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME "QtNodes"
    CONFIG_PATH lib/cmake/QtNodes
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.rst")
