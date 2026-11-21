vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO QiuYilin/taskgraph
    REF "v${VERSION}"
    SHA512 7aaa9c16f240577429bd9590dd5186feb90cc5069d91ec8b048fe1f849a995fc4c4a4b41bb148a4eb2f0939aca31bef22002550752a88d64bac5614f1c46744b
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
