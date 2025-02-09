FROM bkryza/clang-uml-examples-common:v1
LABEL org.opencontainers.image.authors="bkryza@gmail.com"

RUN apt -y update && \
    apt -y install libssl-dev qt6-base-dev libxerces-c-dev libocct-foundation-dev \
                   libglu1-mesa-dev libvtk9-dev libmedc-dev \
                   libboost-all-dev qt6-svg-dev qt6-tools-dev qt6-webengine-dev \
                   libyaml-cpp-dev qt6-translations-l10n linguist-qt6 qt6-tools-dev-tools \
                   libfreetype-dev swig qt6-tools-private-dev libocct-modeling-algorithms-dev \
                   libocct-modeling-data-dev libocct-data-exchange-dev libocct-visualization-dev \
                   libocct-draw-dev libocct-foundation-dev libocct-ocaf-dev && \
    apt clean

# Install Coin3D
RUN git clone --recurse-submodules https://github.com/coin3d/coin coin && \
    cmake -Hcoin -Bcoin_build -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr/local \
          -DDCMAKE_BUILD_TYPE=Release -DCOIN_BUILD_DOCUMENTATION=OFF && \
    cmake --build coin_build -j `nproc` && \
    cmake --install coin_build && \
    rm -rf coin && \
    rm -rf coin_build

ARG CLANG_UML_VERSION="0.6.0"

RUN /usr/bin/install-clang-uml.sh ${CLANG_UML_VERSION}

ENTRYPOINT ["/usr/bin/make"]
WORKDIR "/build"
CMD ["-C", "freecad"]