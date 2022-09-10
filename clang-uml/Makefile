CLANG_UML_BINARY ?= ../../clang-uml/debug/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

clang-uml:
		git clone https://github.com/bkryza/clang-uml && \
		cd clang-uml && \
		git checkout 0.2.1

build: clang-uml
		$(MAKE) -C clang-uml debug

diagrams: build
		cd clang-uml && \
		../$(CLANG_UML_BINARY) --output-directory ../puml

plantuml: diagrams
		plantuml -tsvg puml/*.puml

clean:
		rm -rf clang-uml