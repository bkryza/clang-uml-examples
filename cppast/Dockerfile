FROM bkryza/clang-uml-examples-common:v1

RUN apt -y update && \
    apt -y install libyaml-cpp-dev llvm-19 llvm-19-dev clang-19 libclang-19-dev libclang-cpp19-dev && \
    apt clean

ARG CLANG_UML_VERSION="0.6.1"

RUN /usr/bin/install-clang-uml.sh ${CLANG_UML_VERSION}

ENTRYPOINT ["/usr/bin/make"]
WORKDIR "/build"
CMD ["-C", "cppast"]
