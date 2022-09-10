CLANG_UML_BINARY ?= ../../clang-uml/debug/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

yaml-cpp:
		git clone https://github.com/jbeder/yaml-cpp && \
		cd yaml-cpp && \
		git checkout yaml-cpp-0.7.0

build: yaml-cpp
		cd yaml-cpp && \
		mkdir -p _build && \
		cd _build && \
		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DYAML_CPP_BUILD_TESTS=OFF .. && \
		make -j8

diagrams: build
		cd yaml-cpp && \
		../$(CLANG_UML_BINARY) --config ../.clang-uml

plantuml: diagrams
		plantuml -tsvg puml/*.puml

clean:
		rm -rf yaml-cpp