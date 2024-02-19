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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDoBusinessThingsClick(Sender: TObject);
  private
  public
  end;

var
  FrmLogging: TFrmLogging;

implementation

uses uLogger,
     uObjetMetier;

{$R *.dfm}

procedure TFrmLogging.btnDoBusinessThingsClick(Sender: TObject);
var
  om: TObjetMetier;
begin
  om := TObjetMetier.Create;
  try
    om.TraitementMetier;
  finally
    om.Free;
  end;
end;

procedure TFrmLogging.FormCreate(Sender: TObject);
begin
  Logger := TLogger.Create(mLogs.Lines);
end;

procedure TFrmLogging.FormDestroy(Sender: TObject);
begin
  Logger.Free;
end;

end.
