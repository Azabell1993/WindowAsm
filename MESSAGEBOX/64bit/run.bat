nasm -f win64 MessageBox64.asm -o MessageBox64.obj
golink /entry:Start kernel32.dll user32.dll MessageBox64.obj