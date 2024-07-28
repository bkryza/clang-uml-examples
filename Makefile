CLANG_UML_BINARY ?= ../clang-uml/debug/src/clang-uml

.PHONY: clang-uml cppast drogon folly godot yaml-cpp poco entt freecad curl cpp-standard-library clean

all: clang-uml cppast drogon godot yaml-cpp poco entt freecad curl cpp-standard-library

clang-uml:
		$(MAKE) -C clang-uml CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

cppast:
		$(MAKE) -C cppast CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

drogon:
		$(MAKE) -C drogon CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

folly:
		$(MAKE) -C folly CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

godot:
		$(MAKE) -C godot CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

yaml-cpp:
		$(MAKE) -C yaml-cpp CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

poco:
		$(MAKE) -C poco CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

entt:
		$(MAKE) -C entt CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

freecad:
		$(MAKE) -C freecad CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

curl:
		$(MAKE) -C curl CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

cpp-standard-library:
		$(MAKE) -C cpp-standard-library CLANG_UML_BINARY=../$(CLANG_UML_BINARY)

clean:
		$(MAKE) -C clang-uml clean
		$(MAKE) -C cppast clean
		$(MAKE) -C drogon clean
		$(MAKE) -C godot clean
		$(MAKE) -C yaml-cpp clean
		$(MAKE) -C poco clean
		$(MAKE) -C entt clean
		$(MAKE) -C freecad clean
		$(MAKE) -C curl clean
		$(MAKE) -C cpp-standard-library clean

