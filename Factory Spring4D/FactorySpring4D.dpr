program FactorySpring4D;

uses
  Vcl.Forms,
  uMain in 'Src\uMain.pas' {FrmMain};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
