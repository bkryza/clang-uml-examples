CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

linux:
		git clone --depth 1 --branch v6.10 https://github.com/torvalds/linux

build: linux
		cd linux && \
		make defconfig && \
		make -j `nproc --ignore 8` && \
		scripts/clang-tools/gen_compile_commands.py

diagrams: build
		cd linux && \
		cp ../.clang-uml .clang-uml && \
		$(CLANG_UML_BINARY) -p

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py linux
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf linux
