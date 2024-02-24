unit uData;

interface

uses uDataInterface;

Type
  TOrder = class(TInterfacedObject, IOrder)
  private
    FRef: Integer;
    FAmount: Double;
    FAccount: Double;
    function GetRef: Integer;
    procedure SetRef(const AValue: Integer);
    function GetAmount: Double;
    procedure SetAmount(const AValue: Double);
    function GetAccount: Double;
    procedure SetAccount(const AValue: Double);
  public
    property Ref: Integer read GetRef write SetRef;
    property Amount: Double read GetAmount write SetAmount;
    property Account: Double read GetAccount write SetAccount;
    Constructor Create(const ARef: Integer; const AAmount, AAccount: Double);
  end;

implementation

{ TOrder }

function TOrder.GetAccount: Double;
begin
  Result := FAccount;
end;

procedure TOrder.SetAccount(const AValue: Double);
begin
  FAccount := AValue;
end;

function TOrder.GetAmount: Double;
begin
  Result := FAmount;
end;

procedure TOrder.SetAmount(const AValue: Double);
begin
  FAmount := AValue;
end;

function TOrder.GetRef: Integer;
begin
  Result := FRef;
end;

procedure TOrder.SetRef(const AValue: Integer);
begin
  FRef := AValue;
end;

constructor TOrder.Create(const ARef: Integer; const AAmount, AAccount: Double);
begin
  FRef := ARef;
  FAmount := AAmount;
  FAccount := AAccount;
end;

end.
