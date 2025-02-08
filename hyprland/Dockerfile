FROM bkryza/clang-uml-examples-common:v1

RUN apt -y update && apt -y install  \
        cmake-extras cmake gettext gettext-base fontconfig libfontconfig-dev \
        libffi-dev libxml2-dev libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev \
        libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev seatd \
        libxcb-dri3-dev libegl-dev libgles2 libegl1-mesa-dev glslang-tools \
        libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev \
        libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev \
        libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev \
        libtomlplusplus3 libpugixml-dev hwdata wayland-protocols libgbm-dev \
        libdisplay-info-dev libwayland-dev libzip-dev libcairo-dev \
        libtomlplusplus-dev librsvg2-dev libmagic-dev libspng-dev libxcursor-dev \
        libre2-dev libxcb-errors-dev && \
    apt clean


# hyprwayland-scanner
RUN git clone --recursive https://github.com/hyprwm/hyprwayland-scanner && \
    cd hyprwayland-scanner && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build && \
    cmake --build build -j `nproc` && \
    cmake --install build && \
    cd .. && \
    rm -rf hyprwayland-scanner

# hyprutils
RUN git clone --recursive https://github.com/hyprwm/hyprutils && \
    cd hyprutils && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build && \
    cmake --build build -j `nproc` && \
    cmake --install build && \
    cd .. && \
    rm -rf hyprutils

# aquamarine
RUN git clone --recursive https://github.com/hyprwm/aquamarine && \
    cd aquamarine && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build && \
    cmake --build build -j `nproc` && \
    cmake --install build && \
    cd .. && \
    rm -rf aquamarine

# hyprlang
RUN git clone --recursive https://github.com/hyprwm/hyprlang && \
    cd hyprlang && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build && \
    cmake --build build -j `nproc` && \
    cmake --install build && \
    cd .. && \
    rm -rf hyprlang

# hyprcursor
RUN git clone --recursive https://github.com/hyprwm/hyprcursor && \
    cd hyprcursor && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build && \
    cmake --build build -j `nproc` && \
    cmake --install build && \
    cd .. && \
    rm -rf hyprcursor

# hyprgraphics
RUN git clone --recursive https://github.com/hyprwm/hyprgraphics && \
    cd hyprgraphics && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build && \
    cmake --build build -j `nproc` && \
    cmake --install build && \
    cd .. && \
    rm -rf hyprgraphics

ARG CLANG_UML_VERSION="0.6.0"

RUN /usr/bin/install-clang-uml.sh ${CLANG_UML_VERSION}

ENTRYPOINT ["/usr/bin/make"]
WORKDIR "/build"
CMD ["-C", "hyprland"]