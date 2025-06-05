cmake_minimum_required(VERSION 3.16)

project(Tesla VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add required Qt modules (replace WebEngineQuick with WebView)
#find_package(Qt6 6.4 REQUIRED COMPONENTS Quick WebView )
find_package(Qt6 6.9 REQUIRED COMPONENTS Quick WebView)

qt_standard_project_setup()

# Main executable
qt_add_executable(appTesla
    main.cpp
)

# QML Module setup
qt_add_qml_module(appTesla
    URI Tesla
    VERSION 1.0

    QML_FILES
        Main.qml
        ui/BottomBar/BottomBar.qml
        ui/LeftScreen/LeftScreen.qml
        ui/RightScreen/RightScreen.qml
        ui/RightScreen/Navigation.qml
        ui/BottomBar/HVACComponent.qml
        ui/BottomBar/VolumeController.qml
        ui/BottomBar/Icons.qml
        ui/BottomBar/LeftIcons.qml
        ui/BottomBar/RightIcons.qml
        ui/LeftScreen/Battery.qml
        ui/LeftScreen/IndicatorBar.qml
        ui/LeftScreen/Musicplayer.qml

    RESOURCES
        assets/Car.jpeg
        assets/carIcon.png
        assets/lock.png
        assets/search.png
        assets/volume-up-interface-symbol.png
        assets/mediumVolume.png
        assets/audio.png
        assets/calendar.png
        assets/camera-lens.png
        assets/itunes.png
        assets/line.png
        assets/more.png
        assets/phone-call.png
        assets/spotify.png
        assets/video.png
        assets/carRender.jpeg
        assets/battery1.png
        assets/battery2.png
        assets/car-indicator.png
        assets/car-indicator1.png
        assets/car-indicator2.png
        assets/car-indicator3.png
        assets/seatbelt.png
        assets/warning.png
        assets/unlock.png
        assets/Bus.png
        assets/play.png
        assets/prev.png
        assets/next.png
        assets/album.jpg
        assets/dummy.png
        RESOURCES assets/navi.png
)

# Set app properties for macOS/iOS
set_target_properties(appTesla PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)

# Link required Qt libraries (replace WebEngineQuick with WebView)
target_link_libraries(appTesla
    PRIVATE Qt6::Quick Qt6::WebView
)

# Install rules
include(GNUInstallDirs)
install(TARGETS appTesla
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Copy HTML file to build directory
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/assets/html/google_map.html
    ${CMAKE_CURRENT_BINARY_DIR}/assets/html/google_map.html
    COPYONLY
)
