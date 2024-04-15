; ------------------------------------------------------------------------------
; ### flpbrd.asm (old version)
; Código original da minha versão do Flappy Bird escrita inteiramente em
; Assembly 8086.
; By: anachan01h
;
; Copyright (C) 2014 Ana C. Hernandes
;
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <https://www.gnu.org/licenses/>.
; ------------------------------------------------------------------------------

DATA SEGMENT

;Graphics Data ------------------------------------------------------
;27X22
bkg2    DB 037h,037h,037h,037h,037h,037h,037h,037h,037h,037h,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,037h,037h,037h,037h,037h,037h,037h,037h,037h,037h,037h
        DB 037h,037h,037h,037h,037h,037h,037h,037h,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,037h,037h,037h,037h,037h,037h,037h,037h,037h
        DB 00Fh,037h,037h,037h,037h,037h,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,037h,037h,037h,037h,00Fh,00Fh,00Fh
        DB 00Fh,00Fh,00Fh,037h,037h,00Fh,00Fh,00Fh,00Fh,00Fh,095h,095h,095h,095h,095h,095h,00Fh,00Fh,04Eh,04Eh,04Eh,037h,00Fh,00Fh,00Fh,00Fh,00Fh
        DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,01Bh,01Bh,095h,01Eh,01Eh,01Eh,04Eh,04Eh,04Eh,04Eh,01Eh,01Eh,04Eh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
        DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,01Bh,01Bh,01Ch,01Ch,094h,01Eh,095h,01Eh,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh,04Eh,04Eh,04Eh,04Eh,04Eh,04Eh
        DB 00Fh,00Fh,00Fh,00Fh,00Fh,01Bh,04Eh,04Eh,04Eh,04Eh,04Eh,04Eh,04Eh,04Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh
        DB 01Bh,01Bh,01Bh,00Fh,01Bh,01Ch,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh
        DB 01Bh,01Bh,01Bh,00Fh,01Bh,01Ch,04Eh,01Eh,095h,01Eh,095h,01Eh,095h,01Eh,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh
        DB 01Bh,01Bh,01Bh,00Fh,01Bh,01Ch,04Eh,01Eh,095h,01Eh,095h,01Eh,095h,01Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh
        DB 01Bh,01Bh,01Bh,00Fh,01Bh,01Ch,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh
        DB 01Bh,01Bh,01Bh,00Fh,01Bh,01Ch,04Eh,01Eh,095h,01Eh,095h,01Eh,095h,01Eh,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh
        DB 01Bh,01Bh,01Bh,00Fh,01Bh,01Ch,04Eh,01Eh,095h,01Eh,095h,01Eh,095h,01Eh,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh
        DB 01Bh,01Bh,01Bh,00Fh,01Bh,01Ch,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh
        DB 01Bh,01Bh,01Bh,00Fh,01Bh,01Ch,04Eh,01Eh,04Eh,01Eh,04Eh,01Eh,04Eh,01Eh,04Eh,01Eh,04Eh,01Eh,04Eh,01Eh,04Eh,01Eh,095h,01Eh,095h,01Eh,04Eh
        DB 01Bh,01Bh,01Bh,00Fh,0C2h,0C2h,0C2h,0C2h,0C2h,01Eh,04Eh,01Eh,04Eh,01Eh,04Eh,0C2h,0C2h,0C2h,0C2h,01Eh,04Eh,01Eh,01Eh,01Eh,01Eh,01Eh,04Eh
        DB 01Bh,0C2h,0C2h,0C2h,079h,079h,079h,079h,079h,0C2h,0C2h,01Eh,01Eh,0C2h,0C2h,079h,079h,079h,079h,0C2h,0C2h,01Eh,04Eh,01Eh,04Eh,01Eh,04Eh
        DB 0C2h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,0C2h,0C2h,079h,079h,079h,079h,079h,079h,079h,079h,0C2h,0C2h,01Eh,04Eh,01Eh,04Eh
        DB 0C2h,079h,079h,079h,0C2h,0C2h,0C2h,0C2h,079h,079h,0C2h,079h,079h,079h,079h,079h,079h,079h,079h,079h,0C2h,0C2h,0C2h,0C2h,0C2h,01Eh,04Eh
        DB 079h,079h,0C2h,0C2h,079h,079h,079h,079h,0C2h,0C2h,079h,079h,079h,079h,079h,079h,079h,079h,079h,0C2h,0C2h,079h,079h,079h,079h,0C2h,0C2h
        DB 0C2h,0C2h,079h,079h,079h,079h,079h,079h,079h,079h,0C2h,0C2h,079h,079h,079h,079h,079h,0C2h,0C2h,079h,079h,079h,079h,079h,079h,079h,079h
        DB 079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h,079h

