cseg segment para 'code'	
     assume cs: cseg,ds: cseg
     org 100H	
begin:
     db 68H, 00H, 0b8H	; push 0b800H
     db 1FH 		; pop ds
     int 10H
     mov bh, 7H     
main_loop:
     xchg   cx,ax 
     int 1AH         
     mov [bx], dl
delay:
     int 1AH
     cmp [bx], dl
     je delay
     
     xchg ax, si       
     add al, dl        
     xchg ax, si      

     xchg ax, cx       

     in al, 60H
     cmp al, 77
     jnz keytest1 
     inc bx
     inc bx 
keytest1:
     ja keytest2
     dec bx
     dec bx
keytest2:

     mov ah,0CH
     int 21H   

     mov ax, 0701H    
     mov dx, 1827H
     int 10H
     
     mov [si], ax           
     db 89H, 55H, 51H		; mov [di+51], dx   
     cmp [bx], dh 		
     ja main_loop
     ret
cseg ends
     end begin
