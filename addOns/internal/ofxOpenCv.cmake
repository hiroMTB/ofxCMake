# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

if( NOT ${IMPORT_ADDON} )
    file(   GLOB_RECURSE
            OFX_OPENCV_CPP
            "${ADDON_DIR}/ofxOpenCv/*.*pp"
            )
endif ()

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
    "${ADDON_DIR}/ofxOpenCv/src"
    "${ADDON_DIR}/ofxOpenCv/libs/opencv/include"
    "${ADDON_DIR}/ofxOpenCv/libs/opencv/include/opencv2"
    "${ADDON_DIR}/ofxOpenCv/libs/opencv/include/opencv4"
    )


# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------
if( NOT ${IMPORT_ADDON} )
    add_library( ofxOpenCv STATIC ${OFX_OPENCV_CPP} )
else ()
    add_library( ofxOpenCv STATIC IMPORTED GLOBAL)

    set( LIB_BASE_NAME ${OFX_CMAKE_PATH}/libs/libofxOpenCv)
    string(CONCAT LIB_DEBUG    ${LIB_BASE_NAME} ${CMAKE_DEBUG_POSTFIX} ${CMAKE_STATIC_LIBRARY_SUFFIX})
    string(CONCAT LIB_RELEASE  ${LIB_BASE_NAME} ${CMAKE_STATIC_LIBRARY_SUFFIX})
    set_target_properties(ofxOpenCv PROPERTIES IMPORTED_LOCATION_DEBUG ${LIB_DEBUG} )
    set_target_properties(ofxOpenCv PROPERTIES IMPORTED_LOCATION_RELEASE ${LIB_RELEASE})
endif ()

set_target_properties(ofxOpenCv PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY    ${OFX_CMAKE_PATH}/libs/
        ARCHIVE_OUTPUT_DIRECTORY    ${OFX_CMAKE_PATH}/libs/
)

# -----------------------------------------------------------------
# --- Setting a compiled lib
# -----------------------------------------------------------------
#TODO Libs for other OS (Win & Linux)

if( APPLE )
    find_library( CORE_FOUNDATION_LIB_OPENCV  CoreFoundation)
    # find_library( ZLIB_OPENCV z ) # Not sure if we need this or not, it works both with/without linking this

    set(    ofxOpenCvLib
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libittnotify.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/liblibopenjp2.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/liblibprotobuf.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libopencv_calib3d.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libopencv_core.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libopencv_dnn.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libopencv_features2d.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libopencv_flann.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libopencv_imgproc.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libopencv_ml.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libopencv_objdetect.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libopencv_photo.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libopencv_video.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libquirc.a"
            "${ADDON_DIR}/ofxOpenCv/libs/opencv/lib/osx/libzlib.a"
    )


    set(    EXTRA_LIBS_OPENCV
            ${CORE_FOUNDATION_LIB_OPENCV}
            # ${ZLIB_OPENCV}
            ${ofxOpenCvLib}
            )

    if( NOT ${IMPORT_ADDON} )
        target_link_libraries( ofxOpenCv ${EXTRA_LIBS_OPENCV} )
    else()
        target_link_libraries( ofxOpenCv INTERFACE ${EXTRA_LIBS_OPENCV} )
    endif()

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

    if( NOT ${IMPORT_ADDON} )
        target_link_libraries( ofxOpenCv ${OpenCV_LIBS} )
    else()
        target_link_libraries( ofxOpenCv INTERFACE ${OpenCV_LIBS} )
    endif()

endif()