;17X12
spr1    DB 000h,000h,000h,000h,000h,000h,011h,011h,011h,011h,011h,011h,000h,000h,000h,000h,000h
        DB 000h,000h,000h,000h,011h,011h,00Fh,00Fh,00Fh,011h,00Fh,00Fh,011h,000h,000h,000h,000h
        DB 000h,000h,000h,011h,00Fh,00Fh,02Ch,02Ch,011h,00Fh,00Fh,00Fh,00Fh,011h,000h,000h,000h
        DB 000h,011h,011h,011h,011h,02Ch,02Ch,02Ch,011h,00Fh,00Fh,00Fh,011h,00Fh,011h,000h,000h
        DB 011h,00Fh,00Fh,00Fh,00Fh,011h,02Ch,02Ch,011h,00Fh,00Fh,00Fh,011h,00Fh,011h,000h,000h
        DB 011h,00Fh,00Fh,00Fh,00Fh,00Fh,011h,02Ch,02Ch,011h,00Fh,00Fh,00Fh,00Fh,011h,000h,000h
        DB 011h,02Ch,00Fh,00Fh,00Fh,02Ch,011h,02Ch,02Ch,02Ch,011h,011h,011h,011h,011h,011h,000h
        DB 000h,011h,02Ch,02Ch,02Ch,011h,02Ch,02Ch,02Ch,011h,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,011h
        DB 000h,000h,011h,011h,011h,006h,006h,006h,011h,02Ah,011h,011h,011h,011h,011h,011h,000h
        DB 000h,000h,011h,006h,006h,006h,006h,006h,006h,011h,02Ah,02Ah,02Ah,02Ah,02Ah,011h,000h
        DB 000h,000h,000h,011h,011h,006h,006h,006h,006h,006h,011h,011h,011h,011h,011h,000h,000h
        DB 000h,000h,000h,000h,000h,011h,011h,011h,011h,011h,000h,000h,000h,000h,000h,000h,000h
spr2    DB 000h,000h,000h,000h,000h,000h,011h,011h,011h,011h,011h,011h,000h,000h,000h,000h,000h
        DB 000h,000h,000h,000h,011h,011h,00Fh,00Fh,00Fh,011h,00Fh,00Fh,011h,000h,000h,000h,000h
        DB 000h,000h,000h,011h,00Fh,00Fh,02Ch,02Ch,011h,00Fh,00Fh,00Fh,00Fh,011h,000h,000h,000h
        DB 000h,000h,011h,00Fh,02Ch,02Ch,02Ch,02Ch,011h,00Fh,00Fh,00Fh,011h,00Fh,011h,000h,000h
        DB 000h,011h,02Ch,02Ch,02Ch,02Ch,02Ch,02Ch,011h,00Fh,00Fh,00Fh,011h,00Fh,011h,000h,000h
        DB 000h,011h,011h,011h,011h,011h,02Ch,02Ch,02Ch,011h,00Fh,00Fh,00Fh,00Fh,011h,000h,000h
        DB 011h,00Fh,00Fh,00Fh,00Fh,00Fh,011h,02Ch,02Ch,02Ch,011h,011h,011h,011h,011h,011h,000h
        DB 011h,02Ch,00Fh,00Fh,00Fh,02Ch,011h,02Ch,02Ch,011h,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,011h
        DB 000h,011h,011h,011h,011h,011h,006h,006h,011h,02Ah,011h,011h,011h,011h,011h,011h,000h
        DB 000h,000h,011h,006h,006h,006h,006h,006h,006h,011h,02Ah,02Ah,02Ah,02Ah,02Ah,011h,000h
        DB 000h,000h,000h,011h,011h,006h,006h,006h,006h,006h,011h,011h,011h,011h,011h,000h,000h
        DB 000h,000h,000h,000h,000h,011h,011h,011h,011h,011h,000h,000h,000h,000h,000h,000h,000h
