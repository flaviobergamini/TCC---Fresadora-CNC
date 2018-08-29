// LCD module connections
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

//Variáveis de armazenamento de comandos da placa Controle CNC
int bomba, ferramenta, x;
char comando='x';
int rpm=0, n;
const char characterF[] = {15,24,30,24,24,24,16,0};
const char characterC[] = {14,29,28,28,28,29,14,0};
const char characterN[] = {25,29,29,31,27,27,25,0};
const char character1[] = {21,10,21,10,21,10,21,0};
const char characterB[] = {31,25,23,19,23,23,31,31};

//Funções do software
void ferramenta_AD();
void caracteres();
void detalhes_visuais();
void suporte();

void main()
{
   UART1_Init(9600);
   Delay_ms(100);
   trisc=0b10000000;
   portc=0;
   trisb=0;
   portb=0;
   adcon1=14;
   trisa=15;
   porta=0;
 //lcd8_config(ctrl port,data port,RS,EN,WR,D7,D6,D5,D4,D3,D2,D1,D0);
 //  lcd8_config(&portb,&portd,0,2,1,7,6,5,4,3,2,1,0);
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
   detalhes_visuais();
   
  while (1)
  {
    if (UART1_Data_Ready())
    {
      comando = UART1_Read();
      UART1_Write(comando);
    }
        suporte();
        caracteres();
        rpm=adc_read(0);
        // rpm=(rpm*30000)/1023;
         
        if(porta.f1==0&&porta.f2==0)
        {
            comando='x';
            portc.f0=1;
            ferramenta_AD();
        }
        else
        {
            comando=comando;
            portc.f0=0;
            portc.f1=0;
        }

        if(porta.f1==0)              //Bomba de Resfriamento
        {
           comando='x';
           portc.f0=1;
           delay_ms(10);
        }
        else
        {
          comando=comando;
          portc.f0=0;
        }

        if(porta.f2==0)               //Ferramenta de usinagem
        {
          comando='x';
          portc.f1=1;
          ferramenta_AD();
        }
        else
        {
          comando=comando;
          portc.f1=0;
        }

        if(porta.f3==0)               //Hold ATMEGA328P
        {
          comando='x';
          portc.f3=0;
          delay_ms(200);
        }
        else
        {
          comando=comando;
          portc.f3=1;
        }
        if(comando=='m')
        {
          portc.f0=1;
          portc.f1=1;
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
          detalhes_visuais();
          comando='x';
        }
        switch(comando)
        {
          case 'b' :           portc.f0=1;
                               delay_ms(10);
                               break;
                               
          case 'f' :           portc.f1=1;
                               delay_ms(10);
                               ferramenta_AD();
                               break;
                               
          case 'h' :           portc.f3=0;
                               delay_ms(10);
                               break;
                               
          case 'B' :           portc.f0=0;
                               break;
                               
          case 'F' :           portc.f1=0;
                               caracteres();
                               lcd_out(1,3,"");
                               Lcd_Chr_CP(0);
                               Lcd_out(1,4,"resadora ");
                               Lcd_Chr_CP(1);
                               Lcd_Chr_CP(2);
                               Lcd_Chr_CP(1);
                               lcd_out(2,1,"                ");
                               comando='x';
                               detalhes_visuais();
                               break;
                               
          case 'H' :           portc.f3=1;
                               break;

        }
   } //fim while
}

void ferramenta_AD()
{
 lcd_out(1,3," Velocidade:  ");
 
 if(rpm<=1023&&rpm>=705)
 lcd_out(2,6,"Maxima");

 if(rpm<=704&&rpm>=429)
 lcd_out(2,5," Media ");
 
 if(rpm<=428&&rpm>=0)
 lcd_out(2,6,"Minima");

//  n=rpm/10000;
//  lcd_chr(2,4,n+48);
//  n=(rpm/1000)%10;
//  lcd_chr(2,5,n+48);
//  n=(rpm/100)%10;
//  lcd_chr(2,6,n+48);
//  n=(rpm/10)%10;
//  lcd_chr(2,7,n+48);
//  n=rpm%10;
//  lcd_chr(2,8,n+48);
//  lcd_out(2,10,"RPM");
}

void caracteres()
{
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(characterF[i]);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(characterC[i]);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(characterN[i]);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(characterB[i]);
}

void detalhes_visuais()
{
   for(x=0;x<17;x++)
   {
     lcd_out(2,x,"");
     Lcd_Chr_CP(3);
     delay_ms(50);
   }

 //  for(x=17;x>0;x--)
   for(x=0;x<17;x++)
   {
     lcd_out(2,x," ");
     delay_ms(50);

   }
}

void suporte()
{
 if(comando=='!')
 {
  UART1_Write_Text("Copyright Reserved by");
  UART1_Write(13);
  UART1_Write(10);
  UART1_Write_Text("Flavio H. M. Bergamini");
  UART1_Write(13);
  UART1_Write(10);
 }
}