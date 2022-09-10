CLANG_UML_BINARY ?= ../../clang-uml/debug/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

godot:
		git clone https://github.com/godotengine/godot && \
		cd godot && \
		git checkout 3.3.4-stable

build: godot
		cd godot && \
		scons platform=x11 -j8

diagrams: build
		cd godot && \
		../$(CLANG_UML_BINARY) --config ../.clang-uml

plantuml: diagrams
		plantuml -tsvg puml/*.puml

clean:
		rm -rf godot