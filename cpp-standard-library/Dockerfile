FROM bkryza/clang-uml-examples-common:v1
LABEL org.opencontainers.image.authors="bkryza@gmail.com"

ARG CLANG_UML_VERSION="0.6.1"

RUN /usr/bin/install-clang-uml.sh ${CLANG_UML_VERSION}

ENTRYPOINT ["/usr/bin/make"]
WORKDIR "/build"
CMD ["-C", "cpp-standard-library"]