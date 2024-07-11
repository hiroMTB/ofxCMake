# =================================================================
#
# Template for addOns
#
# Easiest way: replace all the NAME into the name of your addOn
# It has to have the same name, as the directory it is in
# [e.g. ofxOneEuroFilter is in of/addons/ofxOneEuroFilter/]
#
# =================================================================

set( NAME_ADDON     ofxImGuiNodeEditorCv )

set( PATH_SRC    ${ADDON_DIR}/${NAME_ADDON}/src )

if( NOT ${IMPORT_ADDON} )

    file( GLOB_RECURSE   OFX_ADDON_CPP          "${PATH_SRC}/*.cpp" )
    add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} )

else ()
    add_library( ${NAME_ADDON} STATIC IMPORTED GLOBAL)

    set( LIB_BASE_NAME ${OFX_CMAKE_PATH}/libs/libofxImGuiNodeEditorCv)
    string(CONCAT LIB_DEBUG    ${LIB_BASE_NAME} ${CMAKE_DEBUG_POSTFIX} ${CMAKE_STATIC_LIBRARY_SUFFIX})
    string(CONCAT LIB_RELEASE  ${LIB_BASE_NAME} ${CMAKE_STATIC_LIBRARY_SUFFIX})
    set_target_properties(ofxImGuiNodeEditorCv PROPERTIES IMPORTED_LOCATION_DEBUG ${LIB_DEBUG} )
    set_target_properties(ofxImGuiNodeEditorCv PROPERTIES IMPORTED_LOCATION_RELEASE ${LIB_RELEASE})
endif ()

set_target_properties(ofxImGuiNodeEditorCv PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY    ${OFX_CMAKE_PATH}/libs/
        ARCHIVE_OUTPUT_DIRECTORY    ${OFX_CMAKE_PATH}/libs/
)

OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
include_directories( ${HEADERS_SOURCE} )

include( ${ADDON_DIR}/ofxCmake/addOns/external/ofxCereal.cmake )

