# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file( GLOB_RECURSE OFX_LUA_CPP
        "${ADDON_DIR}/ofxLua/src/*.cpp"
        "${ADDON_DIR}/ofxLua/src/bindings/desktop/*.cpp"
        "${ADDON_DIR}/ofxLua/libs/lua/*.c"
        "${ADDON_DIR}/ofxLua/libs/lua/*.hpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${ADDON_DIR}/ofxLua/src"
        "${ADDON_DIR}/ofxLua/src/bindings"
        "${ADDON_DIR}/ofxLua/libs/lua"
        )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxLua
                STATIC
                ${OFX_LUA_CPP}
                )
