CLANG_UML_BINARY ?= ../../clang-uml/debug/src/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

build:
		cd cpp-standard-library && \
		mkdir -p _build && \
		cd _build && \
		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

diagrams: build
		cd cpp-standard-library && \
		../$(CLANG_UML_BINARY) -p --query-driver .

plantuml: diagrams
		plantuml -tsvg puml/*.puml
		python3 ../generate_readme.py cpp-standard-library
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf cpp-standard-library/_build
