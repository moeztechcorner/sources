unit uBaseForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  uParamsInterface;

type
  TBaseForm = class(TForm)
    TopPanel: TPanel;
    Container: TPanel;
    BottomPanel: TPanel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    LabelTitle: TLabel;
  protected
    FParams: IParams;
    procedure ManageVisualControls(); virtual;
  public
    Constructor Create(AOwner: TComponent; AParams: IParams); Reintroduce;
  end;

var
  BaseForm: TBaseForm;

implementation

{$R *.dfm}

{ TBaseForm }

Constructor TBaseForm.Create(AOwner: TComponent; AParams: IParams);
begin
  inherited Create(AOwner);
  FParams := AParams;
  ManageVisualControls();
end;

procedure TBaseForm.ManageVisualControls;
begin
  LabelTitle.Caption := FParams.Title;
  Edit1.Text := FParams.Param1;
  Edit2.Text := FParams.Param2;
  Edit3.Text := FParams.Param3;
  CheckBox1.Checked := FParams.IsActive1;
  CheckBox2.Checked := FParams.IsActive2;
  CheckBox3.Checked := FParams.IsActive3;
end;

end.
