CLANG_UML_BINARY ?= ../../clang-uml/debug/src/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

curl:
		git clone https://github.com/curl/curl

build: curl
		cd curl && \
		mkdir -p _build && \
		cd _build && \
		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCURL_DISABLE_TEST=ON -DCURL_DISABLE_INSTALL=ON -DBUILD_CURL_EXE=OFF ..

diagrams: build
		cd curl && \
		cp ../.clang-uml .clang-uml && \
		../$(CLANG_UML_BINARY) -p --query-driver .

plantuml: diagrams
		plantuml -tsvg puml/*.puml
		python3 ../generate_readme.py curl
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf curl