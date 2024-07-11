# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file( GLOB_RECURSE OFX_MIDI_CPP
        "${ADDON_DIR}/ofxMidi/src/*.cpp"
        "${ADDON_DIR}/ofxMidi/libs/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${ADDON_DIR}/ofxMidi/src"
        "${ADDON_DIR}/ofxMidi/src/desktop"
        "${ADDON_DIR}/ofxMidi/libs/rtmidi"
        )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxMidi
                STATIC
                ${OFX_MIDI_CPP}
                )

if( APPLE )
        find_library( CORE_FOUNDATION_LIB_MIDI  CoreFoundation)
        find_library( CORE_MIDI                 CoreMIDI )
        find_library( CORE_AUDIO_LIB_MIDI       CoreAudio)
        set(    EXTRA_LIBS_MIDI
                ${CORE_FOUNDATION_LIB_MIDI}
                ${CORE_AUDIO_LIB_MIDI}
                ${CORE_MIDI}
                )
endif()

target_link_libraries( ofxMidi ${EXTRA_LIBS_MIDI}  )