unit uInterposition;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TData = class
    Id: Integer;
    Value: String;
    Constructor Create(AId: Integer; AValue: String);
  end;

  TEdit = class(Vcl.StdCtrls.TEdit)
  public
    Data: TData;
  end;

  TFrmInterposition = class(TForm)
    EditData: TEdit;
    BtnAddSomeData: TButton;
    EditNoData: Vcl.StdCtrls.TEdit;
    procedure BtnAddSomeDataClick(Sender: TObject);
  private
  public
  end;

var
  FrmInterposition: TFrmInterposition;

implementation

{$R *.dfm}

{ TData }

constructor TData.Create(AId: Integer; AValue: String);
begin
  Id := AId;
  Value := AValue;
end;

procedure TFrmInterposition.BtnAddSomeDataClick(Sender: TObject);
begin
  EditData.Data := TData.Create(1, 'Some data');
  ShowMessage(EditData.Data.Value);
end;

end.
