nasm -f win64 ConsoleMessage64.asm -o ConsoleMessage64.obj
golink /entry:Start /console kernel32.dll user32.dll ConsoleMessage64.obj