spr3    DB 000h,000h,000h,000h,000h,000h,011h,011h,011h,011h,011h,011h,000h,000h,000h,000h,000h
        DB 000h,000h,000h,000h,011h,011h,00Fh,00Fh,00Fh,011h,00Fh,00Fh,011h,000h,000h,000h,000h
        DB 000h,000h,000h,011h,00Fh,00Fh,02Ch,02Ch,011h,00Fh,00Fh,00Fh,00Fh,011h,000h,000h,000h
        DB 000h,000h,011h,00Fh,02Ch,02Ch,02Ch,02Ch,011h,00Fh,00Fh,00Fh,011h,00Fh,011h,000h,000h
        DB 000h,011h,02Ch,02Ch,02Ch,02Ch,02Ch,02Ch,011h,00Fh,00Fh,00Fh,011h,00Fh,011h,000h,000h
        DB 000h,011h,02Ch,02Ch,02Ch,02Ch,02Ch,02Ch,02Ch,011h,00Fh,00Fh,00Fh,00Fh,011h,000h,000h
        DB 000h,011h,011h,011h,011h,011h,02Ch,02Ch,02Ch,02Ch,011h,011h,011h,011h,011h,011h,000h
        DB 011h,02Ch,00Fh,00Fh,00Fh,02Ch,011h,02Ch,02Ch,011h,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,011h
        DB 011h,00Fh,00Fh,00Fh,00Fh,011h,006h,006h,011h,02Ah,011h,011h,011h,011h,011h,011h,000h
        DB 011h,00Fh,00Fh,02Ch,011h,006h,006h,006h,006h,011h,02Ah,02Ah,02Ah,02Ah,02Ah,011h,000h
        DB 000h,011h,011h,011h,011h,006h,006h,006h,006h,006h,011h,011h,011h,011h,011h,000h,000h
        DB 000h,000h,000h,000h,000h,011h,011h,011h,011h,011h,000h,000h,000h,000h,000h,000h,000h
spr4    DB 000h,000h,000h,000h,000h,000h,011h,011h,011h,011h,011h,011h,000h,000h,000h,000h,000h
        DB 000h,000h,000h,000h,011h,011h,00Fh,00Fh,00Fh,011h,00Fh,00Fh,011h,000h,000h,000h,000h
        DB 000h,000h,000h,011h,00Fh,00Fh,02Ch,02Ch,011h,00Fh,00Fh,00Fh,00Fh,011h,000h,000h,000h
        DB 000h,000h,011h,00Fh,02Ch,02Ch,02Ch,02Ch,011h,00Fh,00Fh,00Fh,011h,00Fh,011h,000h,000h
        DB 000h,011h,02Ch,02Ch,02Ch,02Ch,02Ch,02Ch,011h,00Fh,00Fh,00Fh,011h,00Fh,011h,000h,000h
        DB 000h,011h,011h,011h,011h,011h,02Ch,02Ch,02Ch,011h,00Fh,00Fh,00Fh,00Fh,011h,000h,000h
        DB 011h,00Fh,00Fh,00Fh,00Fh,00Fh,011h,02Ch,02Ch,02Ch,011h,011h,011h,011h,011h,011h,000h
        DB 011h,02Ch,00Fh,00Fh,00Fh,02Ch,011h,02Ch,02Ch,011h,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,011h
        DB 000h,011h,011h,011h,011h,011h,006h,006h,011h,02Ah,011h,011h,011h,011h,011h,011h,000h
        DB 000h,000h,011h,006h,006h,006h,006h,006h,006h,011h,02Ah,02Ah,02Ah,02Ah,02Ah,011h,000h
        DB 000h,000h,000h,011h,011h,006h,006h,006h,006h,006h,011h,011h,011h,011h,011h,000h,000h
        DB 000h,000h,000h,000h,000h,011h,011h,011h,011h,011h,000h,000h,000h,000h,000h,000h,000h

;17x12
behind1 DB 0CCh DUP(37h)

