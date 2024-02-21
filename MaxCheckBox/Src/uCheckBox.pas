unit uCheckBox;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.CheckLst,
  clisted,
  cxLookAndFeelPainters,
  cxCheckComboBox,
  cxCheckBox,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit;

type
  TFrmCheckBox = class(TForm)
    CheckListEdit: TCheckListEdit;
    CheckListBox: TCheckListBox;
    cxCheckComboBox: TcxCheckComboBox;
    procedure CheckListEditClickCheck(Sender: TObject);
    procedure CheckListBoxClickCheck(Sender: TObject);
    procedure cxCheckComboBox1PropertiesClickCheck(Sender: TObject;
      ItemIndex: Integer; var AllowToggle: Boolean);
  private
  public
  end;

var
  FrmCheckBox: TFrmCheckBox;

implementation

{$R *.dfm}

procedure ControlCheckListBox(ACheckListBox: TCheckListBox; AMaxCheck: Integer);
begin
  var Counter := 0;
  for var i:=0 to ACheckListBox.Count - 1 do
  begin
    if ACheckListBox.Checked[i] then
      if Counter = AMaxCheck then
        ACheckListBox.Checked[i] := False
      else
        Inc(Counter);
  end;
  for var i:=0 to ACheckListBox.Count - 1 do
    ACheckListBox.ItemEnabled[i] := ACheckListBox.Checked[i] or (Counter<AMaxCheck);
end;

procedure ControlCheckListEdit(ACheckListEdit: TCheckListEdit; AMaxChecked: Integer);
begin
  var Counter := 0;
  for var i:=0 to ACheckListEdit.Items.Count-1 do
  begin
    if ACheckListEdit.Checked[i] then
      if Counter = AMaxChecked then
        ACheckListEdit.Checked[i] := False
      else
        Inc(Counter);
  end;
  for var i:=0 to ACheckListEdit.Items.Count-1 do
    ACheckListEdit.ItemEnabled[i] := ACheckListEdit.Checked[i] or (Counter<AMaxChecked);
end;

procedure ControlCxCheckComboBox(AcxCheckComboBox: TcxCheckComboBox; Const AItemIndex, AMaxChecked: Integer);
Begin
  if (AcxCheckComboBox.States[AItemIndex]=cbsUnchecked) then
  begin
    var Counter := 1;
    for var i:=0 to AcxCheckComboBox.Properties.Items.Count-1 do
      if (i<>AItemIndex) and (AcxCheckComboBox.States[i] = cbsChecked) then
        Inc(Counter);
    for var i:=0 to AcxCheckComboBox.Properties.Items.Count-1 do
      if (i<>AItemIndex) then
        AcxCheckComboBox.Properties.Items[i].Enabled := (AcxCheckComboBox.States[i]=cbsChecked) or (Counter<AMaxChecked);
  end else if (AcxCheckComboBox.States[AItemIndex]=cbsChecked) then
  begin
    var Counter := 1;
    for var i:=0 to AcxCheckComboBox.Properties.Items.Count-1 do
      if (i<>AItemIndex) and AcxCheckComboBox.Properties.Items.Items[i].Enabled and (AcxCheckComboBox.States[i]=cbsUnChecked) then
          Inc(Counter);
    if (Counter<=AMaxChecked) then
      for var i:=0 to AcxCheckComboBox.Properties.Items.Count-1 do
        AcxCheckComboBox.Properties.Items[i].Enabled := True;
  end;
End;

procedure TFrmCheckBox.cxCheckComboBox1PropertiesClickCheck(Sender: TObject;
  ItemIndex: Integer; var AllowToggle: Boolean);
begin
  ControlCxCheckComboBox(TcxCheckComboBox(Sender), ItemIndex, 3);
end;

procedure TFrmCheckBox.CheckListBoxClickCheck(Sender: TObject);
begin
  ControlCheckListBox(TCheckListBox(Sender), 3);
end;

procedure TFrmCheckBox.CheckListEditClickCheck(Sender: TObject);
begin
  ControlCheckListEdit(TCheckListEdit(Sender), 3);
end;

end.
