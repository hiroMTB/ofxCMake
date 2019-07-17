
# ============================================================================
# ------------------------------ Compiler Flags ------------------------------
# set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_C_FLAGS "") # -x objective-c

# set(CMAKE_CXX_COMPILER "/usr/bin/clang++")
set(CMAKE_CXX_FLAGS "-std=c++11 -stdlib=libc++ -D__MACOSX_CORE__") # Removed "-stdlib=libstdc++
set_source_files_properties(${OF_SOURCE_FILES} PROPERTIES COMPILE_FLAGS "-x objective-c++")

#set(CMAKE_OSX_ARCHITECTURES i386)
# set(CMAKE_OSX_ARCHITECTURES x86_64)
add_compile_options(-Wno-deprecated-declarations)


# ============================================================================
# ------------------------------ Compile and Link ----------------------------
add_executable(${APP_NAME} MACOSX_BUNDLE ${${APP_NAME}_SOURCE_FILES})

target_link_libraries(${APP_NAME}
                      ${OF_CORE_LIBS}
                      of_static
                      #        ${opengl_lib}
                      ${OF_CORE_FRAMEWORKS}
                      ${USER_LIBS}
                      ${OFX_ADDONS_ACTIVE}
                      )

# ============================================================================

add_custom_command(
        TARGET ${APP_NAME}
        POST_BUILD
        COMMAND rsync
        ARGS -aved ${CMAKE_SOURCE_DIR}/${OF_DIRECTORY_BY_USER}/libs/fmodex/lib/osx/libfmodex.dylib "$<TARGET_FILE_DIR:${APP_NAME}>/../Frameworks/"
)

add_custom_command(
        TARGET ${APP_NAME}
        POST_BUILD
        COMMAND ${CMAKE_INSTALL_NAME_TOOL}
        ARGS -change @executable_path/libfmodex.dylib @executable_path/../Frameworks/libfmodex.dylib $<TARGET_FILE:${APP_NAME}>
)