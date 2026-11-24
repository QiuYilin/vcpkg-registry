vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO QiuYilin/taskgraph
    REF "v${VERSION}"
    SHA512 73baa47a049207903c2b696cc23b76de01af6cee44e8b9358fc8d61d489faf6f759fc754026b0d414b938c18644e6f5e9efc19ce6675aecdbc401d8ca9c0d4f2
    HEAD_REF main
)

if("ui-imgui" IN_LIST FEATURES AND "ui-qt" IN_LIST FEATURES)
    message(FATAL_ERROR "taskgraph: features 'ui-imgui' and 'ui-qt' are mutually exclusive; enable only one.")
endif()

if("ui-qt" IN_LIST FEATURES)
    set(_taskgraph_ui qt)
elseif("ui-imgui" IN_LIST FEATURES)
    set(_taskgraph_ui imgui)
else()
    set(_taskgraph_ui none)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
        -DBUILD_EXAMPLES=OFF
        -DTASKGRAPH_UI=${_taskgraph_ui}
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH share/taskgraph)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
