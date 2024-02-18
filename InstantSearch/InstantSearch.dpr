program InstantSearch;

uses
  Vcl.Forms,
  EventDispatcher in 'Src\EventDispatcher.pas',
  uInstantSearch in 'Src\uInstantSearch.pas' {FrmInstantSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmInstantSearch, FrmInstantSearch);
  Application.Run;
end.
