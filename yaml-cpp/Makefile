CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

yaml-cpp:
		git clone https://github.com/jbeder/yaml-cpp && \
		cd yaml-cpp && \
		git checkout 0.8.0

build: yaml-cpp
		cd yaml-cpp && \
		cmake -S . -B _build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DYAML_CPP_BUILD_TESTS=OFF

diagrams: build
		cd yaml-cpp && \
		cp ../.clang-uml .clang-uml && \
		$(CLANG_UML_BINARY) --query-driver . -p --remove-compile-flag -Wshadow --add-compile-flag -Wno-shadow --config .clang-uml

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py yaml-cpp
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf yaml-cpp
