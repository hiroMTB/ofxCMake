cmake_minimum_required(VERSION 3.5)
cmake_policy(SET CMP0152 NEW)

# THIS HAS TO COME BEFORE THE PROJECT LINE
# from https://stackoverflow.com/questions/24380456/how-can-i-make-cmake-use-gcc-instead-of-clang-on-mac-os-x
set(CMAKE_C_COMPILER "gcc")
set(CMAKE_CXX_COMPILER "g++")


project(exampleApp VERSION 0.0.1 LANGUAGES C CXX)
set(APP_NAME exampleApp)

# When it is Debug build, this adds "_debug" at the end of the name of all library files and executable
# e.g. libofxOpenCv_debug.a
set(CMAKE_DEBUG_POSTFIX "_debug")

# because of: https://github.com/openframeworks/openFrameworks/issues/6587
#add_compile_definitions(OF_USING_STD_FS=0)
#link_libraries(stdc++fs)
set(CMAKE_CXX_FLAGS "-std=c++17")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_OSX_ARCHITECTURES "x86_64")

# Local ofxCMake? (we have to use file() command to set absolute path)
#set( ADDON_REL "../local_addons")
#file( REAL_PATH ${ADDON_REL}/ofxCMake OFX_CMAKE_PATH)

# Global ofxCMake?
set(ADDON_REL "../../addons")
set(${ADDON_REL}/ofxCMake OFX_CMAKE_PATH)
file(REAL_PATH ${ADDON_REL}/ofxCMake OFX_CMAKE_PATH)

include(${OFX_CMAKE_PATH}/modules/addOnsMacros.cmake)


file(GLOB_RECURSE
        APP_SRC
        "src/*.cpp"
)

set(${APP_NAME}_SOURCE_FILES ${APP_SRC})


# ------------------------ AddOns  -----------------------
set(OFX_ADDONS_ACTIVE   ofxOpenCv
                        ofxCv
                        ofxImGui
                        )


#
# Global Addons
#
# Must be a RELATIVE path to OF!!! 
# Edit "../../../" to match your oF top directory
set(OF_DIRECTORY_BY_USER "../../")
file(REAL_PATH ${OF_DIRECTORY_BY_USER}/addons ADDON_DIR)


#
# How to use ${COMPILE_ADDON} flag
#
# 1. Build project with set(COMPILE_ADDON TRUE), for both of Debug and Release build
# 2. Use set(COMPILE_ADDON FALSE) to skip compiling addons.
#    This will skip compile and link compiled lib files (e.g. libofxOpenCv.a)
#    Also, source files won't be visible in Clion's project tree
# 3. If you change addon code, or want to edit addon code frequently, do not forget set(COMPILE_ADDON TRUE) again.
#
# Currently ${COMPILE_ADDON} flag only supports ofxOpenCv, ofxCv, and ofxImGui
# To use same compile skip feature for your addon,
# please refer to ofxOpenCv.cmake and modify your .cmake
set(COMPILE_ADDON TRUE)
include(${OFX_CMAKE_PATH}/addOns/internal/ofxOpenCv.cmake)
include(${OFX_CMAKE_PATH}/addOns/external/ofxCv.cmake)

#
# Local Addons
#
file(REAL_PATH ${ADDON_REL} ADDON_DIR)
include(${OFX_CMAKE_PATH}/addOns/external/ofxCereal.cmake)

set(COMPILE_ADDON TRUE)
include(${OFX_CMAKE_PATH}/addOns/external/ofxImGui.cmake)


#
# ${COMPILE_OF} flag
#
# Same compile skip mechanism is applied to oF itself, but with ${COMPILE_OF} flag
set(COMPILE_OF TRUE)
include(${OFX_CMAKE_PATH}/modules/main.cmake)

# If you need TBB, link it after app compile
#target_link_libraries(${APP_NAME} freetype TBB::tbb)
