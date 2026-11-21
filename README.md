# vcpkg-registry
Vcpkg registry for personal use

# usage

For VScode: add this to CMakePresets.json

```
{
    "version": 
    "configurePresets": [
        {
            "name": 
            "displayName": ,
            "description": ,
            "generator": ,
            "toolset": ,
            "architecture": ,
            "binaryDir": ,
            "cacheVariables": {
                "CMAKE_TOOLCHAIN_FILE": [path of vcpkg.cmake],
                "CMAKE_INSTALL_PREFIX": "${sourceDir}/out/install/${presetName}",
                "CMAKE_C_COMPILER": "cl.exe",
                "CMAKE_CXX_COMPILER": "cl.exe"
            }
        }
    ]
}

```


Add the file vcpkg-configuration.json to the root directory of vcpkg, and it will run with this configuration under the manifest mode.

vcpkg-configuration.json

```
{
    "default-registry": {
        "kind": "git",
        "repository": "https://github.com/Microsoft/vcpkg",
        "baseline": " 980c981a8ab8dcf9389c9d10c3e1bc20b6ee23f9"
    },
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/QiuYilin/vcpkg-registry",
            "packages": [
                "cgraph",
                "taskflow",
                "taskgraph",
                "qtnodeeditor"
            ],
            "baseline": "5fe9d626fa5d5004c92ef0de992773f5b88fe718"
        }
    ]
}

```

`baseline` is any commit on `main` of this registry that contains the ports you use.

# Ports

| Port | Version | Notes |
| --- | --- | --- |
| cgraph | 2.5.4 | |
| taskflow | 3.11.0 | Last 3.x line, so C++17 projects can avoid the 4.0 requirement. |
| taskgraph | 0.2.0 | Dataflow wrapper of taskflow; optional mutually-exclusive `ui-qt` / `ui-imgui` workbench features. |
| qtnodeeditor | 3.0.16 | [QtNodes](https://github.com/paceholder/nodeeditor) fork builds; needs `qtbase` with `gui`, `opengl`, `widgets`, which vcpkg builds from source. |

The versions database is checked in CI with `vcpkg x-ci-verify-versions --verify-git-trees` (see `.github/workflows/verify-versions.yml`).

# Some recommended vcpkg registries

https://github.com/microsoft/vcpkg

https://github.com/luncliff/vcpkg-registry

https://github.com/retifrav/vcpkg-registry
