# yaml-cpp UML diagrams

## Generating diagrams

```bash
# Checkout and build yaml-cpp
git clone https://github.com/jbeder/yaml-cpp
cd yaml-cpp
git checkout yaml-cpp-0.7.0
mkdir _build && cd _build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DYAML_CPP_BUILD_TESTS=OFF ..
# Copy .clang-uml config to yaml-cpp root directory
cp ../clang-uml-examples/yaml-cpp/.clang-uml .
# Create output diagram directory
mkdir puml
# Run clang-uml
clang-uml 
# Generate diagrams
plantuml -tsvg puml/*.puml
```

## All class diagram

![puml](puml/all_class.svg)
