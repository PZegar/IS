		THUMB
		AREA    vector_table, DATA, READONLY				;tablia wektorow przerwan  - niepelna!

				DCD     0x2000FFFF				;wartosc wskaznika stosu pod adresem 0x00000000
				DCD     reset_handler 				;komorka 0x00000004 - adres procedury obslugi przerwania reset

		ALIGN			
		AREA	program_data, DATA, READWRITE				;dane inicjowane wartoscia


byte_tab		DCB 0x01, 0x04, 0xF3, 0x41, 0x02, 0x08, 0x04, 0x00
word_result		DCD 0x00
	
		ALIGN				
		AREA	program_code, CODE, READONLY				;kod programu
		
		ENTRY								;punkt wejsciowy - adres pierwszej instrukcji w programie
		
reset_handler						
	LDR		R0,=byte_tab	; R0 adres byte_tab (1. element)
	MOV		R2,#0			; Wpisanie stalej (# = stala natychmiastowa)
while_loop
	LDRB	R1,[R0],#1			; Zaladuj spod adresu w R0 do R1 (LDRB = 1 bajt), #1 = przesun wskaznik w R0 o 1 bajt
	CMP		R1,#0				; Odejmij R1 - 0, ustawia flagi; jesli R1 jest = 0 to ustawi sie flaga "zero".
	BEQ		main_loop			; Jesli flaga "zero" jest ustawiona to skocz do main_loop.
	CMP		R2,R1				; Odemij R2 - R1.
	BHI		if_higher			; 
	MOV 	R2,R1				; Przpisz R1 do R2
if_higher
	B 		while_loop
	
main_loop
	B		main_loop		; Skok bezwarunkowy do main_loop
				
	END