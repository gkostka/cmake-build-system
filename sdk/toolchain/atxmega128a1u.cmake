# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR avrxmega6)

set(MCPU_FLAGS "-mmcu=atxmega128a1u")
include(${CMAKE_CURRENT_LIST_DIR}/common/avr-gcc.cmake)