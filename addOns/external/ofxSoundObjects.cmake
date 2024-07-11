set( NAME_ADDON     ofxSoundObjects )

# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SRC    ${ADDON_DIR}/${NAME_ADDON}/src )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB_RECURSE   OFX_ADDONS_CPP          "${PATH_SRC}/*.cpp" )
add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDONS_CPP}  )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

include_directories( ${PATH_SRC} )
include_directories( ${PATH_SRC}/SoundObjects )
include_directories( ${PATH_SRC}/Renderers )
include_directories( ${PATH_SRC} )

# if(APPLE)
# elseif(UNIX)
# endif()