;26X1
obj1    DB 000h,011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h,000h
;26x12
obj2    DB 011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h
        DB 011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h
        DB 011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h
        DB 011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h
        DB 011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h
        DB 011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h
        DB 011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h
        DB 011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h
        DB 011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h
        DB 011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h
        DB 011h,030h,05Ch,030h,030h,077h,030h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,0D8h,077h,0D8h,0D8h,011h
        DB 011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h


;8x9
bkg1    DB 011h,011h,011h,011h,011h,011h,011h,011h
        DB 044h,044h,044h,044h,044h,044h,044h,044h
        DB 030h,030h,030h,030h,077h,077h,077h,077h
        DB 030h,030h,030h,077h,077h,077h,077h,030h
        DB 030h,030h,077h,077h,077h,077h,030h,030h
        DB 030h,077h,077h,077h,077h,030h,030h,030h
        DB 0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0C0h
        DB 08Bh,08Bh,08Bh,08Bh,08Bh,08Bh,08Bh,08Bh
        DB 059h,059h,059h,059h,059h,059h,059h,059h

behind2 DB 0252h DUP(00)


;Text Data ----------------------------------------------------------
txt1 DB "Score: ",24h
txt2 DB "High Score: ",24h

;Program Data -------------------------------------------------------
x DW 0000
y DW 0000
x_y DW 0000
x_y2 DW 0000

spr DW 3ED0h
spr_2 EQU 0CCh
spr_f DW 0000
spr_n DB 00
sprplus DW 140h
sprplus2 DW 1

obj DW 0B25h
obj_2 DW 0016h
obj_f DW 0000
objcmp DW 0A00h
objcmp2 DW 0B40h
obj_a DW 0000

pltf DB 07
score DW 0000
hscore DW 0000
handle DB "highscr",00
bfr DB 03 DUP (00)
flags DB 0   ;Bit 0 - Collision detected
chrclr DB 00

;Timer Data ---------------------------------------------------------
timer DW 0000
t_pltf DW 0000
t_spr DW 0000
t_spr2 DW 0000
t_spr3 DW 0000
t_obj DW 0000
t_scr DW 01EEh
t_scr2 DW 0206h
t_scr3 DW 0236h


kbdbfr DB 128 DUP(?)

ENDS DATA

STACK SEGMENT
    DW 100h DUP(00)
ENDS STACK

CODE SEGMENT

START PROC FAR

;Initial configurations ---------------------------------------------

MOV AX,3509h
INT 21h
PUSH ES
PUSH BX

MOV AX,CS
MOV DS,AX
MOV AX,2509h
MOV DX,OFFSET kbdint
INT 21h

MOV AX,0013h
INT 10h
MOV AX,DATA
MOV DS,AX
MOV AX,0A000h
MOV ES,AX

;Barra de Score
_start:
MOV AH,02
MOV BH,00
MOV DX,00
INT 10h

MOV AH,09
MOV DX,OFFSET txt1
INT 21h

MOV CX,04
MOV DL,30h
MOV AH,02
_st_l1:
INT 21h
LOOP _st_l1

MOV AH,02
MOV BH,00
MOV DX,0017h
INT 10h

MOV AH,09
MOV DX,OFFSET txt2
INT 21h

MOV AX,3D02h
MOV DX,OFFSET handle
INT 21h
JNC _st_n1

MOV AH,3Ch
MOV CX,0000
MOV DX,OFFSET handle
INT 21h

_st_n1:
MOV BX,AX
MOV AH,3Fh
MOV CX,02
MOV DX,OFFSET bfr
INT 21h

MOV AX,4200h
MOV CX,00
MOV DX,00
INT 21h
PUSH BX

MOV CX,4
MOV BH,bfr
MOV BL,[bfr+1]
MOV hscore,BX

_st_l2:
PUSH BX
SHR BX,0Ch

MOV DL,BL
ADD DL,30h
MOV AH,02
INT 21h
POP BX
SHL BX,4

LOOP _st_l2

;Eixo Y: 8 (score) - 139 (ceu) - 22 (bkg2) - 10 (matagal) - 9 (bkg1) - 12 (areia)

