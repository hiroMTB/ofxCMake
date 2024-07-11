
set( NAME_ADDON     ofxCv )       # <--- Set the name here

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
    set( LIB_BASE_NAME ${OFX_CMAKE_PATH}/libs/libofxCv)
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
include_directories( ${HEADERS_SOURCE} )

OF_find_header_directories( HEADERS_LIBS ${PATH_LIBS} )
#include_directories( ${HEADERS_LIBS} )
#include_directories( ${HEADERS_LIBS}/CLD )
include_directories( ${PATH_LIBS}/ofxCv/include )
include_directories( ${PATH_LIBS}/CLD/include/CLD )

# -----------------------------------------------------------------
# ------------------------------ LIBS  ----------------------------
# -----------------------------------------------------------------

if( APPLE )
    find_library( CORE_FOUNDATION_LIB_OPENCV  CoreFoundation)
    find_library( ZLIB_OPENCV z )

    set(    ofxOpenCvLib "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/opencv.a" )
    set(    EXTRA_LIBS_OPENCV
            ${CORE_FOUNDATION_LIB_OPENCV}
            ${ZLIB_OPENCV}
            ${ofxOpenCvLib}
            )
elseif( UNIX )
        
#    set(ofxOpenCvLib "${PATH_LIBS}/alembic/lib/linux64/libAlembic.a" 
#                    "${PATH_LIBS}/hdf5/lib/linux64/libhdf5.a"
#                    "${PATH_LIBS}/hdf5/lib/linux64/libhdf5_cpp.a"
#                    "${PATH_LIBS}/hdf5/lib/linux64/libhdf5_hl.a"
#                    "${PATH_LIBS}/hdf5/lib/linux64/libhdf5_hl_cpp.a"
#                    "${PATH_LIBS}/hdf5/lib/linux64/libhdf5_tools.a"
#                    "${PATH_LIBS}/hdf5/lib/linux64/libszip.a" 
#                    )
    find_package( OpenCV REQUIRED )
    include_directories( ${OpenCV_INCLUDE_DIRS} )
#    target_link_libraries( ${NAME_ADDON} INTERFACE ${OpenCV_LIBS} )
#    target_link_libraries( ${NAME_ADDON} opencv harfbuzz )
    # If the package has been found, several variables will
    # be set, you can find the full list with descriptions
    # in the OpenCVConfig.cmake file.
    # Print some message showing some of them
    message(STATUS "OpenCV library status:")
    message(STATUS "    config: ${OpenCV_DIR}")
    message(STATUS "    version: ${OpenCV_VERSION}")
    message(STATUS "    libraries: ${OpenCV_LIBS}")
    message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")

    target_link_libraries(${NAME_ADDON} ${OpenCV_LIBS} )

endif()
# -----------------------------------------------------------------
# --- In case OS specific libs are needed
# --- Be sure to link them in target_link_libraries()
# -----------------------------------------------------------------
