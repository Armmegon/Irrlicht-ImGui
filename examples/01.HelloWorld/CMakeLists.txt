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

cmake_minimum_required(VERSION 2.8.12)
cmake_policy(VERSION 2.8.12)

SET(CMAKE_MODULE_PATH 
	${CMAKE_MODULE_PATH} 
	${CMAKE_CURRENT_SOURCE_DIR}/CMake
	${CMAKE_CURRENT_SOURCE_DIR}/../../CMake
)

INCLUDE(ExampleBuild)

SET(EXAMPLE_SOURCE_FILES
	main.cpp
)

SET(EXAMPLE_HEADER_FILES
)

SET(EXAMPLE_INSTALL_FILES	
)

SET(EXAMPLE_INSTALL_DIRS
)

BUILD_EXAMPLE("01.HelloWorld" "${EXAMPLE_SOURCE_FILES}" "${EXAMPLE_HEADER_FILES}" "${EXAMPLE_INSTALL_FILES}" "${EXAMPLE_INSTALL_DIRS}")
