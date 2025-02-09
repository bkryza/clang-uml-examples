# Repository of clang-uml examples

This repository contains several examples of UML diagrams generated using [clang-uml](https://github.com/bkryza/clang-uml) from various open-source projects:

* [clang-uml](./clang-uml/README.md)
* [cppast](./cppast/README.md)
* [drogon](./drogon/README.md)
* [entt](./entt/README.md)
* [godot](./godot/README.md)
* [poco](./poco/README.md)
* [yaml-cpp](./yaml-cpp/README.md)
* [FreeCAD](./freecad/README.md)
* [curl](./curl/README.md)
* [C++ Standard Library](./cpp-standard-library/README.md)
* [chromium](./chromium/README.md)
* [linux](./linux/README.md)
* [hyprland](./hyprland/README.md)

For each of these projects there exists a Docker image called `bkryza/clang-uml-examples-<project_name>`,
which includes all dependencies necessary for the specific project and the latest version of `clang-uml`.
The Dockerfiles for each project are in each project subdirectory.

To generate the diagrams for any of these project (e.g. `hyprland`) just run:

```bash
make docker/hyprland
```

If you need to rebuild the Docker image for any of the projects, for instance to update 
dependencies, run:

```bash
make dockerimage/hyprland
```

## LICENSE

    Copyright 2021-present Bartek Kryza <bkryza@gmail.com>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


