unit uMain;

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
  Vcl.Buttons;

type

  TMain = class(TForm)
    BaseForm1: TBitBtn;
    BaseForm2: TBitBtn;
    BaseForm3: TBitBtn;
    BaseForm4: TBitBtn;
    procedure BaseForm1Click(Sender: TObject);
    procedure BaseForm2Click(Sender: TObject);
    procedure BaseForm3Click(Sender: TObject);
    procedure BaseForm4Click(Sender: TObject);
  private
  public
  end;

var
  Main: TMain;

implementation

Uses uBaseForm,
     uBaseParams,
     uDerivedForm,
     uDerivedParams;

{$R *.dfm}

{ Params }

procedure TMain.BaseForm1Click(Sender: TObject);
begin
  with TBaseForm.Create(Self, TBaseParams.Create('B1-Param1', 'B1-Param2', 'B1-Param3', True, True, True, 'BaseForm1')) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TMain.BaseForm2Click(Sender: TObject);
begin
  with TBaseForm.Create(Self, TBaseParams.Create('B2-Param1', 'B2-Param2', 'B2-Param3', False, False, False, 'BaseForm2')) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TMain.BaseForm3Click(Sender: TObject);
begin
  with TBaseForm.Create(Self, TBaseParams.Create('B3-Param1', 'B3-Param2', 'B3-Param3', True, False, False, 'BaseForm3')) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TMain.BaseForm4Click(Sender: TObject);
begin
  // Ceci est un exemple
  with TDerivedForm.Create(Self, TDerivedParams.Create('B4-Param1', 'B4-Param2', 'B4-Param3', False, False, True, 'BaseForm4', 'B4-Memo')) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
