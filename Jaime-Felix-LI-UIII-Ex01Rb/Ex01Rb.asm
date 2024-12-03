					TITLE	Programa para elevar al cuadrado o al cubo a un número utilizando una macro
					PAGE	60, 132

; Incluir las macros
Include Macros.inc

; MacroCuadradoCubo para elevar un número al cuadrado o al cubo
; Parámetros de entrada: Numero
; Parámetros de salida: Resultado

MacroCuadradoCubo	MACRO	Numero, Resultado
					; Guardar los registros utilizados

					; Almacenar el resultado en el parámetro de salida

					; Recuperar los registros
					ENDM

; Prototipos de llamadas al sistema operativo
GetStdHandle	PROTO	:QWORD
ReadConsoleW	PROTO	:QWORD,	:QWORD, :QWORD, :QWORD, :QWORD
WriteConsoleW	PROTO	:QWORD,	:QWORD, :QWORD, :QWORD, :QWORD
ExitProcess		PROTO	CodigoSalida:QWORD

				.DATA
Num				QWORD	0
Res				QWORD	0
MenEnt01		WORD	'P', 'r', 'o', 'p', 'o', 'r', 'c', 'i', 'o', 'n', 'e', ' ', 'u', 'n', ' ', 'n', 'ú', 'm', 'e', 'r', 'o', ':', ' '
MenSal01		WORD	'E', 'l', ' ', 'c', 'u', 'a', 'd', 'r', 'a', 'd', 'o', ' ', 'e', 's', ':', ' '

; Variables utilizadas por las llamadas al sistema
ManejadorE		QWORD	?
ManejadorS		QWORD	?
Caracteres		QWORD	?
Texto			WORD	13 DUP ( ? )				; Variable temporal para conversión Entero - Cadena, Cadena - Entero
SaltoLinea		WORD	13, 10
STD_INPUT		EQU		-10
STD_OUTPUT		EQU		-11

				.CODE
Principal		PROC

				; Alinear espacio en la pila
				SUB		RSP, 40

				; Obtener manejador estándar del teclado
				MOV		RCX, STD_INPUT
				CALL	GetStdHandle
				MOV		ManejadorE, RAX

				; Obtener manejador estándar de la consola
				MOV		RCX, STD_OUTPUT
				CALL	GetStdHandle
				MOV		ManejadorS, RAX

				; Solicitar la variable Num

				; Llamar la macro para elevar el número al cuadrado o al cubo

				; Mostrar el mensaje de salida correspondiente según el numero (cuadrado o cubo)

				; Mostrar el resultado

				; Salto de línea
				MOV		RCX, ManejadorS				; Manejador de la consola donde se escribe
				LEA		RDX, SaltoLinea				; Dirección de la cadena a escribir
				MOV		R8, LENGTHOF SaltoLinea		; Número de caracteres a escribir
				LEA		R9, Caracteres				; Dirección de la variable donde se guarda el total de caracteres escrito
				MOV		R10, 0						; Reservado para uso futuro
				CALL	WriteConsoleW

				; Salir al sistema operativo
				MOV		RCX, 0
				CALL	ExitProcess

Principal		ENDP
				END