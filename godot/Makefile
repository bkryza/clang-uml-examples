CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

godot:
		git clone --recursive https://github.com/godotengine/godot && \
		cd godot && \
		git checkout 3.6-stable

build: godot
		cd godot && \
		scons compiledb=yes platform=server -j8

diagrams: build
		cd godot && \
		cp ../.clang-uml .clang-uml && \
		$(CLANG_UML_BINARY) --query-driver . -p

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py godot
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf godot
