#
# The MIT License (MIT)
#
# Copyright (c) 2015 Andr� Netzeband
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

message(STATUS "Looking for OpenGL header and library...")

find_package(OpenGL)

if (OPENGL_FOUND)
	MESSAGE(STATUS "OpenGL Correctly Found:")
	MESSAGE(STATUS " * Include-Dir: ${OPENGL_INCLUDE_DIR}")
	MESSAGE(STATUS " * Libraries: ${OPENGL_LIBRARIES}")	
	INCLUDE_DIRECTORIES(${OPENGL_INCLUDE_DIR})
	SET(IRRIMGUI_DEPENDENCY_LIBRARIES
	${IRRIMGUI_DEPENDENCY_LIBRARIES}
	${OPENGL_LIBRARIES}
	)
	
else ()

	if (IRRIMGUI_BUILD_EXAMPLES)
		MESSAGE(WARNING "OpenGL environment missing, when Irrlicht is linked with OpenGL this will lead to linker errors for examples.")
	else ()
		MESSAGE(STATUS "OpenGL environment missing.")
	endif ()
	
endif ()
