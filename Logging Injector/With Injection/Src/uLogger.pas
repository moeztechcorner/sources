unit uLogger;

interface

uses
  System.Classes,
  uLoggerInterface;

type
  TLogger = class(TAbstractLogger)
  protected
    FLog: TStrings;
  public
    constructor Create(AStrings: TStrings);
    procedure Log(s: string); override;
  end;

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
