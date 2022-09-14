CLANG_UML_BINARY ?= ../../clang-uml/debug/clang-uml

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
		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .. && \
		make -j8 || true

diagrams: build
		cd folly && \
		../$(CLANG_UML_BINARY) --config ../.clang-uml

plantuml: diagrams
		plantuml -tsvg puml/*.puml

clean:
		rm -rf folly