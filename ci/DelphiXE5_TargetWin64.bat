@echo off
REM ------------------------------------------------------------------------------
REM - This file exists for the sake of the projects continuous integration server.
REM - Do not use unless you know what you are doing.
REM ------------------------------------------------------------------------------

ENV=%1
WORKSPACE=%2
call ENV || exit /b

REM ------------------------------ Build sample projects ------------------------

REM ------------------------------ Build log library (debug) --------------------
msbuild %WORKSPACE%\src\projects\lib_cwLog.dproj                          || exit /b

REM ------------------------------ Build test projects --------------------------

msbuild %WORKSPACE%\src\tests\cwCollections\test_cwCollections_XE5.dproj  || exit /b
msbuild %WORKSPACE%\src\tests\cwIO\test_cwIO_XE5.dproj                    || exit /b
msbuild %WORKSPACE%\src\tests\cwLog\test_dynamic_cwLog_XE5.dproj          || exit /b
msbuild %WORKSPACE%\src\tests\cwLog\test_static_cwLog_XE5.dproj           || exit /b
msbuild %WORKSPACE%\src\tests\cwTest\test_cwTest_XE5.dproj                || exit /b
msbuild %WORKSPACE%\src\tests\cwTypes\test_cwTypes_XE5.dproj              || exit /b
msbuild %WORKSPACE%\src\tests\cwUnicode\test_cwUnicode_XE5.dproj          || exit /b

REM ------------------------------ Execute test projects --------------------------

%WORKSPACE%\out\bin\x86_64-win64\test_cwCollections.exe                   || exit /b
REM - %WORKSPACE%\out\bin\x86_64-win64\test_cwIO.exe                           || exit /b 
%WORKSPACE%\out\bin\x86_64-win64\test_dynamic_cwLog.exe                   || exit /b
%WORKSPACE%\out\bin\x86_64-win64\test_static_cwLog.exe                    || exit /b
%WORKSPACE%\out\bin\x86_64-win64\test_cwTest.exe                          || exit /b
%WORKSPACE%\out\bin\x86_64-win64\test_cwTypes.exe                         || exit /b
%WORKSPACE%\out\bin\x86_64-win64\test_cwUnicode.exe                       || exit /b
%WORKSPACE%\out\bin\x86_64-win64\test_cwVectors.exe                       || exit /b
