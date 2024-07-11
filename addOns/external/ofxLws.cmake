set( NAME_ADDON     ofxLws ) 

# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SRC    ${ADDON_DIR}/${NAME_ADDON}/src )
set( PATH_LIBS   ${ADDON_DIR}/${NAME_ADDON}/libs/ )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

# ! important that it is .c** to include cxx files. !

file( GLOB_RECURSE   OFX_ADDON_CPP          "${PATH_SRC}/*.c**" )
file( GLOB_RECURSE   OFX_ADDON_LIBS_CPP     "${PATH_LIBS}/*.c**" )
add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP}  ${OFX_ADDON_LIBS_CPP})

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
OF_find_header_directories( HEADERS_LIBS ${PATH_LIBS} )


include_directories( ${HEADERS_SOURCE} )
include_directories( $${PATH_SRC}/FBXSource )
include_directories( ${HEADERS_LIBS} )
include_directories( "${PATH_LIBS}/libwebsockets/include" )
include_directories( "${PATH_LIBS}/ofxLibwebsockets/include" )
include_directories( "${PATH_LIBS}/openssl/include" )
#include_directories( "${PATH_LIBS}/openssl/include" )


if(APPLE)
	set(liblws "${PATH_LIBS}/libwebsockets/lib/osx/libwebsockets.a" )
	message("Adding libwebsockets.a : ${PATH_LIBS}/lib/osx/libwebsockets.a")
	target_link_libraries( ofxLws ${liblws} ${CMAKE_DL_LIBS})
elseif(UNIX)
#	set(libfbx "${PATH_LIBS}/lib/linux64/libfbxsdk.a" )
#	target_link_libraries( ofxFBX ${libfbx} ${CMAKE_DL_LIBS} pugixml z xml2 pthread)
endif()

