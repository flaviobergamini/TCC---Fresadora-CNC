#line 1 "E:/TCC-Mecatr�nica/Projeto Hardware/controle CNC com serial1/Software/Teste de perif�ricos PIC TCC/Teste perif�ricos PIC TCC.c"
void main()
{

 trisc=0;
 portc=0;
 trisa=2;
 porta=0;
 adcon1=7;
 while (1)
 {
 if(porta.f1==0)
 {
 portc.f0=1;
 delay_ms(200);
 }
 else
 {
 portc.f0=0;
 delay_ms(200);
 }

 }
}
