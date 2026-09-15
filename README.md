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
                "cgraph"
            ],
            "baseline": "aa4754b217e4c3a4e3633c56f0b6637b8f75d617"
        }
    ]
}

```



# Some recommended vcpkg registries

https://github.com/microsoft/vcpkg

https://github.com/luncliff/vcpkg-registry

https://github.com/retifrav/vcpkg-registry
