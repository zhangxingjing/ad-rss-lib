##
# ----------------- BEGIN LICENSE BLOCK ---------------------------------
#
# Copyright (C) 2018-2020 Intel Corporation
#
# SPDX-License-Identifier: LGPL-2.1-only
#
# ----------------- END LICENSE BLOCK -----------------------------------
##
##
# Generated file
#
# Generator Version : 11.0.0-1917
##

cmake_minimum_required(VERSION 3.5)
project(ad_rss VERSION 2.0.0)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

set(CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 14)

option(BUILD_SHARED_LIBS "Build shared libraries instead of static ones" ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

include(ad_rss)

if ((NOT ad_rss_SOURCES) OR (NOT ad_rss_INCLUDE_DIRS))
  message(FATAL_ERROR "${PROJECT_NAME}: Variable ad_rss_SOURCES or ad_rss_INCLUDE_DIRS pointing to the generator managed library not set!")
endif()

find_package(ad_physics 1.1.0 REQUIRED CONFIG)
find_package(spdlog REQUIRED CONFIG)

add_library(${PROJECT_NAME}
  ${ad_rss_SOURCES}
  src/ad/rss/situation/CoordinateSystemAxis.cpp
  src/ad/rss/situation/LateralRelativePosition.cpp
  src/ad/rss/situation/LongitudinalRelativePosition.cpp
  src/ad/rss/situation/SituationType.cpp
  src/ad/rss/state/LateralResponse.cpp
  src/ad/rss/state/LongitudinalResponse.cpp
  src/ad/rss/state/RssStateEvaluator.cpp
  src/ad/rss/world/LaneDrivingDirection.cpp
  src/ad/rss/world/LaneSegmentType.cpp
  src/ad/rss/world/ObjectType.cpp
)

if (DEFINED ad_rss_TARGET_COMPILE_DEFINITIONS)
string(APPEND TARGET_COMPILE_DEFINITIONS ${ad_rss_TARGET_COMPILE_DEFINITIONS})
endif()

target_compile_definitions(${PROJECT_NAME} PUBLIC ${TARGET_COMPILE_DEFINITIONS})
target_compile_options(${PROJECT_NAME} PRIVATE ${TARGET_COMPILE_OPTIONS})
set_property(TARGET ${PROJECT_NAME} APPEND_STRING PROPERTY LINK_FLAGS ${TARGET_LINK_FLAGS})

target_include_directories(${PROJECT_NAME} PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
  ${ad_rss_TARGET_INCLUDE_DIRECTORIES}
  "$<BUILD_INTERFACE:${ad_rss_INCLUDE_DIRS}>"
)

target_link_libraries(${PROJECT_NAME} PUBLIC
  ad_physics
  spdlog::spdlog
  ${ad_rss_TARGET_LINK_LIBRARIES}
)

set(BINDING_TYPE MOCKUP)

install(DIRECTORY include/
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp"
)

install(DIRECTORY ${ad_rss_INCLUDE_DIRS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp"
)

install(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME}_EXPORT
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

set(CMAKECONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")

install(EXPORT ${PROJECT_NAME}_EXPORT
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION ${CMAKECONFIG_INSTALL_DIR}
)

configure_package_config_file(${CMAKE_CURRENT_LIST_DIR}/cmake/Config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/install/${PROJECT_NAME}Config.cmake
  INSTALL_DESTINATION ${CMAKECONFIG_INSTALL_DIR}
)

write_basic_package_version_file(${CMAKE_CURRENT_BINARY_DIR}/install/${PROJECT_NAME}ConfigVersion.cmake
  COMPATIBILITY SameMajorVersion
)

install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/install/${PROJECT_NAME}Config.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/install/${PROJECT_NAME}ConfigVersion.cmake
  DESTINATION ${CMAKECONFIG_INSTALL_DIR}
)

#####################################################################
# Tests
#####################################################################
if (BUILD_TESTING AND ad_rss_UNIT_TEST_DIR)
  add_subdirectory(${ad_rss_UNIT_TEST_DIR} ad_rss_unit_tests)
endif()

#####################################################################
# Tools
#####################################################################
if (ad_rss_TOOLS_DIR)
  add_subdirectory(${ad_rss_TOOLS_DIR} ad_rss_tools)
endif()

