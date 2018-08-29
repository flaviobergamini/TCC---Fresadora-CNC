#line 1 "E:/TCC-Mecatrônica/Projeto Hardware/controle CNC/Software/Controle_Fresadora_CNC.c"

unsigned short segundo, minuto=0x40, hora=0x13, semana=0x04, dia=0x23, mes=0x11, ano=0x16;
int bomba, ferramenta;
unsigned char commando;


void horario();

void ds1307_init(void)
{
 I2C_Init(100000);
}

void ds1307_escreve() {
 I2C_Start();
 I2C_Wr(0xD0);
 I2C_Wr(0x00);
 I2C_Wr(0x00);
 I2C_Wr(minuto);
 I2C_Wr(hora);
 I2C_Wr(semana);
 I2C_Wr(dia);
 I2C_Wr(mes);
 I2C_Wr(ano);
 I2C_Stop();
}

void ds1307_leitura() {
 I2C_Start();
 I2C_Wr(0xD0);
 I2C_Wr(0x00);
 I2C_Repeated_Start();
 I2C_Wr(0xD1);
 segundo = I2C_Rd(1);
 minuto = I2C_Rd(1);
 hora = I2C_Rd(1);
 semana = I2C_Rd(1);
 dia = I2C_Rd(1);
 mes = I2C_Rd(1);
 ano = I2C_Rd(0);
 I2C_Stop();
}

void main()
{
 Usart_Init(9600);
 trisc=0;
 trisd=0;
 trise=0;
 portc=0;
 adcon1=7;
 trise=0;
 porte=0;
 trisa=15;
 porta=0;

 lcd8_config(&portb,&portd,0,2,1,7,6,5,4,3,2,1,0);
 lcd8_cmd(lcd_clear);
 lcd8_cmd(lcd_cursor_off);
 lcd8_out(1,1,"Fresadora CNC");
 Usart_Write("Fresadora CNC");
 ds1307_init();
 delay_ms(250);

 ds1307_escreve();


 while (1)
 {
 if(porta.f0==0)
 {
 porte.f0=1;
 lcd8_cmd(lcd_clear);
 lcd8_out(1,1,"Bomba Ligada!");
 delay_ms(200);
 }
 else
 {
 porte.f0=0;
 }


 if(porta.f1==0)
 {
 porte.f1=1;
 lcd8_cmd(lcd_clear);
 lcd8_out(2,1,"Fresa Ligada!");
 delay_ms(200);
 }
 else
 {
 porte.f1=0;
 }
 if(porta.f3==0)
 {
 lcd8_cmd(lcd_clear);
 lcd8_out(1,1,"Horas:");
 lcd8_out(2,1,"Data:");
 horario();
 delay_ms(200);
 }
 if(porta.f2==0)
 {
 porte.f2=0;
 delay_ms(200);
 }
 else
 {
 porte.f2=1;
 }
 }
}

void horario()
{
 ds1307_leitura();

 Lcd8_Chr(1,7,((hora & 0xF0) >> 4) + 48);
 Lcd8_Chr(1,8,(hora & 0x0F) + 48);
 Lcd8_Chr(1,9,':');
 Lcd8_Chr(1,10,((minuto & 0xF0) >> 4) + 48);
 Lcd8_Chr(1,11,(minuto & 0x0F) + 48);
 Lcd8_Chr(1,12,':');
 Lcd8_Chr(1,13,((segundo & 0xF0) >> 4) + 48);
 Lcd8_Chr(1,14,(segundo & 0x0F) + 48);

 Lcd8_Chr(2,7,((dia & 0xF0) >> 4) + 48);
 Lcd8_Chr(2,8,(dia & 0x0F) + 48);
 Lcd8_Chr(2,9,'/');
 Lcd8_Chr(2,10,((mes & 0xF0) >> 4) + 48);
 Lcd8_Chr(2,11,(mes & 0x0F) + 48);
 Lcd8_Chr(2,12,'/');
 Lcd8_Chr(2,13,((ano & 0xF0) >> 4) + 48);
 Lcd8_Chr(2,14,(ano & 0x0F) + 48);

 delay_ms(100);
}
