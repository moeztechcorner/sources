unit uBaseParams;

interface

uses uParamsInterface;

Type
  TBaseParams = class(TInterfacedObject, IParams)
  private
    FParam1: string;
    FParam2: string;
    FParam3: string;
    FIsActive1: Boolean;
    FIsActive2: Boolean;
    FIsActive3: Boolean;
    FTitle: string;
    function GetParam1: string;
    function GetParam2: string;
    function GetParam3: string;
    function GetIsActive1: Boolean;
    function GetIsActive2: Boolean;
    function GetIsActive3: Boolean;
    function GetTitle: string;
    procedure SetParam1(AValue: String);
    procedure SetParam2(AValue: String);
    procedure SetParam3(AValue: String);
    procedure SetIsActive1(AValue: Boolean);
    procedure SetIsActive2(AValue: Boolean);
    procedure SetIsActive3(AValue: Boolean);
    procedure SetTitle(AValue: String);
  public
    property Param1: string read GetParam1 write SetParam1;
    property Param2: string read GetParam2 write SetParam2;
    property Param3: string read GetParam3 write SetParam3;
    property IsActive1: Boolean read GetIsActive1 write SetIsActive1;
    property IsActive2: Boolean read GetIsActive2 write SetIsActive2;
    property IsActive3: Boolean read GetIsActive3 write SetIsActive3;
    property Title: string read GetTitle write SetTitle;
    Constructor Create(const AParam1, AParam2, AParam3: string;
      const AIsActive1, AIsActive2, AIsActive3: Boolean;
      const ATitle: string);
  end;

implementation

{ TParams }

constructor TBaseParams.Create(const AParam1, AParam2, AParam3: string;
  const AIsActive1, AIsActive2, AIsActive3: Boolean;
  const ATitle: string);
begin
  FParam1 := AParam1;
  FParam2 := AParam2;
  FParam3 := AParam3;
  FIsActive1 := AIsActive1;
  FIsActive2 := AIsActive2;
  FIsActive3 := AIsActive3;
  FTitle := ATitle;
end;

function TBaseParams.GetIsActive1: Boolean;
begin
  Result := FIsActive1;
end;

function TBaseParams.GetIsActive2: Boolean;
begin
  Result := FIsActive2;
end;

function TBaseParams.GetIsActive3: Boolean;
begin
  Result := FIsActive3;
end;

function TBaseParams.GetParam1: string;
begin
  Result := FParam1;
end;

function TBaseParams.GetParam2: string;
begin
  Result := FParam2;
end;

function TBaseParams.GetParam3: string;
begin
  Result := FParam3;
end;

function TBaseParams.GetTitle: string;
begin
  Result := FTitle;
end;

procedure TBaseParams.SetIsActive1(AValue: Boolean);
begin
  FIsActive1 := AValue;
end;

procedure TBaseParams.SetIsActive2(AValue: Boolean);
begin
  FIsActive2 := AValue;
end;

procedure TBaseParams.SetIsActive3(AValue: Boolean);
begin
  FIsActive3 := AValue;
end;

procedure TBaseParams.SetParam1(AValue: String);
begin
  FParam1 := AValue;
end;

procedure TBaseParams.SetParam2(AValue: String);
begin
  FParam2 := AValue;
end;

procedure TBaseParams.SetParam3(AValue: String);
begin
  FParam3 := AValue;
end;

procedure TBaseParams.SetTitle(AValue: String);
begin
  FTitle := AValue;
end;

end.
