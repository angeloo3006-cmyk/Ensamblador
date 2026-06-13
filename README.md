El proyecto incluye un script de automatizacion (build.bat) que realiza
todo el proceso de ensamble, compilacion y enlazado de forma automatica.

Para compilar desde cero:
  1. Abra una ventana de la consola de comandos (cmd) en la carpeta del proyecto.
  2. Ejecute el comando:
     
     build.bat

El script realizara internamente los siguientes pasos:
  - Ensamblara 'engine.asm' con NASM generando 'engine.o' (formato win64).
  - Compilara 'main.c' junto con 'engine.o' usando GCC para generar 'BitQuest.exe'.

* Nota: Si prefiere realizar la compilacion manualmente paso a paso, 
  puede ejecutar los siguientes comandos en la terminal:
  
  nasm -f win64 engine.asm -o engine.o
  gcc main.c engine.o -o BitQuest.exe

Una vez compilado con exito (o utilizando el binario precompilado):

  1. Ejecute el juego directamente desde la consola escribiendo:
     
     BitQuest.exe