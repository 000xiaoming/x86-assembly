         ;�����嵥7-2
         ;�ļ�����c07_2.asm
         ;�ļ�˵����Ӳ����������������
         ;��������:2017-10-05 18:12

         jmp near start

 message db '1+2+3+...+1000='

 start:
         mov ax,0x7c0           ;�������ݶεĶλ���ַ 
         mov ds,ax

         mov ax,0xb800          ;���ø��Ӷλ�ַ����ʾ������
         mov es,ax

         ;������ʾ�ַ��� 
         mov si,message          
         mov di,0
         mov cx,start-message
     @g:
         mov al,[si]
         mov [es:di],al
         inc di
         mov byte [es:di],0x07
         inc di
         inc si
         loop @g

         ;���¼���1��1000�ĺ�,500500 

         xor ax,ax
         xor dx,dx
         mov cx,1000
     @f:
         add ax,cx
         adc dx,0
         loop @f                

         mov bx,10
         xor cx,cx
     @d:
         inc cx
                            ;ԭ��xor dx,dx������
         div bx
         or dl,0x30
         push dx
         xor dx,dx          ;����������
         cmp ax,0
         jne @d

         ;������ʾ������λ 
     @a:
         pop dx
         mov [es:di],dl
         inc di
         mov byte [es:di],0x07
         inc di
         loop @a

         jmp near $ 


times 510-($-$$) db 0
                 db 0x55,0xaa