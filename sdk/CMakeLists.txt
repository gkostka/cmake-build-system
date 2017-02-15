

include_directories(.)

add_definitions(-DCONFIG_INCLUDE_SDK)

aux_source_directory(. SDK_SRC)
aux_source_directory(extras SDK_SRC)
aux_source_directory(extras/crypto SDK_SRC)
aux_source_directory(extras/fatfs SDK_SRC)
aux_source_directory(ext_drivers SDK_SRC)
aux_source_directory(drivers SDK_SRC)


add_library(sdk ${SDK_SRC})

