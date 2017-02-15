
project(project-name C ASM)

aux_source_directory(. APP_SRC)
add_executable(${PROJECT_NAME} ${APP_SRC})

target_link_libraries(${PROJECT_NAME} bsp)
target_link_libraries(${PROJECT_NAME} sdk)

set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-T${PROJECT_BINARY_DIR}/../linker.ld")
add_custom_target(${PROJECT_NAME}_size1 ALL DEPENDS ${PROJECT_NAME} COMMAND ${SIZE} -A -x ${PROJECT_NAME})
add_custom_target(${PROJECT_NAME}_size2 ALL DEPENDS ${PROJECT_NAME} COMMAND ${SIZE} -B ${PROJECT_NAME})
add_custom_target(${PROJECT_NAME}_bin ALL DEPENDS ${PROJECT_NAME} COMMAND ${OBJCOPY} -O binary ${PROJECT_NAME} 
                  ${PROJECT_NAME}-r${BOARD_REVISION_MAJOR}-v${SW_VERSION}.bin)
add_custom_target(symbols COMMAND nm ${PROJECT_NAME} -S --size-sort -r -f sysv -l)

