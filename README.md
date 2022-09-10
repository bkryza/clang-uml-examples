# Repository of clang-uml examples

This repository contains several examples of UML diagrams generated using [clang-uml](https://github.com/bkryza/clang-uml) from various open-source projects:

* [clang-uml](./clang-uml/README.md)
* [cppast](./cppast/README.md)
* [drogon](./drogon/README.md)
* [godot](./godot/README.md)
* [poco](./poco/README.md)
* [yaml-cpp](./yaml-cpp/README.md)

To build the example diagrams follow the following steps:

```bash
git clone https://github.com/bkryza/clang-uml
git clone https://github.com/bkryza/clang-uml-examples
make -C clang-uml debug
cd clang-uml-examples

# Build diagrams for all example projects:
make CLANG_UML_BINARY=../clang-uml/debug/clang-uml

# or build diagrams for a specific project:
make CLANG_UML_BINARY=../clang-uml/debug/clang-uml godot
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


