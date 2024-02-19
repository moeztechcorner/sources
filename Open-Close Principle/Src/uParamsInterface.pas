unit uParamsInterface;

interface

type

  IParams = Interface
  ['{AC5A02CC-4C11-4EA2-97BF-CD47864419E1}']
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
    property Param1: string read GetParam1 write SetParam1;
    property Param2: string read GetParam2 write SetParam2;
    property Param3: string read GetParam3 write SetParam3;
    property IsActive1: Boolean read GetIsActive1 write SetIsActive1;
    property IsActive2: Boolean read GetIsActive2 write SetIsActive2;
    property IsActive3: Boolean read GetIsActive3 write SetIsActive3;
    property Title: string read GetTitle write SetTitle;
  End;

implementation

end.
