

set(MCU_MODEL "sam4e16e")
add_definitions(-D__SAM4E16E__)
add_definitions(-DCFG_CLK_FREQ=120000000)

add_subdirectory(sdk/bsp/sam4)
