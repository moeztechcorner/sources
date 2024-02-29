{$OPTIMIZATION OFF}
program EnumerableSpring4DSuite;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uData in 'Src\uData.pas',
  uDataInterface in 'Src\uDataInterface.pas',
  uFunctions in 'Src\uFunctions.pas';

begin
  try
    Launch();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
