CLANG_UML_BINARY ?= ../../clang-uml/debug/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

clang-uml:
		git clone https://github.com/bkryza/clang-uml && \
		cd clang-uml && \
		git checkout 0.3.6

build: clang-uml
		LLVM_VERSION=15 $(MAKE) -C clang-uml debug/CMakeLists.txt

diagrams: build
		cd clang-uml && \
		../$(CLANG_UML_BINARY) --output-directory ../puml --query-driver .

plantuml: diagrams
		plantuml -tsvg puml/*.puml

clean:
		rm -rf clang-uml
