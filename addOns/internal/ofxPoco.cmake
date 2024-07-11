
set( NAME_ADDON     ofxPoco )       # <--- Set the name here

#==================================================================


# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SRC    ${ADDON_DIR}/${NAME_ADDON}/src )
set( PATH_LIBS      ${ADDON_DIR}/${NAME_ADDON}/libs )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB_RECURSE   OFX_ADDON_CPP          "${PATH_SRC}/*.cpp" )
file( GLOB_RECURSE   OFX_ADDON_LIBS_CPP     "${PATH_LIBS}/*.cpp" )
add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} ${OFX_ADDON_LIBS_CPP} )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

# OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
# include_directories( ${HEADERS_SOURCE} )
#
# OF_find_header_directories( HEADERS_LIBS ${PATH_LIBS} )
# include_directories( ${HEADERS_LIBS} )
include_directories( "${PATH_LIBS}/openssl/include" )
include_directories( "${PATH_LIBS}/poco/include" )

# -----------------------------------------------------------------
# ------------------------------ LIBS  ----------------------------
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# --- In case OS specific libs are needed
# --- Be sure to link them in target_link_libraries()
# -----------------------------------------------------------------

if( APPLE )
	set(openSSL1 "${ADDON_DIR}/ofxPoco/libs/openssl/lib/osx/crypto.a" )
	set(openSSL2 "${ADDON_DIR}/ofxPoco/libs/openssl/lib/osx/ssl.a" )

	set( poco1    "${ADDON_DIR}/ofxPoco/libs/openssl/lib/osx/crypto.a" )
    set( poco2    "${ADDON_DIR}/ofxPoco/libs/openssl/lib/osx/ssl.a" )
    set( poco3    "${ADDON_DIR}/ofxPoco/libs/poco/lib/osx/PocoCrypto.a" )
    set( poco4    "${ADDON_DIR}/ofxPoco/libs/poco/lib/osx/PocoFoundation.a" )
    set( poco5    "${ADDON_DIR}/ofxPoco/libs/poco/lib/osx/PocoJSON.a" )
    set( poco6    "${ADDON_DIR}/ofxPoco/libs/poco/lib/osx/PocoNet.a" )
    set( poco7    "${ADDON_DIR}/ofxPoco/libs/poco/lib/osx/PocoNetSSL.a" )
    set( poco8    "${ADDON_DIR}/ofxPoco/libs/poco/lib/osx/PocoXML.a" )
    set( poco9    "${ADDON_DIR}/ofxPoco/libs/poco/lib/osx/PocoZip.a" )
#    find_library( CORE_FOUNDATION_LIB_${NAME_ADDON}  CoreFoundation)
#    set( compiledLib    "${OF_CMAKE_ADDONS}/${NAME_ADDON}/lib/myLib.a" )
   set(    EXTRA_LIBS_ofxPoco
           ${poco1}
		   ${poco2}
		   ${poco3}
		   ${poco4}
		   ${poco5}
		   ${poco6}
		   ${poco7}
		   ${poco8}
		   ${poco9}
		   ${openSSL1}
		   ${openSSL2}
           )
endif()

target_link_libraries( ofxPoco ${EXTRA_LIBS_ofxPoco} )
