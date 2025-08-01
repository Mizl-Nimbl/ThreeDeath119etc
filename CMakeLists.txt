cmake_minimum_required(VERSION 3.26)
project(death
  VERSION 1.0
  LANGUAGES C CXX)
  
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fexceptions")
set(vk-bootstrap_DIR "/home/mizl/Documents/Guhg/ThreeDeath119etc/include/vk-bootstrap/lib64/cmake/vk-bootstrap")

include_directories(
  ${GLM_INCLUDE_DIRS}
  ${SDL3_INCLUDE_DIRS}
  ${IMGUI_INCLUDE_DIRS}
  ${TINYOBJLOADER_INCLUDE_DIRS}
  ${VULKAN_INCLUDE_DIRS}
  ${CMAKE_SOURCE_DIR}
  ${VulkanMemoryAllocator_INCLUDE_DIRS}
  ${fmt_INCLUDE_DIRS}
  /include/vk-bootstrap/lib64)

find_package(glm REQUIRED) 
find_package(SDL3 REQUIRED)
find_package(imgui REQUIRED)
find_package(tinyobjloader REQUIRED)
find_package(VulkanMemoryAllocator REQUIRED)
find_package(Vulkan REQUIRED)
find_package(fmt REQUIRED)
find_package(vk-bootstrap REQUIRED)

add_executable(death src/main.cpp src/vk_engine.cpp src/vk_initializers.cpp src/vk_descriptors.cpp src/vk_pipelines.cpp)

target_link_libraries(death glm::glm)
target_link_libraries(death SDL3::SDL3)
target_link_libraries(death imgui)
target_link_libraries(death tinyobjloader)
target_link_libraries(death GPUOpen::VulkanMemoryAllocator)
target_link_libraries(death Vulkan::Vulkan)
target_link_libraries(death fmt::fmt)
target_link_libraries(death vk-bootstrap::vk-bootstrap)

find_program(GLSL_VALIDATOR glslangValidator)
#  HINTS /usr/bin /usr/local/bin $ENV{VULKAN_SDK}/Bin/ $ENV{VULKAN_SDK}/Bin32/

file(GLOB_RECURSE GLSL_SOURCE_FILES
    "/home/mizl/Documents/Guhg/ThreeDeath119etc/res/shaders/*.frag"
    "/home/mizl/Documents/Guhg/ThreeDeath119etc/res/shaders/*.vert"
    "/home/mizl/Documents/Guhg/ThreeDeath119etc/res/shaders/*.comp"
    )

foreach(GLSL ${GLSL_SOURCE_FILES})
  message(STATUS "BUILDING SHADER")
  get_filename_component(FILE_NAME ${GLSL} NAME)
  set(SPIRV "/home/mizl/Documents/Guhg/ThreeDeath119etc/res/shaders/${FILE_NAME}.spv")
  message(STATUS ${GLSL})
  message(STATUS COMMAND " " ${GLSL_VALIDATOR} " " -V " " ${GLSL} " " -o " " ${SPIRV})
  add_custom_command(
    OUTPUT ${SPIRV}
    COMMAND ${GLSL_VALIDATOR} " " -V " " ${GLSL} " " -o " " ${SPIRV}
    DEPENDS ${GLSL})
  list(APPEND SPIRV_BINARY_FILES ${SPIRV})
endforeach(GLSL)

add_custom_target(
    Shaders 
    DEPENDS ${SPIRV_BINARY_FILES}
    )

# option(TESTING "Enable tests." ON)
# if(TESTING)
#   enable_testing()
#   add_subdirectory(test)
# endif()
install(TARGETS death DESTINATION bin)