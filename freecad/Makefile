CLANG_UML_BINARY ?= ../../clang-uml/debug/src/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

freecad:
		git clone https://github.com/FreeCAD/FreeCAD freecad && \
		cd freecad && \
		git checkout 0.21.1

build: freecad
		cd freecad && \
		mkdir -p _build && \
		cd _build && \
		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

diagrams: build
		cd freecad && \
		cp ../.clang-uml .clang-uml && \
		../$(CLANG_UML_BINARY) -p --query-driver .

plantuml: diagrams
		plantuml -tsvg puml/*.puml
		python3 ../generate_readme.py freecad

clean:
		rm -rf freecad