program Sobre;

uses
  Vcl.Forms,
  Uprincipal in '..\Uprincipal.pas' {CNC_Eletro_Program},
  Vcl.Themes,
  Vcl.Styles,
  Usobre in '..\Usobre\Usobre.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glow');
  Application.CreateForm(TCNC_Eletro_Program, CNC_Eletro_Program);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
