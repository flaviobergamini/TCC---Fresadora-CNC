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

  } //fim while
}