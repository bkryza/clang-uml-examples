CLANG_UML_BINARY ?= ../../clang-uml/debug/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

poco:
		git clone https://github.com/pocoproject/poco && \
		cd poco && \
		git checkout poco-1.12.3

build: poco
		cd poco && \
		mkdir -p _build && \
		cd _build && \
		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .. && \
		make -j8

diagrams: build
		cd poco && \
		../$(CLANG_UML_BINARY) --config ../.clang-uml

plantuml: diagrams
		plantuml -tsvg puml/*.puml

clean:
		rm -rf poco