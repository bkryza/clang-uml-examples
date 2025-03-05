CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

folly:
		git clone https://github.com/facebook/folly && \
		cd folly && \
		git checkout v2025.02.03.00

build: folly
		cd folly && \
		cmake -S . -B _build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

diagrams: build
		cd folly && \
		cp ../.clang-uml .clang-uml && \
		$(CLANG_UML_BINARY) --query-driver clang++-19 -p

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py folly
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf folly
