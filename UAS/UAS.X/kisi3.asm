STATUS equ 03h ; STATUS merujuk ke alamat memori 03h
PORTA equ 05h ; PORTA merujuk ke alamat memori 05h
PORTB equ 06h ; PORTB merujuk ke alamat memori 06h
PORTC equ 07h ; PORTC merujuk ke alamat memori 07h
PORTD equ 08h
TRISA equ 85h ; TRISA merujuk ke alamat memori 85h
TRISB equ 86h ; TRISB merujuk ke alamat memori 86h
TRISC equ 87h ; TRISC merujuk ke alamat memori 87h
TRISD equ 88h ; TRISE merujuk ke alamat memori 89h
ADCON1 equ 9Fh ; ADCON1 merujuk ke alamat memori 9Fh
 
    cblock h'20'
    delay_1
    delay_2
    endc
    
    org 00			; origin register
    
	clrw			; Clear the working register
	bsf	STATUS,5	; ke Bank1
	movlw	0x06		; konfigurasi seluruh PIN
        movwf	ADCON1		; sebagai digital inputs
	
	movlw	0x0F		;
	movwf	TRISA		; TRISA bit 4-0 bernilai 1
				; menyebabkan PORTA bit 4-0 menjadi INPUT
	movlw	0x00		; 
	movwf	TRISB		; TRISB seluruh bitnya diberi nilai 0
				; menyebabkan Seluruh Pin PORTB menjadi OUTPUT
	movlw	0x00		; 
	movwf	TRISC
	
	movlw	0x00		; 
	movwf	TRISD
	bcf	STATUS,5	; ke Bank0 (karena PORTA dan PORTB ada di Bank0)
	clrf	PORTA		; PORTA di-clear 
	clrf	PORTB		; PORTB di-clear
	clrf	PORTC		; PORTB di-clear
	clrf	PORTD		; PORTB di-clear

    
loop
	btfsc	PORTA,0		; Jika RA0 = 0, lompati 1 instruksi.
	call	normal		; panggil subrutin
	
	
	btfsc	PORTA,1		; Jika RA0 = 0, lompati 1 instruksi.
	call	atas_bawah
	
	
	btfsc	PORTA,2		; Jika RA0 = 0, lompati 1 instruksi.
	call	kiri_kanan
	
	
	btfsc	PORTA,3		; Jika RA0 = 1, lompati 1 instruksi.
	call	bawah_atas_kiri
	
	
	btfsc	PORTA,4		    ; Jika RA0 = 1, lompati 1 instruksi.
	call	bawah_atas_kanan    ; panggil subrutin
	nop
	
	goto loop
	
normal
	movlw b'00000000'
	movwf PORTB
	call delay
	
	movlw b'00000000'
	movwf PORTC
	call delay
	
	movlw b'00000000'
	movwf PORTD
	call delay
	
	return
	

atas_bawah
	movlw b'00001111' ;Kolom 1 nyala 
	movwf PORTB
	
	movlw b'00001111' ;kolom 2 nyala
	movwf PORTC
	
	movlw b'00001111' ;kolom 3 nyala
	movwf PORTD
	call delay
	
	movlw b'11110000' ;Kolom 1 mati
	movwf PORTB
	
	movlw b'11110000' ;Kolom 2 mati
	movwf PORTC
	
	movlw b'11110000' ;Kolom 3 mati
	movwf PORTD
	call delay
	return
	
kiri_kanan
	movlw b'11111111' ;Kolom 1 nyala
	movwf PORTB
	call delay
	
	movlw b'00000000' ;kolom 1 mati
	movwf PORTB
	call delay
	
	movlw b'11111111' ;kolom 2 nyala
	movwf PORTC
	call delay
	
	movlw b'00000000' ;kolom 2 mati
	movwf PORTC
	call delay
	
	movlw b'11111111' ;kolom 3 nyala
	movwf PORTD
	call delay
	
	movlw b'00000000' ;kolom 3 mati
	movwf PORTD
	call delay
	
	return
	
