# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_TWISTEDRIBBON_CPP
        "${ADDON_DIR}/ofxTwistedRibbon/src/*.cpp" )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(    "${ADDON_DIR}/ofxTwistedRibbon/src" )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------


add_library(    ofxTwistedRibbon
                STATIC
                ${OFX_TWISTEDRIBBON_CPP} )
