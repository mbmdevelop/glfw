 -- ----------------------------------------------------------------------------------------
-- MIT License
-- 
-- Copyright(c) 2021 Mario Borrajo Megoya
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files(the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions :
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
-- ---------------------------------------------------------------------------

project "GLFW"
  location (path.join(DEPS_DIR,"GLFW/vs"))
  kind "StaticLib"
  language "C"
  staticruntime "On"

  targetdir (path.join(ROOT_DIR,"bin",OUTPUT_DIR,"%{prj.name}"))
  objdir (path.join(ROOT_DIR,"bin/intermediates",OUTPUT_DIR,"%{prj.name}")) 

  files
  {
  	"include/GLFW/glfw3.h",
  	"include/GLFW/glfw3native.h",
  	"src/glfw_config.h",
  	"src/context.c",
  	"src/init.c",
  	"src/input.c",
  	"src/monitor.c",
  	"src/null_init.c",
  	"src/null_joystick.c",
  	"src/null_monitor.c",
  	"src/null_window.c",
  	"src/platform.c",
    "src/vulkan.c",
  	"src/window.c"
  }

  filter "system:windows"
		systemversion "10.0.17763.0"
	
  files
  {
  	"src/win32_init.c",
  	"src/win32_joystick.c",
    "src/win32_module.c",
  	"src/win32_monitor.c",
  	"src/win32_time.c",
  	"src/win32_thread.c",
  	"src/win32_window.c",
  	"src/wgl_context.c",
  	"src/egl_context.c",
  	"src/osmesa_context.c"
  }

  defines 
  { 
  	"_GLFW_WIN32",
  	"_CRT_SECURE_NO_WARNINGS"
  }
    
  filter "configurations:Debug"
  	runtime "Debug"
  	symbols "on"
  
  filter "configurations:Release"
  	runtime "Release"
  	optimize "on"