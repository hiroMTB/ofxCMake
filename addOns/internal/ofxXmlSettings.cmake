# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_XML_CPP
        "${ADDON_DIR}/ofxXmlSettings/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${ADDON_DIR}/ofxXmlSettings/src"
        "${ADDON_DIR}/ofxXmlSettings/libs" )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxXmlSettings
                STATIC
                ${OFX_XML_CPP} )
