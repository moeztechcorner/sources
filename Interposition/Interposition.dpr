program Interposition;

uses
  Vcl.Forms,
  uInterposition in 'Src\uInterposition.pas' {FrmInterposition};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmInterposition, FrmInterposition);
  Application.Run;
end.
