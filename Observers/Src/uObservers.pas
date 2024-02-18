unit uObservers;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Data.DB,
  Datasnap.DBClient;

type
  TFrmObservsers = class(TForm)
    Valider: TBitBtn;
    Annuler: TBitBtn;
    cds: TClientDataSet;
    cdsComposant: TStringField;
    cdsValeurChaine: TStringField;
    cdsValeurBoolean: TBooleanField;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure AnnulerClick(Sender: TObject);
    procedure ValiderClick(Sender: TObject);
  private
    procedure EnableButtons();
    procedure DisableButtons();
    procedure Post();
    procedure Rollback(Conteneur: TWinControl);
    procedure LoadCDS(Conteneur: TWinControl);
    procedure AddListeners(Conteneur: TWinControl);
    procedure CheckValue(const AComponentName: string);
    procedure IsValuesChanged(AContainer: TWinControl; var AIsValuesChanged: Boolean);
    function  GenerateRandomString(const ALength: Integer): String;
    procedure CreateCDS();
    procedure CustomizeComponents();
    procedure ClearCDS();
    procedure SetEditChangeAction(AEdit: TEdit; AExecuteEvent: TNotifyEvent);
    procedure SetCheckBoxCheckAction(ACheckBox: TCheckBox; AExecuteEvent: TNotifyEvent);
  public
  end;

var
  FrmObservsers: TFrmObservsers;

implementation

Uses EventDispatcher;

{$R *.dfm}

procedure TFrmObservsers.FormCreate(Sender: TObject);
begin
  CreateCDS();
  DisableButtons();
  CustomizeComponents();
  LoadCDS(Self);
  AddListeners(Self);
end;

procedure TFrmObservsers.CreateCDS();
Begin
  cds.Active := False;
  cds.CreateDataSet;
End;

function TFrmObservsers.GenerateRandomString(const ALength: Integer): String;
const
  CharSequence: String = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
var
  Ch, SequenceLength: Integer;
begin
  SequenceLength := Length(CharSequence);
  SetLength(Result, ALength);
  Randomize;
  for Ch := Low(Result) to High(Result) do
    Result[Ch] := CharSequence.Chars[Random(SequenceLength)];
end;

procedure TFrmObservsers.SetCheckBoxCheckAction(ACheckBox: TCheckBox;
  AExecuteEvent: TNotifyEvent);
Begin
  ACheckBox.Action := TBasicAction.Create(Self);
  ACheckBox.Action.OnExecute := AExecuteEvent;
  ACheckBox.OnClick := TEventDispatcher.Create(procedure (Sender: TObject)
  begin
    ACheckBox.Action.Execute;
  end);
end;

procedure TFrmObservsers.SetEditChangeAction(AEdit: TEdit;
  AExecuteEvent: TNotifyEvent);
Begin
  AEdit.Action := TBasicAction.Create(Self);
  AEdit.Action.OnExecute := AExecuteEvent;
  AEdit.OnChange := TEventDispatcher.Create(procedure (Sender: TObject)
  begin
    AEdit.Action.Execute;
  end);
end;

