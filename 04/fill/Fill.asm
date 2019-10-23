// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@24576
D=A
@MAXSCREEN
M=D

@SCREEN
D=A
@POINTER
M=D

(LOOP)
@KBD
D=M
@FILL
D;JGT
@UNFILL
D;JEQ

(FILL)
@POINTER
D=M
@MAXSCREEN
D=D-M
@LOOP
D;JEQ
@POINTER
A=M
M=-1
D=A+1
@POINTER
M=D
@LOOP
0;JMP

(UNFILL)
@POINTER
D=M
@SCREEN
D=D-A
@LOOP
D;JEQ
@POINTER
A=M
M=0
D=A-1
@POINTER
M=D
@LOOP
0;JMP