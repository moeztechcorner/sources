unit uObjetMetier;

interface

type
  TObjetMetier = class
  protected
  public
    procedure TraitementMetier;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils,
  uLogger;

constructor TObjetMetier.Create;
begin
  inherited;
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
