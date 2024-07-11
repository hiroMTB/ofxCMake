# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file( GLOB_RECURSE OFX_BTRACK_CPP
        "${ADDON_DIR}/ofxBTrack/src/*.cpp"
        "${ADDON_DIR}/ofxBTrack/libs/BTrack/*.cpp"
        "${ADDON_DIR}/ofxBTrack/libs/kiss_fft130/*.c"
        "${ADDON_DIR}/ofxBTrack/libs/libsamplerate/*.c"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${ADDON_DIR}/ofxBTrack/src"
        "${ADDON_DIR}/ofxBTrack/libs/BTrack"
        "${ADDON_DIR}/ofxBTrack/libs/kiss_fft130"
        "${ADDON_DIR}/ofxBTrack/libs/libsamplerate"
        )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxBTrack
                STATIC
                ${OFX_BTRACK_CPP}
                )
