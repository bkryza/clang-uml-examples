CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

hyprland:
		git clone --recursive https://github.com/hyprwm/hyprland && \
		cd hyprland && \
		git checkout v0.47.2

build: hyprland
		cd hyprland && \
		cmake -S . -B _build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && \
		cmake --build _build -j `nproc`

diagrams: build
		cd hyprland && \
		cp ../.clang-uml .clang-uml && \
		$(CLANG_UML_BINARY) -p -g plantuml

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py hyprland
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf hyprland
