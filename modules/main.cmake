# ============================================================================
# ---------------------------------- CMAKE -----------------------------------
cmake_policy(SET CMP0057 NEW)

# ============================================================================
# ---------------------------------- PATHS -----------------------------------
# ============================================================================
# --- Set an absolute path name, in case the project used a relative one
get_filename_component(OF_DIRECTORY_ABSOLUTE ${OF_DIRECTORY_BY_USER} ABSOLUTE)

set(OF_CMAKE_MODULES ${OFX_CMAKE_PATH}/modules)
set(OF_CMAKE_ADDONS ${OFX_CMAKE_PATH}/addOns)
set(OF_CMAKE_LIBS ${OFX_CMAKE_PATH}/libs)


# ============================================================================
# --------------------------------- ADDONS -----------------------------------zz
# --- Include all addOn .cmake files.
# --- Libs are only linked, if set in the project CMakeLists.txt
# ============================================================================
#include(${OF_CMAKE_MODULES}/addOns.cmake)


# ============================================================================
# -------------------------------- OF SOURCE FILES ---------------------------
# ============================================================================
include(${OF_CMAKE_MODULES}/openFrameworks.cmake)

if (APPLE) # Apple is a Unix, too. So dont ask only first UNIX
    include(${OF_CMAKE_MODULES}/openFrameworksApple.cmake)
elseif (UNIX)
    include(${OF_CMAKE_MODULES}/openFrameworksLinux.cmake)
elseif (WIN32)
    include(${OF_CMAKE_MODULES}/openFrameworksWindows.cmake)
else ()
    message(FATAL_ERROR "Operating System not supported")
endif ()


if (NOT COMPILE_OF)
    include_directories( ${OF_CORE_HEADERS} ${OF_ADDON_HEADERS} )
endif ()


# ============================================================================
# -------------------------------- OF CONFIGURATION --------------------------
# ============================================================================
if (COMPILE_OF)
    include(${OF_CMAKE_MODULES}/config.cmake)
else()

    add_library( of_static STATIC IMPORTED GLOBAL)

    set( LIB_BASE_NAME ${OFX_CMAKE_PATH}/libs/libopenFrameworksStatic)
    string(CONCAT LIB_DEBUG    ${LIB_BASE_NAME} ${CMAKE_DEBUG_POSTFIX} ${CMAKE_STATIC_LIBRARY_SUFFIX})
    string(CONCAT LIB_RELEASE  ${LIB_BASE_NAME} ${CMAKE_STATIC_LIBRARY_SUFFIX})
    set_target_properties(of_static PROPERTIES IMPORTED_LOCATION_DEBUG ${LIB_DEBUG} )
    set_target_properties(of_static PROPERTIES IMPORTED_LOCATION_RELEASE ${LIB_RELEASE})

#    install( TARGETS of_static
#            LIBRARY DESTINATION ${OF_CMAKE_LIBS}
#            ARCHIVE DESTINATION ${OF_CMAKE_LIBS})
endif ()

if (APPLE)
    include(${OF_CMAKE_MODULES}/configApple.cmake)
elseif (UNIX)
    include(${OF_CMAKE_MODULES}/configLinux.cmake)
elseif (WIN32)
    include(${OF_CMAKE_MODULES}/configWindows.cmake)
else ()
    message(FATAL_ERROR "Operating System not supported")
endif ()



# ============================================================================
# ------------------------------- APP CONFIGURATION --------------------------
# ============================================================================

add_dependencies( ${APP_NAME} of_static )

set(OUTPUT_APP_NAME ${APP_NAME})

if (CMAKE_BUILD_TYPE MATCHES Debug)
    set(OUTPUT_APP_NAME "${APP_NAME}_debug")
endif ()

set_target_properties(${APP_NAME}
                      PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin
                      OUTPUT_NAME ${OUTPUT_APP_NAME}
                      )

set_target_properties( ${APP_NAME} PROPERTIES COMPILE_FLAGS "-std=c++17" )
