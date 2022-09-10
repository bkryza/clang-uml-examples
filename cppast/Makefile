CLANG_UML_BINARY ?= ../../clang-uml/debug/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

cppast:
		git clone https://github.com/foonathan/cppast

build: cppast
		cd cppast && \
		mkdir -p _build && \
		cd _build && \
		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCPPAST_BUILD_TEST=OFF .. && \
		make -j8

diagrams: build
		cd cppast && \
		../$(CLANG_UML_BINARY) --config ../.clang-uml

plantuml: diagrams
		plantuml -tsvg puml/*.puml

clean:
		rm -rf cppast