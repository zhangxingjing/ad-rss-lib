# ----------------- BEGIN LICENSE BLOCK ---------------------------------
#
# Copyright (C) 2018-2019 Intel Corporation
#
# SPDX-License-Identifier: LGPL-2.1-only
#
# ----------------- END LICENSE BLOCK -----------------------------------

set(ad_rss_SOURCES
  ${CMAKE_CURRENT_LIST_DIR}/src/core/RssCheck.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/core/RssResponseResolving.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/core/RssResponseTransformation.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/core/RssSituationChecking.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/core/RssSituationExtraction.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/situation/Math.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/situation/RssFormulas.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/situation/RssIntersectionChecker.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/situation/RssSituation.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/world/RssSituationCoordinateSystemConversion.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/world/RssSituationIdProvider.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/world/RssObjectPositionExtractor.cpp
  )
set(ad_rss_INCLUDE_DIRS
  ${CMAKE_CURRENT_LIST_DIR}/include/
)

set(ad_rss_UNIT_TEST_DIR
  ${CMAKE_CURRENT_LIST_DIR}/test/
)
