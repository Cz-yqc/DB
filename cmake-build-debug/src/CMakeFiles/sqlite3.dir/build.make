# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

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
CMAKE_COMMAND = /snap/clion/169/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/169/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug

# Include any dependencies generated for this target.
include src/CMakeFiles/sqlite3.dir/depend.make
# Include the progress variables for this target.
include src/CMakeFiles/sqlite3.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/sqlite3.dir/flags.make

src/CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.o: src/CMakeFiles/sqlite3.dir/flags.make
src/CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.o: ../src/sqlite/sqlite3.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.o"
	cd /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.o -c /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/src/sqlite/sqlite3.c

src/CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.i"
	cd /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/src/sqlite/sqlite3.c > CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.i

src/CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.s"
	cd /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/src/sqlite/sqlite3.c -o CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.s

# Object files for target sqlite3
sqlite3_OBJECTS = \
"CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.o"

# External object files for target sqlite3
sqlite3_EXTERNAL_OBJECTS =

lib/libsqlite3.so: src/CMakeFiles/sqlite3.dir/sqlite/sqlite3.c.o
lib/libsqlite3.so: src/CMakeFiles/sqlite3.dir/build.make
lib/libsqlite3.so: src/CMakeFiles/sqlite3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../lib/libsqlite3.so"
	cd /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sqlite3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/sqlite3.dir/build: lib/libsqlite3.so
.PHONY : src/CMakeFiles/sqlite3.dir/build

src/CMakeFiles/sqlite3.dir/clean:
	cd /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug/src && $(CMAKE_COMMAND) -P CMakeFiles/sqlite3.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/sqlite3.dir/clean

src/CMakeFiles/sqlite3.dir/depend:
	cd /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/src /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug/src /home/yneversky/ynwork/SCUDB_LAB/LAB2-DONE/cmake-build-debug/src/CMakeFiles/sqlite3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/sqlite3.dir/depend

