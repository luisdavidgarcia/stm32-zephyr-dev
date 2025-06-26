# stm32-zephyr-dev

To provide a more consistent development environment, I created a containerized STM32 and 
Zephyr RTOS setup that I could use to flash my STM32L476RG board. It’s designed to work 
across platforms—including Linux, macOS, and Apple Silicon—by running in either standard 
Docker or Apple Containers. This project uses a Fedora-based image (with Ubuntu support 
in progress) and includes everything needed to build and flash STM32 firmware in a 
reproducible way.

## 🔦 Example: Flashing Blinky to STM32

Flashing a basic Blinky firmware from inside the container to an STM32L476RG board.

![Flashing Blinky to STM32](assets/blinky-demo.gif)

### Prerequisites

- [Docker](https://www.docker.com/)
- (Optional) [Apple Containers](https://developer.apple.com/documentation/applecontainers)
- STM32L476RG board (or compatible STM32 MCU)
- USB-A to USB cable
- `make`

### Build the Fedora-based Container

```bash
make build_fedora
```

### Run the Container (with USB access for flashing)
> make run_fedora will automatically run make build_fedora if the image doesn't exist yet.

```bash
make run_fedora
```

These scripts handle building and running the container with proper USB passthrough so you can flash directly from inside the environment using OpenOCD.

## Resources
1. [OpenOCD](https://openocd.org/)
2. [Fedora Docker](https://hub.docker.com/_/fedora)
3. [ARM Cross Compile Toolchains](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads)
4. [Setup Cross Compiler](https://freeelectron.ro/arm-cross-compiler-tutorial-stm32/)

