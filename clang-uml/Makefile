CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

clang-uml:
		git clone https://github.com/bkryza/clang-uml && \
		cd clang-uml && \
		git checkout v0.6.1

build: clang-uml
		LLVM_VERSION=19 $(MAKE) -C clang-uml debug/CMakeLists.txt

diagrams: build
		cd clang-uml && \
		$(CLANG_UML_BINARY) -p --query-driver .

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py clang-uml
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf clang-uml
