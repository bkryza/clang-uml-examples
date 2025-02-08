FROM bkryza/clang-uml-examples-common:v1
LABEL org.opencontainers.image.authors="bkryza@gmail.com"

RUN apt -y update && \
    apt -y install libyaml-cpp-dev llvm-19 llvm-19-dev clang-19 clang-tools-19 libclang-19-dev \
           libclang-cpp19-dev libmlir-19-dev mlir-19-tools libdw-dev libunwind-dev && \
    apt clean

ARG CLANG_UML_VERSION="0.6.0"

RUN /usr/bin/install-clang-uml.sh ${CLANG_UML_VERSION}

ENTRYPOINT ["/usr/bin/make"]
WORKDIR "/build"
CMD ["-C", "clang-uml"]