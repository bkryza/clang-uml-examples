CLANG_UML_BINARY ?= ../../clang-uml/debug/src/clang-uml

.PHONY: patch clean build diagrams plantuml

all: plantuml

.PHONY: patch

curl:
		git clone https://github.com/curl/curl

patch: curl
	cd curl && \
	if patch -R --force -p1 --dry-run --silent < ../disable_easy_locks.patch; then \
		echo "Patch already applied."; \
	else \
		patch --force -p1 < ../disable_easy_locks.patch && echo "Patch applied successfully."; \
	fi

build: patch
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
