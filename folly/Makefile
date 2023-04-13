CLANG_UML_BINARY ?= ../../clang-uml/debug/src/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

folly:
		git clone https://github.com/facebook/folly && \
		cd folly && \
		git checkout v2021.01.04.00

build: folly
		cd folly && \
		mkdir -p _build && \
		cd _build && \
		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

diagrams: build
		cd folly && \
		cp ../.clang-uml .clang-uml && \
		../$(CLANG_UML_BINARY)

plantuml: diagrams
		plantuml -tsvg puml/*.puml

clean:
		rm -rf folly