# drogon UML diagrams

## Generating diagrams

```bash
# Checkout and build
git clone https://github.com/drogonframework/drogon
cd drogon
mkdir _build && cd _build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DBUILD_TESTING=OFF ..
# Copy .clang-uml config to root directory
cp ../clang-uml-examples/drogon/.clang-uml .
# Create output diagram directory
mkdir puml
# Run clang-uml
clang-uml 
# Generate diagrams
plantuml -tsvg puml/*.puml
```

## drogon class hierarchy

![puml](puml/all_classes_diagram.svg)

## 'drobjectbase' class hierarchy

![puml](puml/drobjectbase_hierarchy.svg)

## trantor class diagram

![puml](puml/trantor_class_diagram.svg)
