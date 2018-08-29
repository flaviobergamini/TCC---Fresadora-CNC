#line 1 "E:/TCC-Mecatrônica/Projeto Hardware/controle CNC com serial/Software/Controle_Fresadora_CNC_com_serial.c"

sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;


int bomba, ferramenta;
char comando;
long int rpm=0, n;
const char characterF[] = {15,24,31,24,24,24,16,0};
const char characterC[] = {14,29,28,28,28,29,14,0};
const char characterN[] = {25,29,29,31,27,27,25,0};
const char character1[] = {21,10,21,10,21,10,21,0};
const char cursor[] = {21,10,21,10,21,10,21,0};

void ferramenta_AD();
void caracteres();

void main()
{
 UART1_Init(9600);
 Delay_ms(100);
 trisc=0b10000000;
 portc=0;
 trisb=0;
 portb=0;
 adcon1=14;

 trisa=14;
 porta=0;


 Lcd_Init();
 lcd_cmd(_lcd_clear);
 lcd_cmd(_lcd_cursor_off);
 caracteres();
 lcd_out(1,3,"");
 Lcd_Chr_CP(0);
 Lcd_out(1,4,"resadora ");
 Lcd_Chr_CP(1);
 Lcd_Chr_CP(2);
 Lcd_Chr_CP(1);
 UART1_Write_text("Fresadora CNC");
 UART1_Write(10);
 UART1_Write(13);

 while (1)
 {
 if (UART1_Data_Ready())
 {
 comando = UART1_Read();
 UART1_Write(comando);
 }
 caracteres();
 rpm=adc_read(0);
 rpm=(rpm*30000)/1023;

 if(porta.f1==0&&porta.f2==0)
 {
 portc.f0=1;
 ferramenta_AD();
 }
 else
 {
 portc.f0=0;
 portc.f1=0;
 }

 if(porta.f1==0)
 {
 portc.f0=1;
 delay_ms(10);
 }
 else
 portc.f0=0;

 if(porta.f2==0)
 ferramenta_AD();
 else
 portc.f1=0;

 if(porta.f3==0)
 {
 portc.f2=0;
 delay_ms(200);
 }
 else
 {
 portc.f2=1;
 }
 if(comando=='m')
 {
 portc.f0=1;
 ferramenta_AD();
 }
 if(comando=='M')
 {
 portc.f0=0;
 portc.f1=0;
 caracteres();
 lcd_out(1,3,"");
 Lcd_Chr_CP(0);
 Lcd_out(1,4,"resadora ");
 Lcd_Chr_CP(1);
 Lcd_Chr_CP(2);
 Lcd_Chr_CP(1);
 lcd_out(2,1,"                ");
 }
 switch(comando)
 {
 case 'b' : portc.f0=1;
 delay_ms(10);
 break;
 case 'f' : portc.f1=1;
 delay_ms(10);
 ferramenta_AD();
 break;
 case 'h' : portc.f2=0;
 delay_ms(10);
 break;
 case 'B' : portc.f0=0;
 break;
 case 'F' : portc.f1=0;
 caracteres();
 lcd_out(1,3,"");
 Lcd_Chr_CP(0);
 Lcd_out(1,4,"resadora ");
 Lcd_Chr_CP(1);
 Lcd_Chr_CP(2);
 Lcd_Chr_CP(1);
 lcd_out(2,1,"                ");
 comando='x';
 break;
 case 'H' : portc.f2=1;
 break;

 }
 }
}

void ferramenta_AD()
{
 portc.f1=1;
 lcd_out(1,3," Velocidade  ");
 n=rpm/10000;
 lcd_chr(2,4,n+48);
 n=(rpm/1000)%10;
 lcd_chr(2,5,n+48);
 n=(rpm/100)%10;
 lcd_chr(2,6,n+48);
 n=(rpm/10)%10;
 lcd_chr(2,7,n+48);
 n=rpm%10;
 lcd_chr(2,8,n+48);
 lcd_out(2,10,"RPM");
}

void caracteres()
{
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(characterF[i]);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(characterC[i]);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(characterN[i]);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);

}
