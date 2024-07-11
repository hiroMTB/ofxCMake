
# ============================================================================
# ------------------------------ Compiler Flags ------------------------------
set_source_files_properties( ${OF_SOURCE_FILES} PROPERTIES COMPILE_FLAGS " -Wall -Werror=return-type -std=c++17 -DGCC_HAS_REGEX -fuse-ld=gold -fPIC -c -O3 -DNDEBUG -D__LINUX_ALSA__ -D__LINUX_PULSE__ -D__UNIX_JACK__ -D_REENTRANT " )

# ============================================================================
# ------------------------------ Compile and Link ----------------------------
add_executable( ${APP_NAME} ${${APP_NAME}_SOURCE_FILES} )

set_target_properties( of_shared PROPERTIES POSITION_INDEPENDENT_CODE TRUE )
target_link_libraries( ${APP_NAME}
                        $<TARGET_FILE:of_shared>
                        ${opengl_lib}
                        ${OF_CORE_FRAMEWORKS}
                        ${OFX_ADDONS_ACTIVE}
                        ${OFX_LOCAL_ADDONS_ACTIVE}
                    )
target_link_libraries(${APP_NAME} ${OF_CORE_LIBS})
target_link_libraries(${APP_NAME} ${OF_CORE_STATIC_LIBS})
