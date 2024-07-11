# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_SVG_CPP
        "${ADDON_DIR}/ofxSvg/*.cpp"
        "${ADDON_DIR}/ofxSvg/libs/svgtiny/src/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${ADDON_DIR}/ofxSvg/src"
        "${ADDON_DIR}/ofxSvg/libs/svgtiny/include"
        "${ADDON_DIR}/ofxSvg/libs/libxlm2/include"
        )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxSvg
                STATIC
                ${OFX_SVG_CPP} )
                
# -----------------------------------------------------------------
# --- Setting a compiled lib
# -----------------------------------------------------------------

if( APPLE )

 	set(    EXTRA_LIBS_SVG
	        ${ADDON_DIR}/ofxSvg/libs/svgtiny/lib/osx/svgtiny.a
	        ${ADDON_DIR}/ofxSvg/libs/libxml2/lib/osx/xml2.a
		)
 	target_link_libraries(  ofxSvg ${EXTRA_LIBS_SVG} )

elseif( UNIX )

	set(    EXTRA_LIBS_SVG
	        ${ADDON_DIR}/ofxSvg/libs/svgtiny/lib/linux64/libsvgtiny.a
	        ${ADDON_DIR}/ofxSvg/libs/libxml2/lib/linux64/libxml2.a
	        )
	target_link_libraries(  ofxSvg ${EXTRA_LIBS_SVG} )	

endif()