procedure TFrmObservsers.CustomizeComponents();
Begin
  Randomize;

  for var i:=0 to ControlCount-1 do
    if Controls[i] is TCheckBox then
      TCheckBox(Controls[i]).Checked := StrToBool(Random(2).ToString)
    else if Controls[i] is TEdit then
      TEdit(Controls[i]).Text := GenerateRandomString(6);

  SetCheckBoxCheckAction(CheckBox1,
                         TEventDispatcher.Create(procedure (Sender: TObject)
                         begin
                           CheckValue(CheckBox1.Name);
                         end));
  SetCheckBoxCheckAction(CheckBox2,
                         TEventDispatcher.Create(procedure (Sender: TObject)
                         begin
                           CheckValue(CheckBox2.Name);
                         end));
  SetCheckBoxCheckAction(CheckBox3,
                         TEventDispatcher.Create(procedure (Sender: TObject)
                         begin
                           CheckValue(CheckBox3.Name);
                         end));
  SetCheckBoxCheckAction(CheckBox4,
                         TEventDispatcher.Create(procedure (Sender: TObject)
                         begin
                           CheckBox1.Checked := not CheckBox1.Checked;
                           Caption := CheckBox4.Name;
                           CheckValue(CheckBox4.Name);
                         end));
  SetCheckBoxCheckAction(CheckBox5,
                         TEventDispatcher.Create(procedure (Sender: TObject)
                         begin
                           CheckValue(CheckBox5.Name);
                         end));

  SetEditChangeAction(Edit1,
                      TEventDispatcher.Create(procedure (Sender: TObject)
                      begin
                        CheckValue(Edit1.Name);
                      end));
  SetEditChangeAction(Edit2,
                      TEventDispatcher.Create(procedure (Sender: TObject)
                      begin
                        CheckValue(Edit2.Name);
                      end));
  SetEditChangeAction(Edit3,
                      TEventDispatcher.Create(procedure (Sender: TObject)
                      begin
                        CheckValue(Edit3.Name);
                      end));
  SetEditChangeAction(Edit4,
                      TEventDispatcher.Create(procedure (Sender: TObject)
                      begin
                        CheckValue(Edit4.Name);
                      end));
  SetEditChangeAction(Edit5,
                      TEventDispatcher.Create(procedure (Sender: TObject)
                      begin
                        CheckValue(Edit1.Name);
                      end));
End;

procedure TFrmObservsers.LoadCDS(Conteneur: TWinControl);
begin
  for var i:= 0 to Conteneur.ControlCount - 1 do
  begin
    var Composant: TComponent := Conteneur.Controls[i];
    if Composant is TWinControl then
      LoadCDS(TWinControl(Composant));

    if (Composant is TEdit) or (Composant is TCheckBox) then
    begin
      cds.Open;
      cds.Insert;
      cdsComposant.AsString := Composant.Name;
      if (Composant is TEdit) then
        cdsValeurChaine.AsString := TEdit(Composant).Text
      else if (Composant is TCheckBox) then
        cdsValeurBoolean.AsBoolean := TCheckBox(Composant).Checked;
      cds.Post;
    end;
  end;
end;

procedure TFrmObservsers.AddListeners(Conteneur: TWinControl);
var
  I: Integer;
  Composant: TComponent;
begin
  for I := 0 to Conteneur.ControlCount - 1 do
  begin
    Composant := Conteneur.Controls[I];
    if Composant is TWinControl then
      AddListeners(TWinControl(Composant));

    if (Composant is TEdit) then
    begin
      TEdit(Composant).OnChange := TEventDispatcher.Create(
      procedure(Sender: TObject)
      begin
        CheckValue(TEdit(Sender).Name);
      end);
    end
    else
    if (Composant is TCheckBox) then
    begin
      TCheckBox(Composant).OnClick := TEventDispatcher.Create(
      procedure(Sender: TObject)
      begin
        CheckValue(TCheckBox(Sender).Name);
      end);
    end;
  end;
end;

procedure TFrmObservsers.CheckValue(const AComponentName: String);
var
  C: TComponent;
  P: TWinControl;
  bIsDifferentValue: Boolean;
  bIsValuesChanged: Boolean;
Begin
  C := Nil;
  bIsDifferentValue := False;
  cds.Filtered := False;
  cds.Filter := 'COMPOSANT='+QuotedStr(AComponentName);
  cds.Filtered := True;
  cds.Open;
  cds.First;
  if (not cds.Eof) then
  Begin
    C := FindComponent(AComponentName);
    if (C<>Nil) Then
    Begin
      bIsDifferentValue := (C is TEdit) and (TEdit(C).Text<>cdsValeurChaine.AsString);
      bIsDifferentValue := bIsDifferentValue or ((C is TCheckBox) and (TCheckBox(C).Checked<>cdsValeurBoolean.AsBoolean));
    end;
  end;

  if bIsDifferentValue then
  begin
    EnableButtons();
  end
  else if (C<>Nil) then
  begin
    P := Nil;
    if (C is TEdit) then
      P := TEdit(C).Parent
    else if (C is TCheckBox) then
      P := TCheckBox(C).Parent;
    While (P<>Nil) and (not (P is TForm)) do
      P := P.Parent;
    if (P<>Nil) then
    begin
      bIsValuesChanged := False;
      IsValuesChanged(P, bIsValuesChanged);
      if not bIsValuesChanged then
        DisableButtons();
    end;
  end;
