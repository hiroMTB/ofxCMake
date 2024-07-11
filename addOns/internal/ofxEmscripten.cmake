# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_EMSCRIPTEN_CPP
        "${ADDON_DIR}/ofxEmscripten/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${ADDON_DIR}/ofxEmscripten/src"
        "${ADDON_DIR}/ofxEmscripten/libs/html5audio/include"
        "${ADDON_DIR}/ofxEmscripten/libs/html5video/include"
        )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxEmscripten
        STATIC
        ${OFX_EMSCRIPTEN_CPP} )
