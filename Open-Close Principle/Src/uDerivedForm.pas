unit uDerivedForm;

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
  Vcl.ExtCtrls,
  uBaseForm;

type
  TDerivedForm = class(TBaseForm)
    Memo: TMemo;
  private
  protected
    procedure ManageVisualControls(); override;
  end;

var
  DerivedForm: TDerivedForm;

implementation

Uses uDerivedParams;

{$R *.dfm}

{ TDerivedForm }

procedure TDerivedForm.ManageVisualControls;
begin
  inherited;
  Memo.Text := TDerivedParams(FParams).MemoValue;
end;

end.
