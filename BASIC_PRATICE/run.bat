nasm -f win64 _Tmain.asm -o Pratice_Tmain.obj
golink /console /entry:Start kernel32.dll user32.dll Gdi32.dll Pratice_Tmain.obj