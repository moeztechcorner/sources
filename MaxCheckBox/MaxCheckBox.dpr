program MaxCheckBox;

uses
  Vcl.Forms,
  uCheckBox in 'Src\uCheckBox.pas' {FrmCheckBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCheckBox, FrmCheckBox);
  Application.Run;
end.
