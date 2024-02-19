program OCP;

uses
  Vcl.Forms,
  uParamsInterface in 'Src\uParamsInterface.pas',
  uBaseForm in 'Src\uBaseForm.pas' {BaseForm},
  uDerivedForm in 'Src\uDerivedForm.pas' {DerivedForm},
  uDerivedParams in 'Src\uDerivedParams.pas',
  uMain in 'Src\uMain.pas' {Main},
  uBaseParams in 'Src\uBaseParams.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
