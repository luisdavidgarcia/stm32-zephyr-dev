FROM fedora:42

RUN dnf update -y && dnf install -y \
  gcc \
  g++ \
  cmake \
  make \
  git \
  wget \
  openocd \
  libusb \
  stlink \
  && dnf clean all

WORKDIR /workspace

CMD ["bash"]
