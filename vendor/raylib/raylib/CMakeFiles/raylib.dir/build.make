# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/hostedtoolcache/cmake/3.30.2/x64/cmake-3.30.2-linux-x86_64/bin/cmake

# The command to remove a file.
RM = /opt/hostedtoolcache/cmake/3.30.2/x64/cmake-3.30.2-linux-x86_64/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/runner/work/boids/boids

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/runner/work/boids/boids/build

# Include any dependencies generated for this target.
include vendor/raylib/raylib/CMakeFiles/raylib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include vendor/raylib/raylib/CMakeFiles/raylib.dir/compiler_depend.make

# Include the progress variables for this target.
include vendor/raylib/raylib/CMakeFiles/raylib.dir/progress.make

# Include the compile flags for this target's objects.
include vendor/raylib/raylib/CMakeFiles/raylib.dir/flags.make

vendor/raylib/raylib/CMakeFiles/raylib.dir/rcore.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/flags.make
vendor/raylib/raylib/CMakeFiles/raylib.dir/rcore.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/includes_C.rsp
vendor/raylib/raylib/CMakeFiles/raylib.dir/rcore.c.o: /home/runner/work/boids/boids/vendor/raylib/src/rcore.c
vendor/raylib/raylib/CMakeFiles/raylib.dir/rcore.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/boids/boids/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object vendor/raylib/raylib/CMakeFiles/raylib.dir/rcore.c.o"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/raylib/raylib/CMakeFiles/raylib.dir/rcore.c.o -MF CMakeFiles/raylib.dir/rcore.c.o.d -o CMakeFiles/raylib.dir/rcore.c.o -c /home/runner/work/boids/boids/vendor/raylib/src/rcore.c

vendor/raylib/raylib/CMakeFiles/raylib.dir/rcore.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/raylib.dir/rcore.c.i"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/boids/boids/vendor/raylib/src/rcore.c > CMakeFiles/raylib.dir/rcore.c.i

vendor/raylib/raylib/CMakeFiles/raylib.dir/rcore.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/raylib.dir/rcore.c.s"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/boids/boids/vendor/raylib/src/rcore.c -o CMakeFiles/raylib.dir/rcore.c.s

vendor/raylib/raylib/CMakeFiles/raylib.dir/rmodels.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/flags.make
vendor/raylib/raylib/CMakeFiles/raylib.dir/rmodels.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/includes_C.rsp
vendor/raylib/raylib/CMakeFiles/raylib.dir/rmodels.c.o: /home/runner/work/boids/boids/vendor/raylib/src/rmodels.c
vendor/raylib/raylib/CMakeFiles/raylib.dir/rmodels.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/boids/boids/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object vendor/raylib/raylib/CMakeFiles/raylib.dir/rmodels.c.o"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/raylib/raylib/CMakeFiles/raylib.dir/rmodels.c.o -MF CMakeFiles/raylib.dir/rmodels.c.o.d -o CMakeFiles/raylib.dir/rmodels.c.o -c /home/runner/work/boids/boids/vendor/raylib/src/rmodels.c

vendor/raylib/raylib/CMakeFiles/raylib.dir/rmodels.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/raylib.dir/rmodels.c.i"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/boids/boids/vendor/raylib/src/rmodels.c > CMakeFiles/raylib.dir/rmodels.c.i

vendor/raylib/raylib/CMakeFiles/raylib.dir/rmodels.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/raylib.dir/rmodels.c.s"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/boids/boids/vendor/raylib/src/rmodels.c -o CMakeFiles/raylib.dir/rmodels.c.s

vendor/raylib/raylib/CMakeFiles/raylib.dir/rshapes.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/flags.make
vendor/raylib/raylib/CMakeFiles/raylib.dir/rshapes.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/includes_C.rsp
vendor/raylib/raylib/CMakeFiles/raylib.dir/rshapes.c.o: /home/runner/work/boids/boids/vendor/raylib/src/rshapes.c
vendor/raylib/raylib/CMakeFiles/raylib.dir/rshapes.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/boids/boids/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object vendor/raylib/raylib/CMakeFiles/raylib.dir/rshapes.c.o"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/raylib/raylib/CMakeFiles/raylib.dir/rshapes.c.o -MF CMakeFiles/raylib.dir/rshapes.c.o.d -o CMakeFiles/raylib.dir/rshapes.c.o -c /home/runner/work/boids/boids/vendor/raylib/src/rshapes.c

