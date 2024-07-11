set( NAME_ADDON     ofxAlembic )

# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SRC    ${ADDON_DIR}/${NAME_ADDON}/src )
set( PATH_LIBS      ${ADDON_DIR}/${NAME_ADDON}/libs )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB_RECURSE   OFX_ADDON_CPP          "${PATH_SRC}/*.cpp" "${PATH_SRC}/*.cpp" )
file( GLOB_RECURSE   OFX_ADDON_LIBS_CPP     "${PATH_LIBS}/*.cpp" )
add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} ${OFX_ADDON_LIBS_CPP} )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
OF_find_header_directories( HEADERS_LIBS ${PATH_LIBS} )

include_directories( ${HEADERS_SOURCE} )
include_directories( ${HEADERS_LIBS} )
include_directories( ${PATH_LIBS}/include )
include_directories( ${PATH_LIBS}/alembic/include )
include_directories( ${PATH_LIBS}/hdf5/include )
include_directories( ${PATH_LIBS}/OpenEXR/include )



if(APPLE)
	set(libalembic "${PATH_LIBS}/alembic/lib/osx/libAlembic.a" 
					"${PATH_LIBS}/hdf5/lib/osx/libhdf5.a"
					"${PATH_LIBS}/hdf5/lib/osx/libhdf5_cpp.a"
					"${PATH_LIBS}/hdf5/lib/osx/libhdf5_hl.a"
					"${PATH_LIBS}/hdf5/lib/osx/libhdf5_hl_cpp.a"
					"${PATH_LIBS}/hdf5/lib/osx/libhdf5_tools.a"
					"${PATH_LIBS}/hdf5/lib/osx/libszip.a" 
					)
	target_link_libraries( ${NAME_ADDON} ${libalembic} ${CMAKE_DL_LIBS} Imath-3_0 IlmThread Iex Half z OpenEXR )
elseif(UNIX)
	set(libalembic "${PATH_LIBS}/alembic/lib/linux64/libAlembic.a" 
					"${PATH_LIBS}/hdf5/lib/linux64/libhdf5.a"
					"${PATH_LIBS}/hdf5/lib/linux64/libhdf5_cpp.a"
					"${PATH_LIBS}/hdf5/lib/linux64/libhdf5_hl.a"
					"${PATH_LIBS}/hdf5/lib/linux64/libhdf5_hl_cpp.a"
					"${PATH_LIBS}/hdf5/lib/linux64/libhdf5_tools.a"
					"${PATH_LIBS}/hdf5/lib/linux64/libszip.a" 
					)
	target_link_libraries( ${NAME_ADDON} ${libalembic} ${CMAKE_DL_LIBS} Imath-3_0 IlmThread Iex Half z OpenEXR )
endif() 
