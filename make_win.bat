@echo off

IF NOT EXIST "projects/game-win32" (
	mkdir "projects/game-win32"
)

cd projects/game-win32
cmake ../../game -DCMAKE_CONFIGURATION_TYPES="Debug;Release" -DBUILD_SHARED_LIBS=FALSE
cd ../..
pause