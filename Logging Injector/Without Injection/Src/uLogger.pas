unit uLogger;

interface

uses
  System.Classes;

type
  TLogger = class(TObject)
  protected
    FLog: TStrings;
  public
    constructor Create(AStrings: TStrings);
    procedure Log(s: string);
  end;

var
  Logger: TLogger;

implementation

constructor TLogger.Create(AStrings: TStrings);
begin
  inherited Create;
  FLog := AStrings;
end;

procedure TLogger.Log(s: string);
begin
  FLog.Add(s);
end;

end.
