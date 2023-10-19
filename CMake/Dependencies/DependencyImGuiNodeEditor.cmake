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

SET (ImguiNodeEditor_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/dependency/IMGUI_NODE_EDITOR" CACHE PATH "The source directory of ImGui Node Editor.")

INCLUDE_DIRECTORIES(
    ${ImguiNodeEditor_SOURCE_DIR}/..
)

SET (ImguiNodeEditor_HEADER_FILES
	${ImguiNodeEditor_SOURCE_DIR}/crude_json.h
	${ImguiNodeEditor_SOURCE_DIR}/imgui_bezier_math.h
	${ImguiNodeEditor_SOURCE_DIR}/imgui_bezier_math.inl
	${ImguiNodeEditor_SOURCE_DIR}/imgui_canvas.h
	${ImguiNodeEditor_SOURCE_DIR}/imgui_extra_math.h
	${ImguiNodeEditor_SOURCE_DIR}/imgui_extra_math.inl
	${ImguiNodeEditor_SOURCE_DIR}/imgui_node_editor.h
	${ImguiNodeEditor_SOURCE_DIR}/imgui_node_editor_internal.h
	${ImguiNodeEditor_SOURCE_DIR}/imgui_node_editor_internal.inl
)

SET (ImguiNodeEditor_SOURCE_FILES
	${ImguiNodeEditor_SOURCE_DIR}/crude_json.cpp
	${ImguiNodeEditor_SOURCE_DIR}/imgui_canvas.cpp
	${ImguiNodeEditor_SOURCE_DIR}/imgui_node_editor.cpp
	${ImguiNodeEditor_SOURCE_DIR}/imgui_node_editor_api.cpp
)

SET (ImguiNodeEditor_FOUND TRUE)
IF (NOT EXISTS "${ImguiNodeEditor_SOURCE_DIR}/imgui_node_editor.h")
	message(SEND_ERROR "Cannot find file ${ImguiNodeEditor_SOURCE_DIR}/imgui_node_editor.h please specify a correct source directory for ImGui Node Editor!")
	SET (ImguiNodeEditor_FOUND FALSE)
ENDIF ()

IF (NOT EXISTS "${ImguiNodeEditor_SOURCE_DIR}/../IMGUI_NODE_EDITOR")
	message(SEND_ERROR "Cannot find directory ImGui Node Editor at location '${ImguiNodeEditor_SOURCE_DIR}/..' . Thus the compiler will not able to include the ImGui Node Editor header files. Please install the ImGui Node Editor sources and headers in a subdirectory called IMGUI_NODE_EDITOR!")
	SET (ImguiNodeEditor_FOUND FALSE)
ENDIF ()
