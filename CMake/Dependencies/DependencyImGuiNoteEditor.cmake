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

SET (ImguiNoteEditor_SOURCE_DIR "${CMAKE_SOURCE_DIR}/dependency/IMGUI_NOTE_EDITOR" CACHE PATH "The source directory of ImGui Note Editor.")

INCLUDE_DIRECTORIES(
    ${ImguiNoteEditor_SOURCE_DIR}/..
)

SET (ImguiNoteEditor_HEADER_FILES
	${ImguiNoteEditor_SOURCE_DIR}/crude_json.h
	${ImguiNoteEditor_SOURCE_DIR}/imgui_bezier_math.h
	${ImguiNoteEditor_SOURCE_DIR}/imgui_bezier_math.inl
	${ImguiNoteEditor_SOURCE_DIR}/imgui_canvas.h
	${ImguiNoteEditor_SOURCE_DIR}/imgui_extra_math.h
	${ImguiNoteEditor_SOURCE_DIR}/imgui_extra_math.inl
	${ImguiNoteEditor_SOURCE_DIR}/imgui_node_editor.h
	${ImguiNoteEditor_SOURCE_DIR}/imgui_node_editor_internal.h
	${ImguiNoteEditor_SOURCE_DIR}/imgui_node_editor_internal.inl
)

SET (ImguiNoteEditor_SOURCE_FILES
	${ImguiNoteEditor_SOURCE_DIR}/crude_json.cpp
	${ImguiNoteEditor_SOURCE_DIR}/imgui_canvas.cpp
	${ImguiNoteEditor_SOURCE_DIR}/imgui_node_editor.cpp
	${ImguiNoteEditor_SOURCE_DIR}/imgui_node_editor_api.cpp
)

SET (ImguiNoteEditor_FOUND TRUE)
IF (NOT EXISTS "${ImguiNoteEditor_SOURCE_DIR}/imgui_node_editor.h")
	message(SEND_ERROR "Cannot find file ${ImguiNoteEditor_SOURCE_DIR}/imgui_node_editor.h please specify a correct source directory for ImGui Note Editor!")
	SET (ImguiNoteEditor_FOUND FALSE)
ENDIF ()

IF (NOT EXISTS "${ImguiNoteEditor_SOURCE_DIR}/../IMGUI_NOTE_EDITOR")
	message(SEND_ERROR "Cannot find directory ImGui Note Editor at location '${ImguiNoteEditor_SOURCE_DIR}/..' . Thus the compiler will not able to include the ImGui Note Editor header files. Please install the ImGui Note Editor sources and headers in a subdirectory called IMGUI_NOTE_EDITOR!")
	SET (ImguiNoteEditor_FOUND FALSE)
ENDIF ()
