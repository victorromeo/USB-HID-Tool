cmake_minimum_required(VERSION 3.0)

# Define the location of the libusb libraries
set( LIBUSB_INCLUDE_DIR ~/build/libusb-1.0-arm/libusb )
include_directories( ${LIBUSB_INCLUDE_DIR})
link_directories( ${LIBUSB_INCLUDE_DIR}/.libs)

# Have CMake find our pthreads library within our toolchain (required for this library)
set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
find_package(Threads REQUIRED)

# add all the *.c files as sources
FILE(GLOB SRC_FILES ../main.c hid.c)

# make this output
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/..)
add_executable (usbhidtool ../main.c hid.c)

# be sure to include the current source directory for header files
# target_include_directories (ubbhidtool PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/..)

# add the following required libraries:
# Threads, USB-1.0, and RealTime
target_link_libraries(usbhidtool ${CMAKE_THREAD_LIBS_INIT} rt usb-1.0)
