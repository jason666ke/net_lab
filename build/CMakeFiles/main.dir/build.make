# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.23

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = E:\net-lab

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:\net-lab\build

# Include any dependencies generated for this target.
include CMakeFiles/main.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/main.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.dir/flags.make

CMakeFiles/main.dir/src/arp.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/arp.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/arp.c.obj: ../src/arp.c
CMakeFiles/main.dir/src/arp.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/main.dir/src/arp.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/arp.c.obj -MF CMakeFiles\main.dir\src\arp.c.obj.d -o CMakeFiles\main.dir\src\arp.c.obj -c E:\net-lab\src\arp.c

CMakeFiles/main.dir/src/arp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/arp.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\arp.c > CMakeFiles\main.dir\src\arp.c.i

CMakeFiles/main.dir/src/arp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/arp.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\arp.c -o CMakeFiles\main.dir\src\arp.c.s

CMakeFiles/main.dir/src/buf.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/buf.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/buf.c.obj: ../src/buf.c
CMakeFiles/main.dir/src/buf.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/main.dir/src/buf.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/buf.c.obj -MF CMakeFiles\main.dir\src\buf.c.obj.d -o CMakeFiles\main.dir\src\buf.c.obj -c E:\net-lab\src\buf.c

CMakeFiles/main.dir/src/buf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/buf.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\buf.c > CMakeFiles\main.dir\src\buf.c.i

CMakeFiles/main.dir/src/buf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/buf.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\buf.c -o CMakeFiles\main.dir\src\buf.c.s

CMakeFiles/main.dir/src/driver.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/driver.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/driver.c.obj: ../src/driver.c
CMakeFiles/main.dir/src/driver.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/main.dir/src/driver.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/driver.c.obj -MF CMakeFiles\main.dir\src\driver.c.obj.d -o CMakeFiles\main.dir\src\driver.c.obj -c E:\net-lab\src\driver.c

CMakeFiles/main.dir/src/driver.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/driver.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\driver.c > CMakeFiles\main.dir\src\driver.c.i

CMakeFiles/main.dir/src/driver.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/driver.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\driver.c -o CMakeFiles\main.dir\src\driver.c.s

CMakeFiles/main.dir/src/ethernet.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/ethernet.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/ethernet.c.obj: ../src/ethernet.c
CMakeFiles/main.dir/src/ethernet.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/main.dir/src/ethernet.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/ethernet.c.obj -MF CMakeFiles\main.dir\src\ethernet.c.obj.d -o CMakeFiles\main.dir\src\ethernet.c.obj -c E:\net-lab\src\ethernet.c

CMakeFiles/main.dir/src/ethernet.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/ethernet.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\ethernet.c > CMakeFiles\main.dir\src\ethernet.c.i

CMakeFiles/main.dir/src/ethernet.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/ethernet.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\ethernet.c -o CMakeFiles\main.dir\src\ethernet.c.s

CMakeFiles/main.dir/src/http.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/http.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/http.c.obj: ../src/http.c
CMakeFiles/main.dir/src/http.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/main.dir/src/http.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/http.c.obj -MF CMakeFiles\main.dir\src\http.c.obj.d -o CMakeFiles\main.dir\src\http.c.obj -c E:\net-lab\src\http.c

CMakeFiles/main.dir/src/http.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/http.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\http.c > CMakeFiles\main.dir\src\http.c.i

CMakeFiles/main.dir/src/http.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/http.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\http.c -o CMakeFiles\main.dir\src\http.c.s

CMakeFiles/main.dir/src/icmp.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/icmp.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/icmp.c.obj: ../src/icmp.c
CMakeFiles/main.dir/src/icmp.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/main.dir/src/icmp.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/icmp.c.obj -MF CMakeFiles\main.dir\src\icmp.c.obj.d -o CMakeFiles\main.dir\src\icmp.c.obj -c E:\net-lab\src\icmp.c

CMakeFiles/main.dir/src/icmp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/icmp.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\icmp.c > CMakeFiles\main.dir\src\icmp.c.i

CMakeFiles/main.dir/src/icmp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/icmp.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\icmp.c -o CMakeFiles\main.dir\src\icmp.c.s

CMakeFiles/main.dir/src/ip.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/ip.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/ip.c.obj: ../src/ip.c
CMakeFiles/main.dir/src/ip.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/main.dir/src/ip.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/ip.c.obj -MF CMakeFiles\main.dir\src\ip.c.obj.d -o CMakeFiles\main.dir\src\ip.c.obj -c E:\net-lab\src\ip.c

CMakeFiles/main.dir/src/ip.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/ip.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\ip.c > CMakeFiles\main.dir\src\ip.c.i

CMakeFiles/main.dir/src/ip.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/ip.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\ip.c -o CMakeFiles\main.dir\src\ip.c.s

CMakeFiles/main.dir/src/main.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/main.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/main.c.obj: ../src/main.c
CMakeFiles/main.dir/src/main.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/main.dir/src/main.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/main.c.obj -MF CMakeFiles\main.dir\src\main.c.obj.d -o CMakeFiles\main.dir\src\main.c.obj -c E:\net-lab\src\main.c

CMakeFiles/main.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/main.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\main.c > CMakeFiles\main.dir\src\main.c.i

CMakeFiles/main.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/main.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\main.c -o CMakeFiles\main.dir\src\main.c.s

CMakeFiles/main.dir/src/map.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/map.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/map.c.obj: ../src/map.c
CMakeFiles/main.dir/src/map.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/main.dir/src/map.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/map.c.obj -MF CMakeFiles\main.dir\src\map.c.obj.d -o CMakeFiles\main.dir\src\map.c.obj -c E:\net-lab\src\map.c

