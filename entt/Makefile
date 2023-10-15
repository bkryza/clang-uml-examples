CLANG_UML_BINARY ?= ../../clang-uml/debug/src/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

entt:
		git clone https://github.com/skypjack/entt && \
		cd entt && \
		git checkout v3.11.1

build: entt
		cd entt && \
		mkdir -p _build && \
		cd _build && \
		cmake -DENTT_BUILD_TESTING=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

diagrams: build
		cd entt && \
		cp ../.clang-uml .clang-uml && \
		../$(CLANG_UML_BINARY) --query-driver .

plantuml: diagrams
		plantuml -tsvg puml/*.puml
		python3 ../generate_readme.py entt
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf entt