vendor/raylib/raylib/CMakeFiles/raylib.dir/rshapes.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/raylib.dir/rshapes.c.i"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/boids/boids/vendor/raylib/src/rshapes.c > CMakeFiles/raylib.dir/rshapes.c.i

vendor/raylib/raylib/CMakeFiles/raylib.dir/rshapes.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/raylib.dir/rshapes.c.s"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/boids/boids/vendor/raylib/src/rshapes.c -o CMakeFiles/raylib.dir/rshapes.c.s

vendor/raylib/raylib/CMakeFiles/raylib.dir/rtext.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/flags.make
vendor/raylib/raylib/CMakeFiles/raylib.dir/rtext.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/includes_C.rsp
vendor/raylib/raylib/CMakeFiles/raylib.dir/rtext.c.o: /home/runner/work/boids/boids/vendor/raylib/src/rtext.c
vendor/raylib/raylib/CMakeFiles/raylib.dir/rtext.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/boids/boids/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object vendor/raylib/raylib/CMakeFiles/raylib.dir/rtext.c.o"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/raylib/raylib/CMakeFiles/raylib.dir/rtext.c.o -MF CMakeFiles/raylib.dir/rtext.c.o.d -o CMakeFiles/raylib.dir/rtext.c.o -c /home/runner/work/boids/boids/vendor/raylib/src/rtext.c

vendor/raylib/raylib/CMakeFiles/raylib.dir/rtext.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/raylib.dir/rtext.c.i"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/boids/boids/vendor/raylib/src/rtext.c > CMakeFiles/raylib.dir/rtext.c.i

vendor/raylib/raylib/CMakeFiles/raylib.dir/rtext.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/raylib.dir/rtext.c.s"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/boids/boids/vendor/raylib/src/rtext.c -o CMakeFiles/raylib.dir/rtext.c.s

vendor/raylib/raylib/CMakeFiles/raylib.dir/rtextures.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/flags.make
vendor/raylib/raylib/CMakeFiles/raylib.dir/rtextures.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/includes_C.rsp
vendor/raylib/raylib/CMakeFiles/raylib.dir/rtextures.c.o: /home/runner/work/boids/boids/vendor/raylib/src/rtextures.c
vendor/raylib/raylib/CMakeFiles/raylib.dir/rtextures.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/boids/boids/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object vendor/raylib/raylib/CMakeFiles/raylib.dir/rtextures.c.o"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/raylib/raylib/CMakeFiles/raylib.dir/rtextures.c.o -MF CMakeFiles/raylib.dir/rtextures.c.o.d -o CMakeFiles/raylib.dir/rtextures.c.o -c /home/runner/work/boids/boids/vendor/raylib/src/rtextures.c

vendor/raylib/raylib/CMakeFiles/raylib.dir/rtextures.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/raylib.dir/rtextures.c.i"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/boids/boids/vendor/raylib/src/rtextures.c > CMakeFiles/raylib.dir/rtextures.c.i

vendor/raylib/raylib/CMakeFiles/raylib.dir/rtextures.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/raylib.dir/rtextures.c.s"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/boids/boids/vendor/raylib/src/rtextures.c -o CMakeFiles/raylib.dir/rtextures.c.s

vendor/raylib/raylib/CMakeFiles/raylib.dir/utils.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/flags.make
vendor/raylib/raylib/CMakeFiles/raylib.dir/utils.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/includes_C.rsp
vendor/raylib/raylib/CMakeFiles/raylib.dir/utils.c.o: /home/runner/work/boids/boids/vendor/raylib/src/utils.c
vendor/raylib/raylib/CMakeFiles/raylib.dir/utils.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/boids/boids/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object vendor/raylib/raylib/CMakeFiles/raylib.dir/utils.c.o"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/raylib/raylib/CMakeFiles/raylib.dir/utils.c.o -MF CMakeFiles/raylib.dir/utils.c.o.d -o CMakeFiles/raylib.dir/utils.c.o -c /home/runner/work/boids/boids/vendor/raylib/src/utils.c

vendor/raylib/raylib/CMakeFiles/raylib.dir/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/raylib.dir/utils.c.i"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/boids/boids/vendor/raylib/src/utils.c > CMakeFiles/raylib.dir/utils.c.i

vendor/raylib/raylib/CMakeFiles/raylib.dir/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/raylib.dir/utils.c.s"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/boids/boids/vendor/raylib/src/utils.c -o CMakeFiles/raylib.dir/utils.c.s

