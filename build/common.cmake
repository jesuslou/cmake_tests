cmake_minimum_required(VERSION 3.6)

function(log msg)
	set(verbose TRUE)
	if("${verbose}")
		MESSAGE( STATUS "${msg}")
	endif()
endfunction(log)

function(add_source_groups files)
	if(files)
		#log("files:          ${files}" )
		foreach(file ${files})
			add_file_to_source_group(${file})
		endforeach()
	endif()
endfunction(add_source_groups)

function(add_file_to_source_group file)
	#log("file:          ${file}" )
    get_filename_component (file_path ${file} PATH)
	#log("file_path:          ${file_path}" )
    file (RELATIVE_PATH rel_file_path ${CMAKE_CURRENT_LIST_DIR} ${file_path})
	#log("rel_file_path:          ${rel_file_path}" )
	if(NOT "${rel_file_path}" STREQUAL "")
		string (REPLACE "/" "\\" rel_file_path ${rel_file_path})
	endif()
	source_group ("${rel_file_path}" FILES ${file})
endfunction(add_file_to_source_group)

function (generate_static_library)
	cmake_parse_arguments(lib "" "name" "dependencies" ${ARGN})
	
	file(GLOB_RECURSE HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/*.h")
	file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

	add_source_groups("${HEADERS}")
	add_source_groups("${SOURCES}")

	add_library("${lib_name}" STATIC ${HEADERS} ${SOURCES})
	target_include_directories ("${lib_name}" PUBLIC "./include")
	set_target_properties("${lib_name}" PROPERTIES LINKER_LANGUAGE CXX)
	
	if(lib_dependencies)
		log("Dependencies for target ${lib_name}: ${lib_dependencies}")
		foreach(dependency ${lib_dependencies})
			target_link_libraries("${lib_name}" "${dependency}")
		endforeach()
	endif()
endfunction(generate_static_library)

function (generate_game)
	cmake_parse_arguments(game "" "name" "dependencies" ${ARGN})
	
	project("${game_name}")

	include_directories("${CMAKE_CURRENT_SOURCE_DIR}/include")

	file(GLOB_RECURSE HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/*.h")
	file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

	add_source_groups("${HEADERS}")
	add_source_groups("${SOURCES}")

	add_executable ("${game_name}" "${HEADERS}" "${SOURCES}")
	set_target_properties("${game_name}" PROPERTIES LINKER_LANGUAGE CXX)
	set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT "${game_name}")
	
	if(game_dependencies)
		log("Dependencies for target ${game_name}: ${game_dependencies}")
		foreach(dependency ${game_dependencies})
			target_link_libraries("${game_name}" "${dependency}")
		endforeach()
	endif()
endfunction(generate_game)

function(include_third_party_directories path)
	include_directories("${CMAKE_CURRENT_SOURCE_DIR}/${path}")
endfunction(include_third_party_directories)

function(add_dependency_subdirectory dependency_name dependency_dir dependency_include_dir)
	add_subdirectory("${dependency_dir}/${dependency_name}" "${CMAKE_CURRENT_BINARY_DIR}/${dependency_name}")
	include_directories("${dependency_include_dir}")
endfunction(add_dependency_subdirectory)
