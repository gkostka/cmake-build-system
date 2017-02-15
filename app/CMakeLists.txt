
set (TARGET_NAME project-name)

aux_source_directory(. APP_SRC)
add_executable(${TARGET_NAME} ${APP_SRC})

target_link_libraries(${TARGET_NAME} bsp)
target_link_libraries(${TARGET_NAME} sdk)
target_link_libraries(${TARGET_NAME} m)

set_target_properties(${TARGET_NAME} PROPERTIES LINK_FLAGS "-T${PROJECT_BINARY_DIR}/linker.ld")
add_custom_target(${TARGET_NAME}_size1 ALL DEPENDS ${TARGET_NAME} COMMAND ${SIZE} -A -x ${TARGET_NAME})
add_custom_target(${TARGET_NAME}_size2 ALL DEPENDS ${TARGET_NAME} COMMAND ${SIZE} -B ${TARGET_NAME})
add_custom_target(${TARGET_NAME}_bin ALL DEPENDS ${TARGET_NAME} COMMAND ${OBJCOPY} -O binary ${TARGET_NAME} 
                  ${TARGET_NAME}-r${BOARD_REVISION_MAJOR}-v${SW_VERSION}.bin)

add_custom_target(symbols COMMAND nm ${TARGET_NAME} -S --size-sort -r -f sysv -l)

