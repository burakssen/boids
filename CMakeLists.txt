cmake_minimum_required(VERSION 3.27)

# Set project name
project(boids)

set(CMAKE_CXX_STANDARD 23)

set(SOURCE_DIR src)
set(VENDOR_DIR vendor)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Check if we're building for WebAssembly (Emscripten)
if(EMSCRIPTEN)
    add_compile_definitions(PLATFORM_WEB)
    set(BUILD_PLATFORM "PLATFORM=Web")
endif()

# Add subdirectory for Raylib, passing in the platform we're building for
add_subdirectory("${VENDOR_DIR}/raylib")

# Gather source files
file(GLOB_RECURSE SOURCE_FILES 
    "${SOURCE_DIR}/**.cpp" 
    "${SOURCE_DIR}/**.h"
)

# Include directories
set(INCLUDE_DIRECTORIES
    "${SOURCE_DIR}"
    "${VENDOR_DIR}/raylib/src"
)

# Add executable
add_executable(boids "${SOURCE_FILES}")

# Link include directories and Raylib
target_include_directories(boids PUBLIC ${INCLUDE_DIRECTORIES})
target_link_libraries(boids PUBLIC raylib)

# Set specific linker flags for WebAssembly
if(EMSCRIPTEN)
    set_target_properties(boids PROPERTIES 
        LINK_FLAGS "-s USE_GLFW=3 -s TOTAL_MEMORY=16777216 --shell-file ${CMAKE_SOURCE_DIR}/index.html"
    )

    # copy index.html to build directory
    file(COPY index.html DESTINATION ${CMAKE_BINARY_DIR})
endif()
