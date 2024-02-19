unit uDerivedParams;

interface

Uses uBaseParams;

Type
  TDerivedParams = class(TBaseParams)
  private
    FMemoValue: string;
    function GetMemoValue: string;
    procedure SetMemoValue(AValue: String);
  public
    property MemoValue: string read GetMemoValue write SetMemoValue;
    Constructor Create(const AParam1, AParam2, AParam3: string;
      const AIsActive1, AIsActive2, AIsActive3: Boolean;
      const ATitle, AMemoValue: string);
  end;

implementation

{ TDerivedParams }

constructor TDerivedParams.Create(const AParam1, AParam2, AParam3: string;
  const AIsActive1, AIsActive2, AIsActive3: Boolean; const ATitle,
  AMemoValue: string);
begin
  inherited Create(AParam1, AParam2, AParam3, AIsActive1, AIsActive2, AIsActive3, ATitle);
  FMemoValue := AMemoValue;
end;

function TDerivedParams.GetMemoValue: string;
begin
  Result := FMemoValue;
end;

procedure TDerivedParams.SetMemoValue(AValue: String);
begin
  FMemoValue := AValue;
end;

end.
