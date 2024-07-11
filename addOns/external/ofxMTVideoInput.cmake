# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_OFXMTAPPFRAMEWORK_CPP
        "${ADDON_DIR}/ofxMTVideoInput/src/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(    "${ADDON_DIR}/ofxMTVideoInput/src" )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxMTVideoInput
                STATIC
                ${OFX_OFXMTAPPFRAMEWORK_CPP} )
