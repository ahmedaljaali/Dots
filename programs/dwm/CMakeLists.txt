cmake_minimum_required(VERSION 3.20)
project(dwm VERSION 1.0)

file(GLOB_RECURSE SOURCE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)
add_executable(${PROJECT_NAME} ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME dwm OUTPUT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/bin)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc)
target_link_libraries(${PROJECT_NAME} PUBLIC -L/usr/X11R6/lib -lX11 -lXinerama -lfontconfig -lXft)

set_target_properties( ${PROJECT_NAME}
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin"
)



#Debug
target_compile_options(${PROJECT_NAME} PUBLIC  -std=c99 -O0 --pedantic-errors -I/usr/X11R6/include -I/usr/include/freetype2 -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_C_SOURCE=200809L -DVERSION="6.3" -DXINERAMA)

#Release
# target_compile_options(${PROJECT_NAME} PUBLIC  -std=c99 -O3 -I/usr/X11R6/include -I/usr/include/freetype2 -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_C_SOURCE=200809L -DVERSION="6.3" -DXINERAMA)
#-Werror add this option if you want to treat warnings as errors
