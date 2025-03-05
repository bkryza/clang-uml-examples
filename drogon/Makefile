CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

drogon:
		git clone --recursive https://github.com/drogonframework/drogon && \
        cd drogon && \
        git checkout v1.9.9

build: drogon
		cd drogon && \
		cmake -S . -B _build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DBUILD_TESTING=OFF \
		                     -DBUILD_SQLITE=OFF -DBUILD_MYSQL=OFF -DBUILD_REDIS=OFF

diagrams: build
		cd drogon && \
		cp ../.clang-uml .clang-uml && \
		$(CLANG_UML_BINARY) --query-driver clang++-19 -p

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py drogon

clean:
		rm -rf drogon
