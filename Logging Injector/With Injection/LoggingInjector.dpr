program LoggingInjector;

uses
  Vcl.Forms,
  uLoggingInjector in 'Src\uLoggingInjector.pas' {FrmLogging},
  uLogger in 'Src\uLogger.pas',
  uObjetMetier in 'Src\uObjetMetier.pas',
  uLoggerInterface in 'Src\uLoggerInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogging, FrmLogging);
  Application.Run;
end.
