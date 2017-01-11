cmake_minimum_required(VERSION 3.6)
	include (${CMAKE_CURRENT_SOURCE_DIR}/../build/common.cmake)
	
	log("CMAKE_BINARY_DIR:         ${CMAKE_BINARY_DIR}" )
	log("CMAKE_CURRENT_BINARY_DIR:         ${CMAKE_CURRENT_BINARY_DIR}" )
	log("CMAKE_CURRENT_SOURCE_DIR:         ${CMAKE_CURRENT_SOURCE_DIR}" )
	log("CMAKE_CURRENT_LIST_DIR:         ${CMAKE_CURRENT_LIST_DIR}" )
	log("EXECUTABLE_OUTPUT_PATH:         ${EXECUTABLE_OUTPUT_PATH}" )
	log("LIBRARY_OUTPUT_PATH:         ${LIBRARY_OUTPUT_PATH}" )
	
	set(dependencies_folder "${CMAKE_SOURCE_DIR}/../dependencies/")
	
	add_dependency_subdirectory("WhoAmI" "${dependencies_folder}" "${dependencies_folder}/include")
	add_dependency_subdirectory("DependencyWhoAmI" "${dependencies_folder}" "${dependencies_folder}/include")
	add_dependency_subdirectory("SFML" "${dependencies_folder}" "${dependencies_folder}/SFML/include")
	
	set(dependencies 
		"WhoAmI"
		"DependencyWhoAmI"
		"sfml-system"
		"sfml-network"
		"sfml-graphics"
		"sfml-audio"
	)
	
	#include_directories("${dependencies_folder}/DependencyWhoAmI/include")
	#add_subdirectory("${dependencies_folder}/DependencyWhoAmI")
	
	generate_game(name "Game" dependencies "${dependencies}")

	#target_link_libraries( "Game" DependencyWhoAmI)