# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_VECTORGRAPHICS_CPP
        "${ADDON_DIR}/ofxVectorGraphics/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${ADDON_DIR}/ofxVectorGraphics/src"
        "${ADDON_DIR}/ofxVectorGraphics/libs"
)

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxVectorGraphics
        STATIC
        ${OFX_VECTORGRAPHICS_CPP} )

#TODO include Libs