# -----------------------------------------------------------------
# --- NO script applied, as there are different
# --- versions for each plattform
# -----------------------------------------------------------------

# TODO Windows libs
set( OFX_KINECT_CPP
        ${ADDON_DIR}/ofxKinect/src/extra/ofxKinectExtras.cpp
        ${ADDON_DIR}/ofxKinect/src/ofxKinect.cpp
        ${ADDON_DIR}/ofxKinect/libs/libfreenect/src/audio.c
        ${ADDON_DIR}/ofxKinect/libs/libfreenect/src/cameras.c
        ${ADDON_DIR}/ofxKinect/libs/libfreenect/src/core.c
        ${ADDON_DIR}/ofxKinect/libs/libfreenect/src/flags.c
        ${ADDON_DIR}/ofxKinect/libs/libfreenect/src/keep_alive.c
        ${ADDON_DIR}/ofxKinect/libs/libfreenect/src/loader.c
        ${ADDON_DIR}/ofxKinect/libs/libfreenect/src/registration.c
        ${ADDON_DIR}/ofxKinect/libs/libfreenect/src/tilt.c
        ${ADDON_DIR}/ofxKinect/libs/libfreenect/src/usb_libusb10.c
        ##        ${ADDON_DIR}/ofxKinect/libs/libfreenect/platform/windows/libusb10emu/libusb-1.0/failguard.cpp
        ##        ${ADDON_DIR}/ofxKinect/libs/libfreenect/platform/windows/libusb10emu/libusb-1.0/libusbemu.cpp
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${ADDON_DIR}/ofxKinect/src"
        "${ADDON_DIR}/ofxKinect/src/extra"
        "${ADDON_DIR}/ofxKinect/libs/libfreenect/include"
        "${ADDON_DIR}/ofxKinect/libs/libfreenect/src"
        "${ADDON_DIR}/ofxKinect/libs/libusb-1.0/include/libusb-1.0" )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxKinect
                STATIC
                ${OFX_KINECT_CPP} )

# -----------------------------------------------------------------
# --- Setting a compiled lib
# -----------------------------------------------------------------
#TODO Libs for other OS (Win & Linux)

if( APPLE )
    find_library( CORE_FOUNDATION_LIB_KINECT  CoreFoundation)
    find_library( IOKIT_LIB_KINECT  IOKit)
    find_library( COCOA_LIB_KINECT  Cocoa)
    set(          ofxKinectLib  "${ADDON_DIR}/ofxKinect/libs/libusb-1.0/lib/osx/usb-1.0.a" )

    set(    EXTRA_LIBS_KINECT
            ${CORE_FOUNDATION_LIB_KINECT}
            ${IOKIT_LIB_KINECT}
            ${COCOA_LIB_KINECT}
            ${ofxKinectLib}
           )
endif()

target_link_libraries(  ofxKinect ${EXTRA_LIBS_KINECT} )