unit uLoggingInjector;

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
  TFrmLogging = class(TForm)
    mLogs: TMemo;
    btnDoBusinessThings: TBitBtn;
    procedure btnDoBusinessThingsClick(Sender: TObject);
  private
  public
  end;

var
  FrmLogging: TFrmLogging;

implementation

uses ulogger,
     uObjetMetier;

{$R *.dfm}

procedure TFrmLogging.btnDoBusinessThingsClick(Sender: TObject);
var
  om: TObjetMetier;
begin
  om := TObjetMetier.Create(TLogger.Create(mLogs.Lines));
  try
    om.TraitementMetier;
  finally
    om.Free;
  end;
end;

end.
