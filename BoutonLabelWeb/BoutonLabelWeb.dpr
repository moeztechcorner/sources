program BoutonLabelWeb;

uses
  Vcl.Forms,
  FrmBoutonLabelWeb in 'Src\FrmBoutonLabelWeb.pas' {FormBoutonLabelWeb};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormBoutonLabelWeb, FormBoutonLabelWeb);
  Application.Run;
end.
