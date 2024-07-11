set( NAME_ADDON     ofxRabbitControl )


# src
set( PATH_SRC    ${ADDON_DIR}/${NAME_ADDON}/src )
file( GLOB_RECURSE   OFX_ADDON_CPP  "${PATH_SRC}/*.cpp" )

#libs
file( REAL_PATH ${ADDON_DIR}/${NAME_ADDON}/libs PATH_LIBS)

file( GLOB_RECURSE   OFX_ADDON_LIBS_CPP "${PATH_LIBS}/*.cpp" 
                                        "${PATH_LIBS}/*.hpp" 
                                    )


add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} ${OFX_ADDON_LIBS_CPP} )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
OF_find_header_directories( HEADERS_LIBS ${PATH_LIBS} )

include_directories( ${HEADERS_SOURCE} )
include_directories( ${PATH_LIBS} )
include_directories( ${HEADERS_LIBS} )
include_directories( ${PATH_LIBS}/asio )

target_compile_definitions(ofxRabbitControl PUBLIC ASIO_STANDALONE)
target_compile_definitions(ofxRabbitControl PUBLIC ASIO_SEPARATE_COMPILATION)
target_compile_definitions(ofxRabbitControl PUBLIC _WEBSOCKETPP_CPP11_CHRONO_)
target_compile_definitions(ofxRabbitControl PUBLIC _WEBSOCKETPP_CPP11_THREAD_)

# uncomment if compiling without ssl (not recommended)
# target_compile_definitions(ofxRabbitControl PUBLIC RCP_PD_NO_SSL_)


if(APPLE)
    # Not tested yet
	# set(libssl "${PATH_LIBS}/lib/osx/libfbxsdk.a" )
	target_link_libraries( ofxRabbitControl ${libssl} ${CMAKE_DL_LIBS})
elseif(UNIX)
    # Not sure if this works
	#set(libssl "${PATH_LIBS}/libs/openssl/lib/osx/crypto.a" )
	#set(libssl "${PATH_LIBS}/libs/openssl/lib/osx/ssl.a" )
	#target_link_libraries( ofxFBX_local ${libssl} ${CMAKE_DL_LIBS} )
	target_link_libraries( ofxRabbitControl ssl crypto ${CMAKE_DL_LIBS} )
endif()

