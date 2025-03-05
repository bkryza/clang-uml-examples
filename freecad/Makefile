CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

freecad:
		git clone --recursive https://github.com/FreeCAD/FreeCAD freecad && \
		cd freecad && \
		git checkout 1.0.0

build: freecad
		cd freecad && \
		cmake -Wno-dev -S . -B _build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && \
		cmake --build _build --target help | grep "autogen$$" | cut -c5- | xargs cmake --build _build -j `nproc --ignore 8` --target

diagrams: build
		cd freecad && \
		cp ../.clang-uml .clang-uml && \
		$(CLANG_UML_BINARY) -p

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py freecad
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf freecad