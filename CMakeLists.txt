cmake_minimum_required(VERSION 3.27)

project(boids)

set(CMAKE_CXX_STANDARD 23)
set(SOURCE_DIR src)
set(VENDOR_DIR vendor)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(EMSCRIPTEN)
    add_compile_definitions(PLATFORM_WEB)
    set(BUILD_PLATFORM "PLATFORM=Web")
endif()

add_subdirectory("${VENDOR_DIR}/raylib")

file(GLOB_RECURSE SOURCE_FILES 
    "${SOURCE_DIR}/**.cpp" 
    "${SOURCE_DIR}/**.h"
)

set(INCLUDE_DIRECTORIES
    "${SOURCE_DIR}"
    "${VENDOR_DIR}/raylib/src"
)

add_executable(boids "${SOURCE_FILES}")

target_include_directories(boids PUBLIC ${INCLUDE_DIRECTORIES})
target_link_libraries(boids PUBLIC raylib)

if(EMSCRIPTEN)
    set_target_properties(boids PROPERTIES 
        LINK_FLAGS "-s USE_GLFW=3 -s INITIAL_MEMORY=16777216 -s ASYNCIFY=1 -s ASYNCIFY_IMPORTS=['emscripten_sleep'] --shell-file ${CMAKE_SOURCE_DIR}/index.html"
    )
    file(COPY ${CMAKE_SOURCE_DIR}/index.html DESTINATION ${CMAKE_BINARY_DIR})
endif()
