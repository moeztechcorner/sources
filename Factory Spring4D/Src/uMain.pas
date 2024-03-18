unit uMain;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Variants,
  Spring.DesignPatterns,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.Graphics,
  Winapi.Messages,
  Winapi.Windows;

type
  TFrmMain = class(TForm)
    BitBtnClassicFactoryRedEdit: TBitBtn;
    BitBtnSpring4DFactoryRedEdit: TBitBtn;
    BitBtnClassicFactoryBlueEdit: TBitBtn;
    BitBtnSpring4DFactoryBlueEdit: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnClassicFactoryRedEditClick(Sender: TObject);
    procedure BitBtnClassicFactoryBlueEditClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnSpring4DFactoryRedEditClick(Sender: TObject);
    procedure BitBtnSpring4DFactoryBlueEditClick(Sender: TObject);
  private const
    RedEditLeft = 355;
    BlueEditLeft = 500;
    RedEditSpringLeft = 655;
    BlueEditSpringLeft = 800;
  private
    RedEditTop: integer;
    RedEditTotal: integer;
    BlueEditTop: integer;
    BlueEditTotal: integer;
    RedEditStringTop: integer;
    RedEditStringTotal: integer;
    BlueEditStringTop: integer;
    BlueEditStringTotal: integer;

    EditFactory: TFactory<string, TEdit>;
  end;

  TEditFactory = class
  public
    class function CreateColoredEdit(AOwner: TComponent;
      TextColor: TColor): TEdit;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

{ TEditFactory }

class function TEditFactory.CreateColoredEdit(AOwner: TComponent;
  TextColor: TColor): TEdit;
begin
  Result := TEdit.Create(AOwner);
  Result.Parent := AOwner as TWinControl;
  Result.Font.Color := TextColor;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  RedEditCreation: TFactoryMethod<TEdit>;
  BlueEditCreation: TFactoryMethod<TEdit>;
begin
  RedEditTop := 11;
  RedEditTotal := 0;
  BlueEditTop := 11;
  BlueEditTotal := 0;

  RedEditStringTop := 11;
  RedEditStringTotal := 0;
  BlueEditStringTop := 11;
  BlueEditStringTotal := 0;

  EditFactory := TFactory<string, TEdit>.Create;

  RedEditCreation := function: TEdit
  begin
    Result := TEdit.Create(Self);
    Result.Parent := Self;
    Result.Left := RedEditSpringLeft;
    Result.Top := RedEditStringTop;
    Result.Font.Color := clRed;
    RedEditStringTop := RedEditStringTop + 30;
    Result.Text := Format('Spring4D Factory #%d', [RedEditStringTotal]);
  end;

  BlueEditCreation := function: TEdit
  begin
    Result := TEdit.Create(Self);
    Result.Parent := Self;
    Result.Left := BlueEditSpringLeft;
    Result.Top := BlueEditStringTop;
    Result.Font.Color := clBlue;
    BlueEditStringTop := BlueEditStringTop + 30;
    Result.Text := Format('Spring4D Factory #%d', [BlueEditStringTotal]);
  end;

  EditFactory.RegisterFactoryMethod('RedEdit', RedEditCreation);
  EditFactory.RegisterFactoryMethod('BlueEdit', BlueEditCreation);
end;

procedure TFrmMain.BitBtnClassicFactoryRedEditClick(Sender: TObject);
begin
  var RedEdit := TEditFactory.CreateColoredEdit(Self, clRed);
  RedEdit.Left := RedEditLeft;
  RedEdit.Top := RedEditTop;
  RedEdit.Text := Format('Classic Factory : #%d', [RedEditTotal]);
  RedEditTop := RedEditTop + 30;
  Inc(RedEditTotal);
end;

procedure TFrmMain.BitBtnClassicFactoryBlueEditClick(Sender: TObject);
begin
  var BlueEdit := TEditFactory.CreateColoredEdit(Self, clBlue);
  BlueEdit.Left := BlueEditLeft;
  BlueEdit.Top := BlueEditTop;
  BlueEdit.Text := Format('Classic Factory : #%d', [BlueEditTotal]);
  BlueEditTop := BlueEditTop + 30;
  Inc(BlueEditTotal);
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  EditFactory.Free;
end;

procedure TFrmMain.BitBtnSpring4DFactoryRedEditClick(Sender: TObject);
begin
  Inc(RedEditStringTotal);
  EditFactory.GetInstance('RedEdit');
end;

procedure TFrmMain.BitBtnSpring4DFactoryBlueEditClick(Sender: TObject);
begin
  Inc(BlueEditStringTotal);
  EditFactory.GetInstance('BlueEdit');
end;

end.
