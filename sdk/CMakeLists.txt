

include_directories(.)

add_definitions(-DCONFIG_INCLUDE_SDK)
aux_source_directory(. SDK_SRC)

add_library(sdk ${SDK_SRC})

