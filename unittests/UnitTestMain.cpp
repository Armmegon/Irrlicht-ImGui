/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2015-2016 Andr� Netzeband
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

/**
 * @file UnitTestMain.cpp
 * @brief Contains the main function for the unit tests.
 */

// library includes
#include <CppUTest/CommandLineTestRunner.h>
#include <CppUTest/TestRegistry.h>
#include <CppUTestExt/MockSupportPlugin.h>
#include <CppUTestExt/MockSupport.h>

// module includes
#include <IrrIMGUI/UnitTest/BasicMemoryLeakDetectionPlugin.h>

//#define COLORED_OUTPUT

int main(int Arguments, char const ** ppCommandLineList)
{
  MockSupportPlugin MockPlugin;
  TestRegistry::getCurrentRegistry()->installPlugin(&MockPlugin);

  IrrIMGUI::UnitTest::BasicMemoryLeakDetectionPlugin MemoryPlugin;
  TestRegistry::getCurrentRegistry()->installPlugin(&MemoryPlugin);

  char const ** ppArgumentList;
  int     NumberOfArguments;
  bool    IsOwnArgumentMemory;

#ifdef COLORED_OUTPUT
  // enable colored output by default
  ppArgumentList = new char*[Arguments+2];

  for (int i = 0; i < Arguments; i++)
  {
    ppArgumentList[i] = ppCommandLineList[i];
  }
  ppArgumentList[Arguments+0] = "-v";
  ppArgumentList[Arguments+1] = "-c";
  NumberOfArguments = Arguments+2;
  IsOwnArgumentMemory = true;

#else  // COLORED_OUTPUT
  ppArgumentList = ppCommandLineList;
  NumberOfArguments = Arguments;
  IsOwnArgumentMemory = false;

#endif // COLORED_OUTPUT

  mock().clear();
  int ReturnValue = CommandLineTestRunner::RunAllTests(NumberOfArguments, ppArgumentList);

  if (IsOwnArgumentMemory)
  {
    delete[] ppArgumentList;
  }

  return ReturnValue;
}
