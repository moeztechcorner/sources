unit uDataInterface;

interface

Type

  IOrder = interface
  ['{15AEA14A-E7A3-448B-AE17-D2324156C5D3}']
    function GetRef: Integer;
    procedure SetRef(const AValue: Integer);
    function GetAmount: Double;
    procedure SetAmount(const AValue: Double);
    function GetAccount: Double;
    procedure SetAccount(const AValue: Double);
    property Ref: Integer read GetRef write SetRef;
    property Amount: Double read GetAmount write SetAmount;
    property Account: Double read GetAccount write SetAccount;
  end;

implementation

end.
