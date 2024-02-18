unit uInstantSearch;

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
  Datasnap.DBClient,
  Vcl.WinXCtrls,
  Vcl.AppEvnts;

type
  TFrmInstantSearch = class(TForm)
    cds: TClientDataSet;
    cdsNum: TIntegerField;
    cdsValue: TStringField;
    ListBox: TListBox;
    SearchBox: TSearchBox;
    ListBoxResultats: TListBox;
    ApplicationEvents: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchBoxExit(Sender: TObject);
    procedure SearchBoxEnter(Sender: TObject);
    procedure SearchBoxChange(Sender: TObject);
    procedure SearchBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBoxResultatsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure ListBoxResultatsDblClick(Sender: TObject);
  private
    Type
      TData = class
        Num: Integer;
        Value: string;
        Constructor Create(ANum: Integer; AValue: string);
      end;
    function  GenerateRandomString(const ALength: Integer): String;
    procedure CreateCDS();
    procedure PopulateSomeData();
    procedure ShowData();
    procedure FocusSearchBox();
    procedure Search();
    procedure HideListBoxResultats();
    procedure ShowListBoxResultats();
    procedure FocusItemChoiced();
  public
  end;

var
  FrmInstantSearch: TFrmInstantSearch;

implementation

Const DefaultTexteSearchBox = 'Chercher dans les valeurs de votre liste ...';

{$R *.dfm}

procedure TFrmInstantSearch.FormCreate(Sender: TObject);
begin
  CreateCDS();
  PopulateSomeData();
  ShowData();
end;

procedure TFrmInstantSearch.FormDeactivate(Sender: TObject);
begin
  HideListBoxResultats();
end;

procedure TFrmInstantSearch.FormShow(Sender: TObject);
begin
  HideListBoxResultats();
  SearchBox.SetFocus;
end;

procedure TFrmInstantSearch.ApplicationEventsMessage(var Msg: tagMSG;
  var Handled: Boolean);
var
  MousePos: TPoint;
begin
  if (Msg.message=WM_LBUTTONDOWN) and (ListBoxResultats.Visible) then
  begin
    GetCursorPos(MousePos);
    var Point := ScreenToClient(MousePos);
    if not PtInRect(ListBoxResultats.BoundsRect, Point) then
    Begin
      HideListBoxResultats();
      FocusSearchBox();
    end;
  end;
end;

procedure TFrmInstantSearch.CreateCDS();
Begin
  cds.Active := False;
  cds.CreateDataSet;
End;

function TFrmInstantSearch.GenerateRandomString(const ALength: Integer): String;
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

procedure TFrmInstantSearch.PopulateSomeData();
Begin
  Randomize;

  cds.Filter := '';
  cds.Filtered := False;
  cds.Open;
  cds.First;
  var i:=1;
  While i<=1000 do
  begin
    cds.Insert;
    cdsNum.AsInteger := i;
    cdsValue.AsString := GenerateRandomString(10);
    cds.Post;
    Inc(i);
  end;
  cds.Close;
End;

procedure TFrmInstantSearch.ShowData;
begin
  cds.Filter := '';
  cds.Filtered := False;
  cds.Open;
  cds.First;
  while not cds.Eof do
  begin
    ListBox.AddItem(cdsNum.AsString+'-'+cdsValue.AsString, TData.Create(cdsNum.AsInteger, cdsValue.AsString));
    cds.Next;
  end;
  cds.Close;
end;

procedure TFrmInstantSearch.Search;
begin
  if (Length(SearchBox.Text)<3) then
  Begin
    HideListBoxResultats();
    Exit;
  end;

  cds.Filtered := False;
  cds.Filter := 'LOWER(VALUE) LIKE '+QuotedStr('%'+LowerCase(SearchBox.Text)+'%');
  cds.Filtered := True;
  cds.Open;
  cds.First;

  if cds.Eof then
  Begin
    HideListBoxResultats();
    Exit;
  end;

  ShowListBoxResultats();

  While not cds.Eof do
  begin
    ListBoxResultats.Items.AddObject(cdsValue.AsString, TData.Create(cdsNum.AsInteger, cdsValue.AsString));
    cds.Next;
  end;