MOV AL,37h
MOV CX,0ADC0h
MOV DI,0A00h
CALL PrintPxl

MOV CX,0Bh
_loop2:
PUSH CX
PUSH DI
MOV SI,OFFSET bkg2
MOV y,16h
MOV x,1Bh
MOV x_y,125h
CALL PrintSpr
POP DI
POP CX
ADD DI,1Bh
LOOP _loop2

MOV SI,OFFSET bkg2
MOV CX,16h
_loop3:
PUSH CX
MOV CX,17h
    _loop4:
    DS:
    MOV AL,[SI]
    ES:
    MOV [DI],AL
    INC SI
    INC DI
    LOOP _loop4
ADD DI,129h
ADD SI,4
POP CX
LOOP _loop3

SUB DI,129h
MOV CX,0C80h
MOV AL,79h
CALL PrintPxl

MOV CX,28h
_loop5:
PUSH CX
PUSH DI
MOV SI,OFFSET bkg1
MOV y,09h
MOV x,08h
MOV x_y,138h
CALL PrintSpr
POP DI
POP CX
ADD DI,08h
LOOP _loop5

ADD DI,0A00h
MOV CX,0F00h
MOV AL,59h
CALL PrintPxl

;Behinds///////////////////////////////
MOV x,11h
MOV y,0Ch
MOV x_y,12Fh
MOV DI,OFFSET behind1
MOV SI,spr
MOV spr_f,SI
CALL CopySpr

MOV AX,obj
ADD AX,19h
MOV obj_f,AX

_startbtn:
CMP [kbdbfr+1Ch],1
JNE _startbtn

;CMD ----------------------------------------------------------------
    ;Bugs:
    ;- Cenario mudando de posicao (1px pra cima no inicio)
    ;- Cenario bugando ao andar
    ;- Depois de varias mortes jogo trava
    ;- Canos e pontuacao atrasando com o tempo

;///////Timer:
_timer:                 ;Timer do cano
CALL Waiting
CMP DX,t_obj
JBE _t_next

MOV DX,timer            ;Configuracoes da mudanca de posicao do cano
CMP DL,0E4h
JB _o1
SUB DL,0E4h
_o1:
CMP DL,098h
JB _o2
SUB DL,098h
_o2:
CMP DL,04Ch
JB _o3
SUB DL,04Ch
_o3:
XOR AX,AX
MOV AL,DL
MOV obj_a,AX
MOV obj_2,16h

MOV DI,obj
MOV AL,37h
MOV x,1Ah
MOV y,8Bh
MOV x_y,126h
CALL PrintPxl2

MOV AX,timer
ADD AX,0280h
MOV t_obj,AX


_t_next:                ;Configuracoes do score
MOV DX,timer
CMP DX,t_scr2
JBE _scr_n2
    MOV AX,711h
    OUT 42h,AL
    MOV AL,AH
    OUT 42h,AL
    MOV AX,t_scr
    ADD AX,18h
    MOV t_scr2,AX

_scr_n2:
CMP DX,t_scr3
JBE _scr_n1
    IN AL,61h
    AND AL,1111_1100b
    OUT 61h,AL
    MOV AX,t_scr2
    ADD AX,30h
    MOV t_scr3,AX

_scr_n1:
CMP DX,t_scr
JBE _t_next2
    INC score

CMP score,9999h
JE _gameover

_tn_scr:
MOV AX,score
PUSH AX
AND AX,0Fh
CMP AX,0Ah
JNE _tn1_scr
ADD score,6

_tn1_scr:
POP AX
PUSH AX
AND AX,0F0h
CMP AX,0A0h
JNE _tn2_scr
ADD score,60h

_tn2_scr:
POP AX
PUSH AX
AND AX,0F00h
CMP AX,0A00h
JNE _tn3_scr
ADD score,600h

_tn3_scr:
POP AX
AND AX,0F000h
CMP AX,0A000h
JNE _tn4_scr
ADD score,6000h

_tn4_scr:
MOV CX,4
MOV AH,02
MOV BH,00
MOV DX,0007h
INT 10h
MOV BX,score

_scr_l1:
PUSH BX
SHR BX,0Ch

MOV DL,BL
ADD DL,30h
MOV AH,02
INT 21h
POP BX
SHL BX,4

