# -----------------------------------------------------------------
# --- NO script applied, as there are different
# --- versions for each plattform
# -----------------------------------------------------------------

# TODO Windows libs
set( OFX_OSC_CPP
        ${ADDON_DIR}/ofxOsc/libs/oscpack/src/ip/IpEndpointName.cpp
        ${ADDON_DIR}/ofxOsc/libs/oscpack/src/ip/posix/NetworkingUtils.cpp
        ${ADDON_DIR}/ofxOsc/libs/oscpack/src/ip/posix/UdpSocket.cpp
#        ${ADDON_DIR}/ofxOsc/libs/oscpack/src/ip/win32/NetworkingUtils.cpp
#        ${ADDON_DIR}/ofxOsc/libs/oscpack/src/ip/win32/UdpSocket.cpp
        ${ADDON_DIR}/ofxOsc/libs/oscpack/src/osc/OscOutboundPacketStream.cpp
        ${ADDON_DIR}/ofxOsc/libs/oscpack/src/osc/OscPrintReceivedElements.cpp
        ${ADDON_DIR}/ofxOsc/libs/oscpack/src/osc/OscReceivedElements.cpp
        ${ADDON_DIR}/ofxOsc/libs/oscpack/src/osc/OscTypes.cpp
        ${ADDON_DIR}/ofxOsc/src/ofxOscBundle.cpp
        ${ADDON_DIR}/ofxOsc/src/ofxOscMessage.cpp
        ${ADDON_DIR}/ofxOsc/src/ofxOscParameterSync.cpp
        ${ADDON_DIR}/ofxOsc/src/ofxOscReceiver.cpp
        ${ADDON_DIR}/ofxOsc/src/ofxOscSender.cpp )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(    "${ADDON_DIR}/ofxOsc/src"
                        "${ADDON_DIR}/ofxOsc/libs/oscpack/src"
                        "${ADDON_DIR}/ofxOsc/libs/oscpack/src/ip"
                        "${ADDON_DIR}/ofxOsc/libs/oscpack/src/osc" )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------


add_library( ofxOsc STATIC ${OFX_OSC_CPP} )
