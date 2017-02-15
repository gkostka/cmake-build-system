

#targerts
add_definitions(-DUSE_FREERTOS=1)
add_definitions(-DUSE_LWEXT4=0)

include_directories(app)

#include_directories(sdk/libs/lwext4/lwext4)
#include_directories(sdk/libs/lwext4/fs_test/common)
#add_subdirectory(sdk/libs/lwext4/lwext4)

add_subdirectory(app)
add_subdirectory(sdk)