vendor/raylib/raylib/CMakeFiles/raylib.dir/raudio.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/flags.make
vendor/raylib/raylib/CMakeFiles/raylib.dir/raudio.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/includes_C.rsp
vendor/raylib/raylib/CMakeFiles/raylib.dir/raudio.c.o: /home/runner/work/boids/boids/vendor/raylib/src/raudio.c
vendor/raylib/raylib/CMakeFiles/raylib.dir/raudio.c.o: vendor/raylib/raylib/CMakeFiles/raylib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/boids/boids/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object vendor/raylib/raylib/CMakeFiles/raylib.dir/raudio.c.o"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT vendor/raylib/raylib/CMakeFiles/raylib.dir/raudio.c.o -MF CMakeFiles/raylib.dir/raudio.c.o.d -o CMakeFiles/raylib.dir/raudio.c.o -c /home/runner/work/boids/boids/vendor/raylib/src/raudio.c

vendor/raylib/raylib/CMakeFiles/raylib.dir/raudio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/raylib.dir/raudio.c.i"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/boids/boids/vendor/raylib/src/raudio.c > CMakeFiles/raylib.dir/raudio.c.i

vendor/raylib/raylib/CMakeFiles/raylib.dir/raudio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/raylib.dir/raudio.c.s"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && /home/runner/work/_temp/828f51ee-a938-4aa0-8853-0b223c577ff4/emsdk-main/upstream/emscripten/emcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/boids/boids/vendor/raylib/src/raudio.c -o CMakeFiles/raylib.dir/raudio.c.s

# Object files for target raylib
raylib_OBJECTS = \
"CMakeFiles/raylib.dir/rcore.c.o" \
"CMakeFiles/raylib.dir/rmodels.c.o" \
"CMakeFiles/raylib.dir/rshapes.c.o" \
"CMakeFiles/raylib.dir/rtext.c.o" \
"CMakeFiles/raylib.dir/rtextures.c.o" \
"CMakeFiles/raylib.dir/utils.c.o" \
"CMakeFiles/raylib.dir/raudio.c.o"

# External object files for target raylib
raylib_EXTERNAL_OBJECTS =

vendor/raylib/raylib/libraylib.a: vendor/raylib/raylib/CMakeFiles/raylib.dir/rcore.c.o
vendor/raylib/raylib/libraylib.a: vendor/raylib/raylib/CMakeFiles/raylib.dir/rmodels.c.o
vendor/raylib/raylib/libraylib.a: vendor/raylib/raylib/CMakeFiles/raylib.dir/rshapes.c.o
vendor/raylib/raylib/libraylib.a: vendor/raylib/raylib/CMakeFiles/raylib.dir/rtext.c.o
vendor/raylib/raylib/libraylib.a: vendor/raylib/raylib/CMakeFiles/raylib.dir/rtextures.c.o
vendor/raylib/raylib/libraylib.a: vendor/raylib/raylib/CMakeFiles/raylib.dir/utils.c.o
vendor/raylib/raylib/libraylib.a: vendor/raylib/raylib/CMakeFiles/raylib.dir/raudio.c.o
vendor/raylib/raylib/libraylib.a: vendor/raylib/raylib/CMakeFiles/raylib.dir/build.make
vendor/raylib/raylib/libraylib.a: vendor/raylib/raylib/CMakeFiles/raylib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/runner/work/boids/boids/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C static library libraylib.a"
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && $(CMAKE_COMMAND) -P CMakeFiles/raylib.dir/cmake_clean_target.cmake
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/raylib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vendor/raylib/raylib/CMakeFiles/raylib.dir/build: vendor/raylib/raylib/libraylib.a
.PHONY : vendor/raylib/raylib/CMakeFiles/raylib.dir/build

vendor/raylib/raylib/CMakeFiles/raylib.dir/clean:
	cd /home/runner/work/boids/boids/build/vendor/raylib/raylib && $(CMAKE_COMMAND) -P CMakeFiles/raylib.dir/cmake_clean.cmake
.PHONY : vendor/raylib/raylib/CMakeFiles/raylib.dir/clean

vendor/raylib/raylib/CMakeFiles/raylib.dir/depend:
	cd /home/runner/work/boids/boids/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/boids/boids /home/runner/work/boids/boids/vendor/raylib/src /home/runner/work/boids/boids/build /home/runner/work/boids/boids/build/vendor/raylib/raylib /home/runner/work/boids/boids/build/vendor/raylib/raylib/CMakeFiles/raylib.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : vendor/raylib/raylib/CMakeFiles/raylib.dir/depend