end;

procedure TFrmObservsers.IsValuesChanged(AContainer: TWinControl; var AIsValuesChanged: Boolean);
var
  i: Integer;
  Ctrl: TControl;
  C: TComponent;
begin
  for i:=0 to AContainer.ControlCount-1 do
  begin
    if not AIsValuesChanged then
    Begin
      if AContainer.Controls[i] is TWinControl then
        IsValuesChanged(TWinControl(AContainer.Controls[i]), AIsValuesChanged);

      Ctrl := AContainer.Controls[i];
      if Ctrl is TWinControl then
      Begin
        cds.Filtered := False;
        cds.Filter := 'COMPOSANT='+QuotedStr(TWinControl(Ctrl).Name);
        cds.Filtered := True;
        cds.Open;
        cds.First;
        if (not cds.Eof) then
        begin
          C := FindComponent(TWinControl(Ctrl).Name);
          if (C<>Nil) Then
          Begin
            AIsValuesChanged := (C is TEdit) and (TEdit(C).Text<>cdsValeurChaine.AsString);
            AIsValuesChanged := AIsValuesChanged or ((C is TCheckBox) and (TCheckBox(C).Checked<>cdsValeurBoolean.AsBoolean));
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmObservsers.DisableButtons();
begin
  Annuler.Enabled := False;
  Valider.Enabled := False;
end;

procedure TFrmObservsers.EnableButtons();
begin
  Valider.Enabled := True;
  Annuler.Enabled := True;
end;

procedure TFrmObservsers.Post();
begin
  ClearCDS();
  LoadCDS(Self);
end;

procedure TFrmObservsers.Rollback(Conteneur: TWinControl);
var
  C: TComponent;
  BackupNotifyEvent: TNotifyEvent;
  BackupAction: TBasicAction;
begin
  cds.Filter := '';
  cds.Filtered := False;
  cds.Open;
  cds.First;
  while not cds.Eof do
  begin
    BackupAction := Nil;
    C := FindComponent(cdsComposant.AsString);
    if (C<>Nil) Then
    Begin
      if (C is TEdit) or (C is TCheckBox) then
      begin
        if (C is TEdit) then
        Begin
          BackupNotifyEvent := TEdit(C).OnChange;
          if (TEdit(C).Action<>Nil) then
            BackupAction := TEdit(C).Action;
          TEdit(C).Action := Nil;
          TEdit(C).OnChange := Nil;
          TEdit(C).Text := cdsValeurChaine.AsString;
          TEdit(C).OnChange := BackupNotifyEvent;
          TEdit(C).Action := BackupAction;
        end
        else
        if (C is TCheckBox) then
        begin
          BackupNotifyEvent := TCheckBox(C).OnClick;
          if (TCheckBox(C).Action<>Nil) then
            BackupAction := TCheckBox(C).Action;
          TEdit(C).Action := Nil;
          TCheckBox(C).OnClick := Nil;
          TCheckBox(C).Checked := cdsValeurBoolean.AsBoolean;
          TCheckBox(C).OnClick := BackupNotifyEvent;
          TCheckBox(C).Action := BackupAction;
        end
      end;
    end;
    cds.Next;
  end;
end;

procedure TFrmObservsers.AnnulerClick(Sender: TObject);
begin
  Rollback(Self);
  DisableButtons();
end;

procedure TFrmObservsers.ValiderClick(Sender: TObject);
begin
  Post();
  DisableButtons();
end;

procedure TFrmObservsers.ClearCDS();
begin
  cds.Filter := '';
  cds.Filtered := False;
  cds.Open;
  cds.First;
  while not cds.Eof do
    cds.Delete;
end;

end.