LOOP _scr_l1

MOV AL,0B6h
OUT 43h,AL
IN AL,61h
OR AL,0000_0011b
OUT 61h,AL
MOV AX,96Fh
OUT 42h,AL
MOV AL,AH
OUT 42h,AL

MOV AX,timer
ADD AX,280h
MOV t_scr,AX


_t_next2:
MOV DX,timer
CMP DX,t_pltf
JA _platform

_tn1:                   ;Configuracoes do Flappy Bird
CMP DX,t_spr2
JBE _tn1_next
INC spr_n
MOV AX,timer
ADD AX,10h
MOV t_spr2,AX
    _tn1_next:
    CMP DX,t_spr3
    JBE _tn1_next2
    MOV sprplus,140h
    MOV sprplus2,1
        _tn1_next2:
        CMP DX,t_spr
        JA _sprite

;///////Button detection:
_btnchk:
CMP [kbdbfr+1],1
JE _exit
CMP [kbdbfr+39h],1
JE _jump
JMP _timer

;Movement -----------------------------------------------------------

_platform:
    CMP pltf,00
    JNE _pltf_next
    MOV pltf,07
    _pltf_next:
    MOV DI,0DFC0h
    PUSH DI
    XOR AX,AX
    MOV AL,pltf
    ADD DI,AX
    MOV CX,27h
    _pltf_loop:
    PUSH CX
    PUSH DI
    MOV SI,OFFSET bkg1
    MOV y,09h
    MOV x,08h
    MOV x_y,138h
    CALL PrintSpr
    POP DI
    POP CX
    ADD DI,08h
    LOOP _pltf_loop
    
    POP DI
    MOV SI,OFFSET bkg1
    PUSH DI
    PUSH SI
    MOV y,9
    XOR AX,AX
    MOV AL,pltf
    MOV x,AX
    PUSH x
    MOV AX,8
    SUB AX,x
    ADD SI,AX
    MOV x_y2,AX
    MOV AX,140h
    SUB AX,x
    MOV x_y,AX
    PUSH y
    PUSH x
    PUSH x_y
    CALL PrintSpr
    
    POP x_y
    POP x
    POP y
    POP x_y2
    POP SI
    POP DI
    MOV AX,8
    SUB AX,x
    ADD DI,140h
    SUB DI,AX
    MOV x,AX
    MOV AX,140h
    SUB AX,x
    MOV x_y,AX
    CALL PrintSpr
    
    MOV x_y2,00
    DEC pltf
    MOV AX,timer
    ADD AX,01h
    MOV t_pltf,AX
JMP _object

;Sprite -------------------------------------------------------------

_sprite:
CMP spr_n,4
JNE _spr_next
MOV spr_n,00

_spr_next:
CMP spr,0A00h
JAE _spr_next2
ADD spr,140h

_spr_next2:
MOV SI,OFFSET behind1
MOV DI,spr_f
MOV x,11h
MOV y,0Ch
MOV x_y,12Fh
PUSH SI
PUSH x
PUSH y
PUSH x_y
CALL PrintSpr

POP x_y
POP y
POP x
POP DI
MOV SI,spr
MOV spr_f,SI
CMP SI,0A8C0h
JAE _spr_n1
ADD SI,1h
_spr_n1:
PUSH SI
PUSH x
PUSH y
PUSH x_y
CALL CopySpr


MOV SI,OFFSET spr1
XOR AX,AX
MOV AL,spr_2
MUL spr_n
ADD SI,AX
POP x_y
POP y
POP x
POP DI
CMP DI,0A8C0h
JAE _spr_n2
SUB DI,1h
_spr_n2:
CALL PrintBrd

MOV AL,flags
AND AL,1
CMP AL,1
JE _gameover

MOV AX,sprplus
ADD spr,AX
MOV AX,timer
ADD AX,sprplus2
MOV t_spr,AX
JMP _btnchk

;Object -------------------------------------------------------------
_object:
MOV AX,objcmp
CMP obj,AX
JAE _obj_next
ADD obj,140h

_obj_next:
CMP obj_2,0FFFFh
JNE _obj_next2
MOV obj_2,1Ah