bawah_atas_kiri
	;kolom 1
	movlw b'10000000' ;Kolom 1 bawah ke atas 8
	movwf PORTB
	call delay
	
	movlw b'01000000' ;Kolom 1 bawah ke atas 7
	movwf PORTB
	call delay
	
	movlw b'00100000' ;Kolom 1 bawah ke atas 6
	movwf PORTB
	call delay
	
	movlw b'00010000' ;Kolom 1 bawah ke atas 5
	movwf PORTB
	call delay
	
	movlw b'00001000' ;Kolom 1 bawah ke atas 4
	movwf PORTB
	call delay
	
	movlw b'00000100' ;Kolom 1 bawah ke atas 3
	movwf PORTB
	call delay
	
	movlw b'00000010' ;Kolom 1 bawah ke atas 2
	movwf PORTB
	call delay
	
	movlw b'00000001' ;Kolom 1 bawah ke atas 1
	movwf PORTB
	call delay
	
	movlw b'00000000' ;Kolom 1 bawah ke atas mati
	movwf PORTB
	call delay
	
	;kolom 2
	movlw b'00000001' ;Kolom 2 atas ke bawah 1
	movwf PORTC
	call delay
	
	movlw b'00000010' ;Kolom 2 atas ke bawah 2
	movwf PORTC
	call delay
	
	movlw b'00000100' ;Kolom 2 atas ke bawah 3
	movwf PORTC
	call delay
	
	movlw b'00001000' ;Kolom 2 atas ke bawah 4
	movwf PORTC
	call delay
	
	movlw b'00010000' ;Kolom 2 atas ke bawah 5
	movwf PORTC
	call delay
	
	movlw b'00100000' ;Kolom 2 atas ke bawah 6
	movwf PORTC
	call delay
	
	movlw b'01000000' ;Kolom 2 atas ke bawah 7
	movwf PORTC
	call delay
	
	movlw b'10000000' ;Kolom 2 atas ke bawah 8
	movwf PORTC
	call delay
	
	movlw b'00000000' ;Kolom 2 atas ke bawah mati
	movwf PORTC
	call delay
	
	;kolom 3
	movlw b'10000000' ;Kolom 3 bawah ke atas 8
	movwf PORTD
	call delay
	
	movlw b'01000000' ;Kolom 3 bawah ke atas 7
	movwf PORTD
	call delay
	
	movlw b'00100000' ;Kolom 3 bawah ke atas 6
	movwf PORTD
	call delay
	
	movlw b'00010000' ;Kolom 3 bawah ke atas 5
	movwf PORTD
	call delay
	
	movlw b'00001000' ;Kolom 3 bawah ke atas 4
	movwf PORTD
	call delay
	
	movlw b'00000100' ;Kolom 3 bawah ke atas 3
	movwf PORTD
	call delay
	
	movlw b'00000010' ;Kolom 3 bawah ke atas 2
	movwf PORTD
	call delay
	
	movlw b'00000001' ;Kolom 3 bawah ke atas 1
	movwf PORTD
	call delay
	
	movlw b'00000000' ;Kolom 3 bawah ke atas mati
	movwf PORTD
	call delay
	
	;kolom 2 terakhir
	movlw b'00000001' ;Kolom 2 atas ke bawah 1
	movwf PORTC
	call delay
	
	movlw b'00000010' ;Kolom 2 atas ke bawah 2
	movwf PORTC
	call delay
	
	movlw b'00000100' ;Kolom 2 atas ke bawah 3
	movwf PORTC
	call delay
	
	movlw b'00001000' ;Kolom 2 atas ke bawah 4
	movwf PORTC
	call delay
	
	movlw b'00010000' ;Kolom 2 atas ke bawah 5
	movwf PORTC
	call delay
	
	movlw b'00100000' ;Kolom 2 atas ke bawah 6
	movwf PORTC
	call delay
	
	movlw b'01000000' ;Kolom 2 atas ke bawah 7
	movwf PORTC
	call delay
	
	movlw b'10000000' ;Kolom 2 atas ke bawah 8
	movwf PORTC
	call delay
	
	movlw b'00000000' ;Kolom 2 atas ke bawah mati
	movwf PORTC
	call delay
	return
	
