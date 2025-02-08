CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

cppast:
		git clone https://github.com/foonathan/cppast

build: cppast
		cd cppast && \
		cmake -Wno-dev -S . -B _build -DLLVM_CONFIG_BINARY=/usr/bin/llvm-config-19 \
		      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCPPAST_BUILD_TEST=OFF

diagrams: build
		cd cppast && \
		cp ../.clang-uml .clang-uml && \
		$(CLANG_UML_BINARY) -p --query-driver .

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py cppast
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf cppast