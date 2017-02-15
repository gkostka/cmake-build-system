

if (${MCU_MODEL} STREQUAL "sam4e16e")

include_directories(../cmsis/Include)
include_directories(include)
aux_source_directory(source BSP_SRC)

add_library(bsp ${BSP_SRC})

configure_file (
      "linker/sam4e16/flash.ld"
      "${PROJECT_BINARY_DIR}/linker.ld"
)    
endif()

