FROM bkryza/clang-uml-examples-common:v1
LABEL org.opencontainers.image.authors="bkryza@gmail.com"

RUN apt -y update && \
    apt -y install libssl-dev scons && \
    apt clean

ARG CLANG_UML_VERSION="0.6.0"

RUN /usr/bin/install-clang-uml.sh ${CLANG_UML_VERSION}

ENTRYPOINT ["/usr/bin/make"]
WORKDIR "/build"
CMD ["-C", "godot"]