unit uObjetMetier;

interface

uses uLoggerInterface;

type
  TObjetMetier = class
  protected
    Logger : ILogger;
  public
    procedure TraitementMetier;
    constructor Create(ALogger: ILogger);
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

constructor TObjetMetier.Create(ALogger: ILogger);
begin
  inherited Create;
  Logger := ALogger;
  Sleep(150);
  Logger.Log('Create TObjetMetier');
end;

destructor TObjetMetier.Destroy;
begin
  Sleep(150);
  Logger.Log('Destroy TObjetMetier');
  inherited;
end;

procedure TObjetMetier.TraitementMetier;
begin
  Logger.Log('Begin TObjetMetier.TraitementMetier');
  Sleep(500);
  Logger.Log('End TObjetMetier.TraitementMetier');
end;

end.