_obj_next2:
MOV AX,objcmp2
CMP obj_f,AX
JB _obj_next3
SUB obj_f,140h

_obj_next3:
MOV y,8Ah
MOV x,1
MOV x_y,13Fh
MOV DI,obj_f
MOV AL,37h
CALL PrintPxl2

MOV y,16h
MOV x,1h
MOV x_y,13Fh
MOV SI,OFFSET bkg2
ADD SI,obj_2
MOV x_y2,1Ah
CALL PrintSpr
MOV objcmp,0A00h
MOV objcmp2,0B40h

MOV y,0Ch
MOV x,1
MOV x_y,13Fh
MOV AL,79h
CALL PrintPxl2

MOV AX,obj
ADD AX,19h
MOV obj_f,AX
DEC obj_2

MOV AX,obj_a
PUSH AX
ADD AX,10h

MOV y,AX
MOV x,1Ah
MOV x_y,126h
MOV x_y2,0FFE6h
MOV DI,obj
MOV SI,OFFSET obj1
CALL PrintObj

MOV y,0Ch
MOV x,1Ah
MOV x_y2,00
MOV x_y,126h
MOV SI,OFFSET obj2
CALL PrintObj

ADD DI,3200h
ADD objcmp,3200h
ADD objcmp2,3200h

MOV y,0Ch
MOV x,1Ah
MOV x_y,126h
MOV SI,OFFSET obj2
CALL PrintObj

POP CX
MOV AX,4Ch
SUB AX,CX
ADD AX,0Fh

MOV y,AX
MOV x,1Ah
MOV x_y,126h
MOV x_y2,0FFE6h
MOV SI,OFFSET obj1
CALL PrintObj

MOV x_y2,00
DEC obj
MOV objcmp,0A00h
MOV objcmp2,0B40h
JMP _tn1

;Functions ----------------------------------------------------------

;///////Jump:
_jump:
CMP sprplus2,1
JNE _timer
MOV [kbdbfr+39h],0
MOV sprplus,0FEC0h
MOV AX,timer
ADD AX,22h
MOV t_spr3,AX
MOV sprplus2,1
JMP _timer

;///////Restart:
_gameover:
CMP [kbdbfr+1],1
JE _exit
CMP [kbdbfr+1Ch],1
JNE _gameover
POP BX
MOV AX,score
CMP hscore,AX
JA _go_n1
MOV bfr,AH
MOV [bfr+1],AL
MOV AH,40h
MOV CX,2
MOV DX,OFFSET bfr
INT 21h
MOV AH,3Eh
INT 21h

_go_n1:

MOV x,0000
MOV y,0000
MOV x_y,0000
MOV x_y2,0000
MOV spr,3ED0h
MOV spr_f,0000
MOV spr_n,00
MOV sprplus,140h
MOV sprplus2,1
MOV obj,0B25h
MOV obj_2,0016h
MOV obj_f,0000
MOV objcmp,0A00h
MOV objcmp2,0B40h
MOV obj_a,0000
MOV pltf,07
MOV score,0000
MOV hscore,0000
MOV flags,0
MOV timer,0000
MOV t_pltf,0000
MOV t_spr,0000
MOV t_spr2,000
MOV t_spr3,000
MOV t_obj,0000
MOV t_scr,01EEh
MOV t_scr2,0206h
MOV t_scr3,0236h
XOR AX,AX
XOR BX,BX
XOR CX,CX
XOR DX,DX
XOR DI,DI
XOR SI,SI

_go_ret1:
CMP [kbdbfr+1Ch],1
JNE _go_ret1
JMP _start

;///////Exit:
_exit:
POP BX
MOV AH,3Eh
INT 21h
MOV AX,2509h
POP DX
POP DS
INT 21h
MOV AX,0003h
INT 10h
MOV AH,4Ch
INT 21h

;Procedures ---------------------------------------------------------

PrintSpr PROC
    MOV CX,y
    _ps_loop1:
    PUSH CX
    MOV CX,x
    _ps_loop2:
    DS:
    MOV AL,[SI]
    CMP AL,00
    JE _ps_next
    ES:
    MOV [DI],AL
    _ps_next:
    INC SI
    INC DI
    LOOP _ps_loop2
    POP CX
    ADD SI,x_y2
    ADD DI,x_y
    LOOP _ps_loop1
    RET
