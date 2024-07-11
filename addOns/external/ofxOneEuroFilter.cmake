# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_ONEEUROFILTER_CPP
        "${ADDON_DIR}/ofxOneEuroFilter/src/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(    "${ADDON_DIR}/ofxOneEuroFilter/src" )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxOneEuroFilter
                STATIC
                ${OFX_ONEEUROFILTER_CPP} )
