# TeslaUI

A Tesla Model S inspired user interface created using Qt/QML.

## Overview

TeslaUI is a modern, elegant user interface inspired by the Tesla Model S infotainment system. Built entirely with Qt and QML, this project recreates the sleek design and intuitive layout of Tesla's renowned in-car interface.

## Features

- Responsive design matching Tesla Model S display aesthetics
- Clean, minimalist interface with dark mode styling
- Interactive components including:
  - Bottom navigation bar
  - Split-screen layout (left and right panels)
  - HVAC controls
  - Volume controller
  - Battery status indicator
  - Navigation system
- Smooth animations and transitions

## Project Structure

- `assets/` - Images, icons, and resources
- `ui/` - QML interface components
  - `BottomBar/` - Bottom navigation components
    - `BottomBar.qml` - Main bottom bar implementation
    - `HVACComponent.qml` - Climate control interface
    - `Icons.qml` - Icon components
    - `LeftIcons.qml` - Left section icons
    - `RightIcons.qml` - Right section icons
    - `VolumeController.qml` - Audio volume interface
  - `LeftScreen/` - Left panel components
    - `Battery.qml` - Battery status indicator
    - `IndicatorBar.qml` - Status indicators
    - `LeftScreen.qml` - Main left panel implementation
  - `RightScreen/` - Right panel components
    - `Navigation.qml` - Map and navigation interface
    - `RightScreen.qml` - Main right panel implementation

## Prerequisites

- Qt 6.2 or higher (Qt 5.15+ should also work)
- QtQuick and QtQuick Controls 2
- C++ compiler with C++11 support

## Building the Project

1. Clone the repository:
   ```
   git clone https://github.com/GilbertAshivaka/TeslaUI.git
   ```

2. Open the project in Qt Creator:
   ```
   qtcreator TeslaUI.pro
   ```

3. Configure the project for your kit and build

Alternatively, build from command line:

```bash
mkdir build && cd build
qmake ..
make # (or nmake/mingw32-make on Windows)
```

## Usage

Run the application to launch the Tesla-inspired interface. Navigate through the various screens using the bottom bar controls. Interact with the climate controls, navigation, and other components as you would in a Tesla Model S.


## Design Philosophy

This project aims to recreate the clean, minimalist aesthetic of Tesla's user interface while providing a learning resource for Qt/QML developers. The interface prioritizes:

- Simplicity and elegance
- High contrast visuals
- Intuitive controls
- Responsive layout

## Contributing

Contributions to TeslaUI are welcome! Whether you're fixing bugs, improving the design, or adding new features, please feel free to fork the repository and submit a pull request.


## Acknowledgments

- Tesla for the original UI design inspiration
- Qt for the powerful QML framework

## Contact

Gilbert Ashivaka - [GitHub Profile](https://github.com/GilbertAshivaka)

Project Link: [https://github.com/GilbertAshivaka/TeslaUI](https://github.com/GilbertAshivaka/TeslaUI)