CMakeFiles/main.dir/src/map.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/map.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\map.c > CMakeFiles\main.dir\src\map.c.i

CMakeFiles/main.dir/src/map.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/map.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\map.c -o CMakeFiles\main.dir\src\map.c.s

CMakeFiles/main.dir/src/net.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/net.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/net.c.obj: ../src/net.c
CMakeFiles/main.dir/src/net.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/main.dir/src/net.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/net.c.obj -MF CMakeFiles\main.dir\src\net.c.obj.d -o CMakeFiles\main.dir\src\net.c.obj -c E:\net-lab\src\net.c

CMakeFiles/main.dir/src/net.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/net.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\net.c > CMakeFiles\main.dir\src\net.c.i

CMakeFiles/main.dir/src/net.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/net.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\net.c -o CMakeFiles\main.dir\src\net.c.s

CMakeFiles/main.dir/src/tcp.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/tcp.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/tcp.c.obj: ../src/tcp.c
CMakeFiles/main.dir/src/tcp.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/main.dir/src/tcp.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/tcp.c.obj -MF CMakeFiles\main.dir\src\tcp.c.obj.d -o CMakeFiles\main.dir\src\tcp.c.obj -c E:\net-lab\src\tcp.c

CMakeFiles/main.dir/src/tcp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/tcp.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\tcp.c > CMakeFiles\main.dir\src\tcp.c.i

CMakeFiles/main.dir/src/tcp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/tcp.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\tcp.c -o CMakeFiles\main.dir\src\tcp.c.s

CMakeFiles/main.dir/src/udp.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/udp.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/udp.c.obj: ../src/udp.c
CMakeFiles/main.dir/src/udp.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/main.dir/src/udp.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/udp.c.obj -MF CMakeFiles\main.dir\src\udp.c.obj.d -o CMakeFiles\main.dir\src\udp.c.obj -c E:\net-lab\src\udp.c

CMakeFiles/main.dir/src/udp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/udp.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\udp.c > CMakeFiles\main.dir\src\udp.c.i

CMakeFiles/main.dir/src/udp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/udp.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\udp.c -o CMakeFiles\main.dir\src\udp.c.s

CMakeFiles/main.dir/src/utils.c.obj: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/utils.c.obj: CMakeFiles/main.dir/includes_C.rsp
CMakeFiles/main.dir/src/utils.c.obj: ../src/utils.c
CMakeFiles/main.dir/src/utils.c.obj: CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/main.dir/src/utils.c.obj"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.dir/src/utils.c.obj -MF CMakeFiles\main.dir\src\utils.c.obj.d -o CMakeFiles\main.dir\src\utils.c.obj -c E:\net-lab\src\utils.c

CMakeFiles/main.dir/src/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/src/utils.c.i"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\net-lab\src\utils.c > CMakeFiles\main.dir\src\utils.c.i

CMakeFiles/main.dir/src/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/src/utils.c.s"
	C:\TDM-GCC-64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\net-lab\src\utils.c -o CMakeFiles\main.dir\src\utils.c.s

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/src/arp.c.obj" \
"CMakeFiles/main.dir/src/buf.c.obj" \
"CMakeFiles/main.dir/src/driver.c.obj" \
"CMakeFiles/main.dir/src/ethernet.c.obj" \
"CMakeFiles/main.dir/src/http.c.obj" \
"CMakeFiles/main.dir/src/icmp.c.obj" \
"CMakeFiles/main.dir/src/ip.c.obj" \
"CMakeFiles/main.dir/src/main.c.obj" \
"CMakeFiles/main.dir/src/map.c.obj" \
"CMakeFiles/main.dir/src/net.c.obj" \
"CMakeFiles/main.dir/src/tcp.c.obj" \
"CMakeFiles/main.dir/src/udp.c.obj" \
"CMakeFiles/main.dir/src/utils.c.obj"

# External object files for target main
main_EXTERNAL_OBJECTS =

main.exe: CMakeFiles/main.dir/src/arp.c.obj
main.exe: CMakeFiles/main.dir/src/buf.c.obj
main.exe: CMakeFiles/main.dir/src/driver.c.obj
main.exe: CMakeFiles/main.dir/src/ethernet.c.obj
main.exe: CMakeFiles/main.dir/src/http.c.obj
main.exe: CMakeFiles/main.dir/src/icmp.c.obj
main.exe: CMakeFiles/main.dir/src/ip.c.obj
main.exe: CMakeFiles/main.dir/src/main.c.obj
main.exe: CMakeFiles/main.dir/src/map.c.obj
main.exe: CMakeFiles/main.dir/src/net.c.obj
main.exe: CMakeFiles/main.dir/src/tcp.c.obj
main.exe: CMakeFiles/main.dir/src/udp.c.obj
main.exe: CMakeFiles/main.dir/src/utils.c.obj
main.exe: CMakeFiles/main.dir/build.make
main.exe: CMakeFiles/main.dir/linklibs.rsp
main.exe: CMakeFiles/main.dir/objects1.rsp
main.exe: CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=E:\net-lab\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Linking C executable main.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\main.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.dir/build: main.exe
.PHONY : CMakeFiles/main.dir/build

CMakeFiles/main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\main.dir\cmake_clean.cmake
.PHONY : CMakeFiles/main.dir/clean

CMakeFiles/main.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" E:\net-lab E:\net-lab E:\net-lab\build E:\net-lab\build E:\net-lab\build\CMakeFiles\main.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main.dir/depend

