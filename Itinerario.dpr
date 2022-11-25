program Itinerario;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  DataModule in 'DataModule.pas' {dm: TDataModule},
  UOpenURL in 'UOpenURL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
