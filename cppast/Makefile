CLANG_UML_BINARY ?= ../../clang-uml/debug/src/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

cppast:
		git clone https://github.com/foonathan/cppast

build: cppast
		cd cppast && \
		mkdir -p _build && \
		cd _build && \
		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCPPAST_BUILD_TEST=OFF ..

diagrams: build
		cd cppast && \
		cp ../.clang-uml .clang-uml && \
		../$(CLANG_UML_BINARY) -p --query-driver .

plantuml: diagrams
		plantuml -tsvg puml/*.puml
		python3 ../generate_readme.py cppast

clean:
		rm -rf cppast