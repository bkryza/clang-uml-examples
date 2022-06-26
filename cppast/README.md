# cppast UML diagrams

## Generating diagrams

```bash
# Checkout and build godot
git clone https://github.com/foonathan/cppast
cd cppast
mkdir _build && cd _build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCPPAST_BUILD_TEST=OFF ..
# Copy .clang-uml config to godot root directory
cp ../clang-uml-examples/cppast/.clang-uml .
# Create output diagram directory
mkdir puml
# Run clang-uml
clang-uml 
# Generate diagrams
plantuml -tsvg puml/*.puml
```

## 'cpp_entity' class hierarchy

![puml](puml/cpp_entity_class_hierarchy_diagram.svg)

## 'cpp_entity' class hierarchy with public members

![puml](puml/cpp_entity_class_hierarchy_full_diagram.svg)

## 'cpp_entity_index' class diagram

![puml](puml/cpp_entity_index_class_diagram.svg)

## 'cpp_expression' class diagram

![puml](puml/cpp_expression_class_diagram.svg)

## 'cpp_type' class diagram

![puml](puml/cpp_type_class_diagram.svg)

## 'cpp_type' class hierarchy diagram

![puml](puml/cpp_type_class_hierarchy_diagram.svg)

## 'cpp_type' class hierarchy diagram with public members

![puml](puml/cpp_type_class_hierarchy_full_diagram.svg)

## Include graph diagram

![puml](puml/include_graph_diagram.svg)
