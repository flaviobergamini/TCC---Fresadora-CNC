char comando[7];
int x;

void main() 
{
 trisc=0b10000000;
 portc=0;
 adcon1=7;
 cmcon=7;
 UART1_Init(9600);
 Delay_ms(100);
 UART1_Write_Text("Iniciando...");
 UART1_Write(10);
 UART1_Write(13);

 while(1)
{
 if(UART1_Data_Ready())
 {
  comando[0]=UART1_Read();
  if(comando[0]=250)
  {
   x=1;
   while(x<=7)
   {
    if (UART1_Data_Ready())
    {
       comando[x]=UART1_Read();
       x++;
    }
     if(comando[1]='a');
    {
      UART1_Write_Text("1 ufhguthtiti");
      UART1_Write(10);
      UART1_Write(13);
    }
    if(comando[2]='b');
    {
      UART1_Write_Text("2 uvhdfuodhf");
      UART1_Write(10);
      UART1_Write(13);
    }
    if(comando[3]='c');
    {
      UART1_Write_Text("3 Flavio");
      UART1_Write(10);
      UART1_Write(13);
    }
    if(comando[4]='d');
    {
      UART1_Write_Text("4 fvudbhubthbubp");
      UART1_Write(10);
      UART1_Write(13);
    }
   }
  }
 }
}
}
