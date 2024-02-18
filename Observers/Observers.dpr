program Observers;

uses
  Vcl.Forms,
  uObservers in 'Src\uObservers.pas' {FrmObservsers},
  EventDispatcher in 'Src\EventDispatcher.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmObservsers, FrmObservsers);
  Application.Run;
end.
