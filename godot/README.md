# Godot UML diagrams

## Generating diagrams

```bash
# Checkout and build godot
git clone https://github.com/godotengine/godot
cd godot
git checkout 3.3.4-stable
scons platform=x11 -j12
# Copy .clang-uml config to godot root directory
cp ../clang-uml-examples/godot/.clang-uml .
# Create output diagram directory
mkdir puml
# Comment out line 808 in 'core/object.h'
#   #include "core/class_db.h"
#
# Run clang-uml
clang-uml
# Generate diagrams
plantuml -tsvg puml/*.puml
```

## 'Object' class hierarchy

![puml](puml/object_class_hierarchy_diagram.svg)

## 'Resource' class hierarchy

![puml](puml/resource_class_hierarchy_diagram.svg)


## 'Object' class context

![puml](puml/object_class_context_diagram.svg)

## 'Node2D' class context brief

![puml](puml/node2d_class_context_diagram.svg)


## 'Node2D' class context full

![puml](puml/node2d_class_context_full_diagram.svg)