ENDP PrintSpr

CopySpr PROC
    MOV CX,y
    _cs_loop1:
    PUSH CX
    MOV CX,x
    _cs_loop2:
    ES:
    MOV AL,[SI]
    DS:
    MOV [DI],AL
    INC SI
    INC DI
    LOOP _cs_loop2
    POP CX
    ADD DI,x_y2
    ADD SI,x_y
    LOOP _cs_loop1
    RET
ENDP CopySpr

PrintBrd PROC
    MOV CX,y
    _pb_loop1:
        PUSH CX
        MOV CX,x
        _pb_loop2:
            ES:
            CMP [DI],011h
            JNE _pb_next
            DS:
            CMP [SI],011h
            JNE _pb_next
                OR flags,1
            _pb_next:
            DS:
            MOV AL,[SI]
            CMP AL,00
            JE _pb_next2
                ES:
                MOV [DI],AL
            _pb_next2:
            INC SI
            INC DI
        LOOP _pb_loop2
        POP CX
        ADD DI,x_y
    LOOP _pb_loop1
    RET
ENDP PrintBrd

PrintPxl PROC
    _pp_loop:
    ES:
    MOV [DI],AL
    INC DI
    LOOP _pp_loop
    RET
ENDP PrintPxl

PrintPxl2 PROC
    MOV CX,y
    _pp2_l1:
    PUSH CX
    MOV CX,x
    _pp2_l2:
    ES:
    MOV [DI],AL
    INC DI
    LOOP _pp2_l2
    ADD DI,x_y
    POP CX
    LOOP _pp2_l1
    RET
ENDP PrintPxl2

Waiting PROC
    MOV CX,1Fh ;3F pro meu pc/17 pro VirtualBox/1F pro pc da casa de vovo zilah
    _waitl1:
    PUSH CX
    MOV CX,0FFFFh ;1/F pro DOSBOX A 7000 ciclos
    _waitl2:
    NOP
    LOOP _waitl2
    POP CX
    LOOP _waitl1
    INC timer
    MOV DX,timer
    RET
ENDP Waiting

PrintObj PROC
    MOV CX,y
    _po_loop1:
        PUSH CX
        MOV CX,x
            _po_loop2:
            CMP DI,objcmp2
            JB _po_n1
                SUB DI,140h
            _po_n1:
            CMP DI,objcmp
            JAE _po_n2
                ADD DI,140h
            _po_n2:
            DS:
            MOV AL,[SI]
            CMP AL,00
            JE _po_next
                ES:
                MOV [DI],AL
            _po_next:
            INC SI
            INC DI
            LOOP _po_loop2
    POP CX
    ADD SI,x_y2
    ADD DI,x_y
    ADD objcmp,140h
    ADD objcmp2,140h
    LOOP _po_loop1
    RET
ENDP PrintObj

CopyObj PROC
    MOV CX,y
    _co_loop1:
        PUSH CX
        MOV CX,x
            _co_loop2:
            CMP SI,objcmp
            JB _co_n1
                SUB SI,140h
            _co_n1:
            CMP SI,objcmp2
            JAE _co_n2
                ADD SI,140h
            _co_n2:
            ES:
            MOV AL,[SI]
            DS:
            MOV [DI],AL
            INC SI
            INC DI
            LOOP _co_loop2
    POP CX
    ADD DI,x_y2
    ADD SI,x_y
    ADD objcmp,140h
    ADD objcmp2,140h
    LOOP _co_loop1
    RET    
ENDP CopyObj

;Interruptions ------------------------------------------------------
kbdint:
PUSH AX
PUSH BX
IN AL,60h
XOR BH,BH
MOV BL,AL
AND BL,0111_1111b
SHR AL,07
XOR AL,1
MOV DS:[BX+kbdbfr],AL
IN AL,61h
MOV AH,AL
OR AL,1000_0000b
OUT 61h,AL
MOV AL,AH
OUT 61h,AL
MOV AL,20h
OUT 20h,AL
POP BX
POP AX
IRET

ENDP START

ENDS CODE

END
