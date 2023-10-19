#
# The MIT License (MIT)
#
# Copyright (c) 2023 Nazım Can Araz
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

SET (ImGuizmo_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/dependency/IMGUIZMO" CACHE PATH "The source directory of ImGuizmo.")

INCLUDE_DIRECTORIES(
    ${ImGuizmo_SOURCE_DIR}/..
)

SET (ImGuizmo_HEADER_FILES
	${ImGuizmo_SOURCE_DIR}/GraphEditor.h
	${ImGuizmo_SOURCE_DIR}/ImCurveEdit.h
	${ImGuizmo_SOURCE_DIR}/ImGradient.h
	${ImGuizmo_SOURCE_DIR}/ImGuizmo.h
	${ImGuizmo_SOURCE_DIR}/ImSequencer.h
	${ImGuizmo_SOURCE_DIR}/ImZoomSlider.h
)

SET (ImGuizmo_SOURCE_FILES
	${ImGuizmo_SOURCE_DIR}/GraphEditor.cpp
	${ImGuizmo_SOURCE_DIR}/ImCurveEdit.cpp
	${ImGuizmo_SOURCE_DIR}/ImGradient.cpp
	${ImGuizmo_SOURCE_DIR}/ImGuizmo.cpp
	${ImGuizmo_SOURCE_DIR}/ImSequencer.cpp
)

SET (ImGuizmo_FOUND TRUE)
IF (NOT EXISTS "${ImGuizmo_SOURCE_DIR}/ImGuizmo.h")
	message(SEND_ERROR "Cannot find file ${ImGuizmo_SOURCE_DIR}/ImGuizmo.h please specify a correct source directory for ImGuizmo!")
	SET (ImGuizmo_FOUND FALSE)
ENDIF ()

IF (NOT EXISTS "${ImGuizmo_SOURCE_DIR}/../IMGUIZMO")
	message(SEND_ERROR "Cannot find directory ImGuizmo at location '${ImGuizmo_SOURCE_DIR}/..' . Thus the compiler will not able to include the ImGuizmo header files. Please install the ImGuizmo sources and headers in a subdirectory called IMGUIZMO!")
	SET (ImGuizmo_FOUND FALSE)
ENDIF ()
