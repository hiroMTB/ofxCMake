# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_FLOWTOOLS_CPP
        "${ADDON_DIR}/ofxFlowTools/src/*.cpp" )
# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${ADDON_DIR}/ofxFlowTools/src"
        "${ADDON_DIR}/ofxFlowTools/src/drawforces"
        "${ADDON_DIR}/ofxFlowTools/src/filters"
        "${ADDON_DIR}/ofxFlowTools/src/fluid"
        "${ADDON_DIR}/ofxFlowTools/src/mask"
        "${ADDON_DIR}/ofxFlowTools/src/opticalflow"
        "${ADDON_DIR}/ofxFlowTools/src/particles"
        "${ADDON_DIR}/ofxFlowTools/src/splitvelocity"
        "${ADDON_DIR}/ofxFlowTools/src/tools"
        "${ADDON_DIR}/ofxFlowTools/src/visualisation"
)

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxFlowTools
                STATIC
                ${OFX_FLOWTOOLS_CPP} )
