@echo off
echo ==============================================
echo       COMPILANDO PROYECTO: BITQUEST
echo ==============================================

echo Ensamblando engine.asm con NASM...
nasm -f win64 engine.asm -o engine.o
if %errorlevel% neq 0 (
    echo [ERROR] Hubo un problema al ensamblar con NASM.
    pause
    exit /b %errorlevel%
)

echo Compilando main.c y enlazando binario con GCC...
gcc main.c engine.o -o BitQuest.exe
if %errorlevel% neq 0 (
    echo [ERROR] Hubo un problema al compilar con GCC.
    pause
    exit /b %errorlevel%
)

echo.
echo [OK] Compilacion exitosa. Ejecutable creado: BitQuest.exe
pause