CLANG_UML_BINARY ?= ../../clang-uml/debug/src/clang-uml

.PHONY: clean build diagrams plantuml

all: plantuml

chromium:
		git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
		PATH="${PWD}/depot_tools:${PATH}" bash -c " mkdir -p ~/chromium && cd ~/chromium && fetch --nohooks --no-history chromium && cd chromium/src && client runhooks"
build: chromium
		PATH="${PWD}/depot_tools:${PATH}" bash -c "cd chromium/src && tools/clang/scripts/generate_compdb.py -p out/Default > compile_commands.json && ninja -C out/Default media/gpu:buildflags"

diagrams:
		cd chromium/src && \
		mkdir -p _build/_build && \
		cd _build/_build && \
		cp ../../../../.clang-uml .clang-uml && \
		../../../../$(CLANG_UML_BINARY) -p

plantuml:
		plantuml -tsvg puml/*.puml
		python3 ../generate_readme.py chromium ./.clang-uml
		markdown-toc  --bullets "*" -i README.md

clean:
		rm -rf chromium depot_tools
