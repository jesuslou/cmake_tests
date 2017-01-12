cmake_minimum_required(VERSION 3.6)
#include (${CMAKE_CURRENT_SOURCE_DIR}/../../build/common.cmake)
set(dependencies 
		"WhoAmI"
		"sfml-graphics"
		"entityx"
	)
generate_static_library(name "DependencyWhoAmI" dependencies "${dependencies}")