end;

procedure TFrmInstantSearch.SearchBoxChange(Sender: TObject);
begin
  if SearchBox.Text = '' then
  begin
    SearchBox.Text := DefaultTexteSearchBox;
    SearchBox.SelectAll;
  end;
end;

procedure TFrmInstantSearch.SearchBoxEnter(Sender: TObject);
begin
  if SearchBox.Text = DefaultTexteSearchBox then
    PostMessage(TEdit(Sender).Handle, EM_SETSEL, 0, -1);
end;

procedure TFrmInstantSearch.SearchBoxExit(Sender: TObject);
begin
  if Trim(SearchBox.Text)='' then
    SearchBox.Text := DefaultTexteSearchBox;
end;

procedure TFrmInstantSearch.SearchBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP:
    begin
      if ListBoxResultats.ItemIndex > 0 then
        ListBoxResultats.ItemIndex := ListBoxResultats.ItemIndex - 1;
      Key := 0;
    end;

    VK_DOWN:
    begin
      if ListBoxResultats.ItemIndex < ListBoxResultats.Items.Count - 1 then
        ListBoxResultats.ItemIndex := ListBoxResultats.ItemIndex + 1;
      Key := 0;
    end;

    VK_RETURN:
    begin
      FocusItemChoiced();
      Key := 0;
    end;

    VK_ESCAPE:
    begin
      HideListBoxResultats();
      FocusSearchBox();
      Key := 0;
    end;
  end;
end;

procedure TFrmInstantSearch.SearchBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (Key in [VK_ESCAPE, VK_RETURN, VK_UP, VK_DOWN]) then
    Search();
end;

procedure TFrmInstantSearch.ShowListBoxResultats();
begin
  ListBoxResultats.Clear;

  if not ListBoxResultats.Visible then
  Begin
    ListBoxResultats.Left := SearchBox.Left;
    ListBoxResultats.Top := SearchBox.Top + SearchBox.Height;
    ListBoxResultats.Width := SearchBox.Width;
    ListBoxResultats.Height := 100;
    ListBoxResultats.Visible := True;
    ListBoxResultats.BringToFront;
  End;
end;

procedure TFrmInstantSearch.HideListBoxResultats();
begin
  if ListBoxResultats.Visible then
  Begin
    ListBoxResultats.Visible := False;
    ListBoxResultats.SendToBack;
    ListBoxResultats.Clear;
  end;
end;

procedure TFrmInstantSearch.ListBoxResultatsDblClick(Sender: TObject);
begin
  FocusItemChoiced;
end;

procedure TFrmInstantSearch.ListBoxResultatsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    HideListBoxResultats;
    SearchBox.SetFocus;
    Key := 0;
  end;
end;

procedure TFrmInstantSearch.FocusSearchBox();
Begin
  if (SearchBox.Text<>DefaultTexteSearchBox) then
  Begin
    SearchBox.Text := DefaultTexteSearchBox;
    SearchBox.SelectAll;
    SearchBox.SetFocus;
  end;
end;

procedure TFrmInstantSearch.FocusItemChoiced();
begin
  var LData := TData(ListBoxResultats.Items.Objects[ListBoxResultats.ItemIndex]);
  if (LData<>Nil) then
  Begin
    for var i:=0 to ListBox.Items.Count-1 do
    begin
      if (TData(ListBox.Items.Objects[i]).Num=LData.Num) Then
      begin
        ListBox.ItemIndex := i;
        HideListBoxResultats();
        FocusSearchBox();
        Break;
      end;
    end;
  End;
end;

{ TFrmInstantSearch.TData }

constructor TFrmInstantSearch.TData.Create(ANum: Integer; AValue: string);
begin
  Num := ANum;
  Value := AValue;
end;

end.
