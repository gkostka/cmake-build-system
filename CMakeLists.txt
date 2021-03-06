# ------------------------
cmake_minimum_required(VERSION 2.8)

# ------------------------
set(CMAKE_USE_RELATIVE_PATHS 1)

# ------------------------
# Build type:
#  - Release
#  - Debug
if (${BUILD_TYPE} EQUAL 0)
set(CMAKE_BUILD_TYPE Release)
elseif (${BUILD_TYPE} EQUAL 1)
set(CMAKE_BUILD_TYPE Debug)
endif()
# ------------------------

# BOARD_TYPE Available:
if(NOT DEFINED BOARD_TYPE)
message(FATAL_ERROR "Undefined BOARD_TYPE")
endif()

# BOARD_TYPE Available:
if(NOT DEFINED BOARD_REVISION)
message(FATAL_ERROR "Undefined BOARD_REVISION")
endif()

add_definitions(-DPROJECT_TYPE="${PROJECT_TYPE}")
add_definitions(-DBOARD_TYPE=0x${BOARD_TYPE})
add_definitions(-DBOARD_REVISION=0x${BOARD_REVISION})
add_definitions(-DSW_VERSION="${SW_VERSION}")
add_definitions(-DSCM_REVISION=0x${SCM_SET_REVISION})
add_definitions(-DCFG_BUILD_CONFIG=${BUILD_TYPE})

## -------------------------------------------------------------
##                      HW TYPE
## -------------------------------------------------------------
if     (${BOARD_TYPE} EQUAL 0000)
    include(board/null/null.cmake)
elseif (${BOARD_TYPE} EQUAL 0001)
    include(board/sam4-xp/${BOARD_REVISION}.cmake)
else()
    message( FATAL_ERROR "Unsupported Board: " ${BOARD_TYPE} )
endif()
 
## -------------------------------------------------------------
##                      Nolib SRC
## -------------------------------------------------------------



## -------------------------------------------------------------
##                      App config
## -------------------------------------------------------------
add_definitions(-DUSE_FREERTOS=1)
add_definitions(-DUSE_LWEXT4=0)

include_directories(app)

add_subdirectory(app)
add_subdirectory(sdk)
