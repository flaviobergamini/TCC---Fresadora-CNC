#line 1 "E:/TCC-Mecatrônica/teste PIC/teste _PIC.c"
void t()
{
 delay_ms(200);
}

void main()
{
 trisb=0x00;
 portb=0x00;
 adcon1=0x07;

 while(1)
 {
 portb.f0=1;
 t();
 portb.f0=0;
 t();
 }
}
