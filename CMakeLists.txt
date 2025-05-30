cmake_minimum_required(VERSION 3.16)

project(Tesla VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appTesla
    main.cpp
)

qt_add_qml_module(appTesla
    URI Tesla
    VERSION 1.0
    QML_FILES Main.qml
    RESOURCES assets/Car.jpeg
    RESOURCES assets/carIcon.png
    RESOURCES assets/lock.png
    QML_FILES ui/BottomBar/BottomBar.qml
    RESOURCES assets/Car.jpeg
    RESOURCES assets/carIcon.png assets/lock.png
    QML_FILES ui/LeftScreen/LeftScreen.qml
    QML_FILES ui/RightScreen/RightScreen.qml
    QML_FILES ui/RightScreen/Navigation.qml
    RESOURCES assets/search.png
    QML_FILES ui/BottomBar/HVACComponent.qml
    RESOURCES assets/volume-up-interface-symbol.png
    RESOURCES assets/mediumVolume.png
    QML_FILES ui/BottomBar/VolumeController.qml
    RESOURCES assets/audio.png assets/calendar.png assets/camera-lens.png assets/itunes.png assets/line.png assets/more.png assets/phone-call.png assets/spotify.png assets/video.png
    QML_FILES ui/BottomBar/Icons.qml
    QML_FILES ui/BottomBar/LeftIcons.qml
    QML_FILES ui/BottomBar/RightIcons.qml
    RESOURCES assets/carRender.jpeg
    RESOURCES assets/battery1.png assets/battery2.png
    QML_FILES ui/LeftScreen/Battery.qml
    RESOURCES assets/car-indicator.png assets/car-indicator1.png assets/car-indicator2.png assets/car-indicator3.png
    QML_FILES ui/LeftScreen/IndicatorBar.qml
    RESOURCES assets/seatbelt.png
    RESOURCES assets/seatbelt.png assets/warning.png
    RESOURCES assets/unlock.png
    RESOURCES assets/Bus.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTesla PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTesla
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTesla
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTesla
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
