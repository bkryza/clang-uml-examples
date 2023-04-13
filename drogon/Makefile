CLANG_UML_BINARY ?= ../../clang-uml/debug/src/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

drogon:
		git clone https://github.com/drogonframework/drogon && \
		cd drogon && \
		git submodule update --init

build: drogon
		cd drogon && \
		mkdir -p _build && \
		cd _build && \
		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DBUILD_TESTING=OFF -DBUILD_SQLITE=OFF -DBUILD_MYSQL=OFF -DBUILD_REDIS=OFF .. && \
		make -j8

diagrams: build
		cd drogon && \
		cp ../.clang-uml .clang-uml && \
		../$(CLANG_UML_BINARY)

plantuml: diagrams
		plantuml -tsvg puml/*.puml

clean:
		rm -rf drogon