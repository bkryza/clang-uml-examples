CLANG_UML_BINARY ?= /usr/bin/clang-uml

.PHONY: clean build chromium diagrams plantuml all

all: plantuml

chromium:
		rm -rf depot_tools &&
		git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git &&
		env PATH=$$PWD/depot_tools:$$PATH bash -c 'mkdir -p chromium && cd chromium && fetch --nohooks --no-history chromium' && \
		env PATH=$$PWD/depot_tools:$$PATH bash -c 'cd chromium/src && gclient runhooks'

build: chromium
		env PATH=$$PWD/depot_tools:$$PATH bash -c "cd chromium/src && gn gen out/Default && tools/clang/scripts/generate_compdb.py -p out/Default > compile_commands.json && ninja -C out/Default chrome unit_tests browser_tests"

diagrams:
		$(CLANG_UML_BINARY) -t 1 -p -g plantuml

plantuml: diagrams
		plantuml -tsvg diagrams/*.puml
		python3 ../generate_readme.py chromium ./.clang-uml
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf chromium depot_tools
