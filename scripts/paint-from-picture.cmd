@echo off
rem Picture from Picture launcher for Windows.
rem It expects a Logisim JAR containing com.cburch.logisim.gui.paint.PaintTool.
rem Set LOGISIM_JAR or place logisim.jar beside this script.

setlocal
set "HERE=%~dp0"
set "MAIN=com.cburch.logisim.gui.paint.PaintTool"

set "JAR=%LOGISIM_JAR%"
if not defined JAR if exist "%HERE%logisim.jar" set "JAR=%HERE%logisim.jar"
if not defined JAR (
  echo paint-from-picture: set LOGISIM_JAR or put logisim.jar beside this script 1>&2
  exit /b 1
)

set "JAVA=java"
if defined JAVA_HOME if exist "%JAVA_HOME%\bin\java.exe" set "JAVA=%JAVA_HOME%\bin\java.exe"
"%JAVA%" -version >nul 2>&1
if errorlevel 1 (
  echo paint-from-picture: Java 8 or newer is required (set JAVA_HOME) 1>&2
  exit /b 1
)

"%JAVA%" -Dapple.awt.application.name="Paint from Picture" -cp "%JAR%" %MAIN% %*
exit /b %errorlevel%
