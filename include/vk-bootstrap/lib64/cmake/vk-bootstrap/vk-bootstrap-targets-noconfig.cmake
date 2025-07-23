#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "vk-bootstrap::vk-bootstrap" for configuration ""
set_property(TARGET vk-bootstrap::vk-bootstrap APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(vk-bootstrap::vk-bootstrap PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib64/libvk-bootstrap.a"
  )

list(APPEND _cmake_import_check_targets vk-bootstrap::vk-bootstrap )
list(APPEND _cmake_import_check_files_for_vk-bootstrap::vk-bootstrap "${_IMPORT_PREFIX}/lib64/libvk-bootstrap.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
