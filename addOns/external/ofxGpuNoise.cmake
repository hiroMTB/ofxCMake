set( NAME_ADDON     ofxGpuNoise )


# PATHS
set( PATH_SRC    ${ADDON_DIR}/${NAME_ADDON}/src )

# SOURCE
file( GLOB_RECURSE   OFX_ADDONS_CPP          "${PATH_SRC}/*.cpp" )
add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDONS_CPP}  )

# HEADERS
include_directories( ${PATH_SRC} )
