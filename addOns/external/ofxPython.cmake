# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file( GLOB_RECURSE OFX_PYTHON_CPP
        "${ADDON_DIR}/ofxPython/src/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${ADDON_DIR}/ofxPython/src"
        )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxPython
                STATIC
                ${OFX_PYTHON_CPP}
                )


include_directories(/usr/include/python2.7)
