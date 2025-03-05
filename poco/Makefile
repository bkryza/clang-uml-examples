CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

poco:
		git clone https://github.com/pocoproject/poco && \
		cd poco && \
		git checkout poco-1.14.0

build: poco
		cd poco && \
		cmake -S . -B _build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

diagrams: build
		cd poco && \
		cp ../.clang-uml .clang-uml && \
		$(CLANG_UML_BINARY) --query-driver . -p

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py poco
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf poco
