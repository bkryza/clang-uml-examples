CLANG_UML_BINARY ?= /usr/bin/clang-uml
DOCKER_IMAGE_REVISION ?= 1

BUILD_DIRS = clang-uml chromium cppast drogon folly godot yaml-cpp poco entt freecad curl cpp-standard-library hyprland

.PHONY: all $(BUILD_DIRS) clean

all: $(BUILD_DIRS)

$(BUILD_DIRS):
	$(MAKE) -C $@ CLANG_UML_BINARY=$(CLANG_UML_BINARY)

clean:
	@for dir in $(BUILD_DIRS); do \
	  $(MAKE) -C $$dir clean; \
	done

docker/%:
	docker run -v $(PWD):/build -t bkryza/clang-uml-examples-$*:v$(DOCKER_IMAGE_REVISION) -C $*

dockerimage/%:
	docker build -t bkryza/clang-uml-examples-$*:v$(DOCKER_IMAGE_REVISION) $*

dockerpush:
	@for dir in $(BUILD_DIRS); do \
	  docker push bkryza/clang-uml-examples-$*:v$(DOCKER_IMAGE_REVISION); \
	done

dockerpush/%:
	docker push bkryza/clang-uml-examples-$*:v$(DOCKER_IMAGE_REVISION)
