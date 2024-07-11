set( NAME_ADDON     ofxMultiSpeakerSoundPlayer )

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
include_directories( "${OF_DIRECTORY_BY_USER}/libs/fmodex/include" )

if(APPLE)
elseif(UNIX)
	set(libfmod "${OF_DIRECTORY_BY_USER}/libs/fmodex/lib/linux64/libfmodex.so" )
    target_link_libraries( ${NAME_ADDON} ${libfmod} ${CMAKE_DL_LIBS})
#    set(libfmod "/home/nono/Desktop/of_v0.11.0/libs/fmodex/lib/linux64/libfmodex.so" )
#    message("LIB FMODEX: ${libfmod}")
#	target_link_libraries( ${NAME_ADDON} ${CMAKE_DL_LIBS} fmod fmodl)
endif()

