vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO QiuYilin/imgui-vtk
    REF "v${VERSION}"
    SHA512 dab813096dbb5c6728c2a2ea946a0aa5fb6f832e805a00d59578f2bd0018a024268b21d97927c574047242bfda7569614ac7c59a78068d5676b0dbdf9bc96da4
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DIMGUI_VTK_BUILD_EXAMPLE=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/imgui-vtk)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
