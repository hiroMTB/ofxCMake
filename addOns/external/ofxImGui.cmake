# =================================================================
#
# Template for addOns
#
# Easiest way: replace all the NAME into the name of your addOn
# It has to have the same name, as the directory it is in
# [e.g. ofxOneEuroFilter is in of/addons/ofxOneEuroFilter/]
#
# =================================================================

set( NAME_ADDON     ofxImGui )       # <--- Set the name here

#==================================================================


# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SRC    ${ADDON_DIR}/${NAME_ADDON}/src )
set( PATH_LIBS      ${ADDON_DIR}/${NAME_ADDON}/libs )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------
if( NOT ${IMPORT_ADDON} )
    file( GLOB_RECURSE   OFX_ADDON_CPP          "${PATH_SRC}/*.cpp" )
    file( GLOB_RECURSE   OFX_ADDON_LIBS_CPP     "${PATH_LIBS}/*.cpp" )
endif()

if( NOT ${IMPORT_ADDON} )
    add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} ${OFX_ADDON_LIBS_CPP} )
else()
    add_library( ${NAME_ADDON} STATIC IMPORTED GLOBAL)
    set( LIB_BASE_NAME ${OFX_CMAKE_PATH}/libs/libofxImGui)
    string(CONCAT LIB_DEBUG    ${LIB_BASE_NAME} ${CMAKE_DEBUG_POSTFIX} ${CMAKE_STATIC_LIBRARY_SUFFIX})
    string(CONCAT LIB_RELEASE  ${LIB_BASE_NAME} ${CMAKE_STATIC_LIBRARY_SUFFIX})
    set_target_properties(${NAME_ADDON} PROPERTIES IMPORTED_LOCATION_DEBUG ${LIB_DEBUG} )
    set_target_properties(${NAME_ADDON} PROPERTIES IMPORTED_LOCATION_RELEASE ${LIB_RELEASE})
endif()

set_target_properties(${NAME_ADDON}  PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY    ${OFX_CMAKE_PATH}/libs/
        ARCHIVE_OUTPUT_DIRECTORY    ${OFX_CMAKE_PATH}/libs/
)

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
OF_find_header_directories( HEADERS_LIBS ${PATH_LIBS} )

include_directories( ${HEADERS_SOURCE} )
include_directories( ${HEADERS_LIBS} )
include_directories( ${PATH_LIBS}/imgui )
#message( ${HEADERS_LIBS} )