bawah_atas_kanan
	;kolom 3 bawah
	movlw b'10000000' ;Kolom 3 bawah ke atas 8
	movwf PORTD
	call delay
	
	movlw b'01000000' ;Kolom 3 bawah ke atas 7
	movwf PORTD
	call delay
	
	movlw b'00100000' ;Kolom 3 bawah ke atas 6
	movwf PORTD
	call delay
	
	movlw b'00010000' ;Kolom 3 bawah ke atas 5
	movwf PORTD
	call delay
	
	movlw b'00001000' ;Kolom 3 bawah ke atas 4
	movwf PORTD
	call delay
	
	movlw b'00000100' ;Kolom 3 bawah ke atas 3
	movwf PORTD
	call delay
	
	movlw b'00000010' ;Kolom 3 bawah ke atas 2
	movwf PORTD
	call delay
	
	movlw b'00000001' ;Kolom 3 bawah ke atas 1
	movwf PORTD
	call delay
	
	movlw b'00000000' ;Kolom 3 bawah ke atas mati
	movwf PORTD
	call delay
	
	;kolom 2 atas
	movlw b'00000001' ;Kolom 2 atas ke bawah 1
	movwf PORTC
	call delay
	
	movlw b'00000010' ;Kolom 2 atas ke bawah 2
	movwf PORTC
	call delay
	
	movlw b'00000100' ;Kolom 2 atas ke bawah 3
	movwf PORTC
	call delay
	
	movlw b'00001000' ;Kolom 2 atas ke bawah 4
	movwf PORTC
	call delay
	
	movlw b'00010000' ;Kolom 2 atas ke bawah 5
	movwf PORTC
	call delay
	
	movlw b'00100000' ;Kolom 2 atas ke bawah 6
	movwf PORTC
	call delay
	
	movlw b'01000000' ;Kolom 2 atas ke bawah 7
	movwf PORTC
	call delay
	
	movlw b'10000000' ;Kolom 2 atas ke bawah 8
	movwf PORTC
	call delay
	
	movlw b'00000000' ;Kolom 2 atas ke bawah mati
	movwf PORTC
	call delay
	
	;kolom 1 bawah
	movlw b'10000000' ;Kolom 1 bawah ke atas 8
	movwf PORTB
	call delay
	
	movlw b'01000000' ;Kolom 1 bawah ke atas 7
	movwf PORTB
	call delay
	
	movlw b'00100000' ;Kolom 1 bawah ke atas 6
	movwf PORTB
	call delay
	
	movlw b'00010000' ;Kolom 1 bawah ke atas 5
	movwf PORTB
	call delay
	
	movlw b'00001000' ;Kolom 1 bawah ke atas 4
	movwf PORTB
	call delay
	
	movlw b'00000100' ;Kolom 1 bawah ke atas 3
	movwf PORTB
	call delay
	
	movlw b'00000010' ;Kolom 1 bawah ke atas 2
	movwf PORTB
	call delay
	
	movlw b'00000001' ;Kolom 1 bawah ke atas 1
	movwf PORTB
	call delay
	
	movlw b'00000000' ;Kolom 1 bawah ke atas mati
	movwf PORTB
	call delay
	
	;kolom 2 atas terakhir
	movlw b'00000001' ;Kolom 2 atas ke bawah 1
	movwf PORTC
	call delay
	
	movlw b'00000010' ;Kolom 2 atas ke bawah 2
	movwf PORTC
	call delay
	
	movlw b'00000100' ;Kolom 2 atas ke bawah 3
	movwf PORTC
	call delay
	
	movlw b'00001000' ;Kolom 2 atas ke bawah 4
	movwf PORTC
	call delay
	
	movlw b'00010000' ;Kolom 2 atas ke bawah 5
	movwf PORTC
	call delay
	
	movlw b'00100000' ;Kolom 2 atas ke bawah 6
	movwf PORTC
	call delay
	
	movlw b'01000000' ;Kolom 2 atas ke bawah 7
	movwf PORTC
	call delay
	
	movlw b'10000000' ;Kolom 2 atas ke bawah 8
	movwf PORTC
	call delay
	
	movlw b'00000000' ;Kolom 2 atas ke bawah mati
	movwf PORTC
	call delay
	
	return
		
delay
	movlw   d'255'		; isi w-reg dengan desimal 255 (nilai maksimal 255)
				; menentukan waktu delay.
	movwf   delay_1		; isi memori delay_1 dengan nilai w-reg
	movwf   delay_2		; isi memori delay_2 dengan nilai w-reg
delay_loop
	decfsz	delay_1, f	; delay_1 = delay_1 ? 1, jika delay_1 = 0 maka lompat
	    goto delay_loop	; kembali kurangi delay_1
	decfsz	delay_2, f	; delay_2 = delay_2 ? 1, jika delay_2 = 0 maka lompat
	    goto delay_loop	; kembali kurangi delay_2
	return

	end
