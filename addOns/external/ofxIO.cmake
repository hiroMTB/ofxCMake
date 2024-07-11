# -----------------------------------------------------------------
# --- Set the name of your AddOn
# -----------------------------------------------------------------

set( NAME_ADDON     ofxIO )

#==================================================================
#==================================================================
# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SOURCE    ${ADDON_DIR}/${NAME_ADDON}/src )
set( PATH_LIBS      ${ADDON_DIR}/${NAME_ADDON}/libs )

# --- Setting abolute path to prevent errors
get_filename_component( PATH_SOURCE_ABSOLUTE ${PATH_SOURCE} ABSOLUTE)
get_filename_component( PATH_LIBS_ABSOLUTE ${PATH_LIBS} ABSOLUTE)

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB_RECURSE   OFX_ADDON_CPP   "${PATH_LIBS}/*.cpp" )
file( GLOB_RECURSE   OFX_ADDON_CC    "${PATH_LIBS}/*.cc" )
file( GLOB_RECURSE   OFX_ADDON_C     "${PATH_LIBS}/*.c" )
add_library(  ${NAME_ADDON}   STATIC
        ${OFX_ADDON_CPP}
        ${OFX_ADDON_CC}
        ${OFX_ADDON_C} )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

include_directories(
        ${ADDON_DIR}/ofxIO/src
        ${ADDON_DIR}/ofxIO/libs/alphanum/include
        ${ADDON_DIR}/ofxIO/libs/brotli/src
        ${ADDON_DIR}/ofxIO/libs/lz4/src
        ${ADDON_DIR}/ofxIO/libs/ofxIO/include
        ${ADDON_DIR}/ofxIO/libs/snappy/src )


# -----------------------------------------------------------------
# ------------------------------ LIBS  ----------------------------
# -----------------------------------------------------------------
