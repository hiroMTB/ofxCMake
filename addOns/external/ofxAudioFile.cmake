set( NAME_ADDON     ofxAudioFile )

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
include_directories( ${PATH_SRC}/../libs )

if(APPLE)
#    set(librtAudio "${OF_DIRECTORY_BY_USER}/libs/rtAudio/lib/osx/rtaudio.a" )
#    target_link_libraries( ${NAME_ADDON} ${librtAudio} ${CMAKE_DL_LIBS})
elseif(UNIX)
endif()

