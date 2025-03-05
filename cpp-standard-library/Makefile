CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

build:
		cd cpp-standard-library && \
		cmake -S . -B _build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

diagrams: build
		cd cpp-standard-library && \
		$(CLANG_UML_BINARY) -p --query-driver .

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py cpp-standard-library
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf cpp-standard-library/_build
