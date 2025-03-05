CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

entt:
		git clone https://github.com/skypjack/entt && \
		cd entt && \
		git checkout v3.14.0

build: entt
		cd entt && \
		cmake -Wno-dev -S . -B _build -DENTT_BUILD_TESTING=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

diagrams: build
		cd entt && \
		cp ../.clang-uml .clang-uml && \
		$(CLANG_UML_BINARY) --query-driver . -p

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py entt
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf entt