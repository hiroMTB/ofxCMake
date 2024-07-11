set( NAME_ADDON     ofxRaycaster )

# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SRC    ${ADDON_DIR}/${NAME_ADDON}/src )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB_RECURSE   OFX_RAYCASTER_CPP          "${PATH_SRC}/*.cpp" )
add_library(  ${NAME_ADDON}   STATIC   ${OFX_RAYCASTER_CPP}  )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------


OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
include_directories( ${HEADERS_SOURCE} )

message( HEADER "${HEADERS_SOURCE}" )