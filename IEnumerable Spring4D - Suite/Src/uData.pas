unit uData;

interface

uses uDataInterface;

Type
  TOrder = class(TInterfacedObject, IOrder)
  private
    FRef: Integer;
    FAmount: Double;
    FAccount: Double;
    FCity: String;
    function GetRef: Integer;
    procedure SetRef(const AValue: Integer);
    function GetAmount: Double;
    procedure SetAmount(const AValue: Double);
    function GetAccount: Double;
    procedure SetAccount(const AValue: Double);
    function GetCity: String;
    procedure SetCity(const AValue: String);
  public
    property Ref: Integer read GetRef write SetRef;
    property Amount: Double read GetAmount write SetAmount;
    property Account: Double read GetAccount write SetAccount;
    property City: string read GetCity write SetCity;
    Constructor Create(const ARef: Integer; const AAmount, AAccount: Double;
      const ACity: string);
  end;

implementation

{ TOrder }

function TOrder.GetCity: String;
begin
  Result := FCity;
end;

procedure TOrder.SetCity(const AValue: String);
begin
  FCity := AValue;
end;

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

constructor TOrder.Create(const ARef: Integer;
  const AAmount, AAccount: Double; const ACity: string);
begin
  FRef := ARef;
  FAmount := AAmount;
  FAccount := AAccount;
  FCity := ACity;
end;

end.
