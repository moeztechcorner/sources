unit EventDispatcher;

interface

uses System.SysUtils,
     System.Classes,
     Vcl.Controls;

type
  TProcMoez = reference to procedure(Sender: TObject; var Key: Char);

  TEventDispatcher = class
  protected
    FDelegate: TProc<TObject>;
    FDelegate1: TProcMoez;
    procedure OnNotifyEvent(Sender: TObject); overload;
    procedure OnKeyPressEvent(Sender: TObject; var Key: Char); overload;
  public
    class function Create(const ADelegate: TProc<TObject>): TNotifyEvent; overload;
    class function Create(const ADelegate: TProcMoez): TKeyPressEvent; overload;
    function Wire(const ADelegate: TProc<TObject>): TNotifyEvent; overload;
    function Wire(const ADelegate: TProcMoez): TKeyPressEvent; overload;
  end;

implementation

function TEventDispatcher.Wire(
  const ADelegate: TProc<TObject>): TNotifyEvent;
begin
  FDelegate := ADelegate;
  Result := Self.OnNotifyEvent;
end;

function TEventDispatcher.Wire(
  const ADelegate: TProcMoez): TKeyPressEvent;
begin
  FDelegate1 := ADelegate;
  Result := Self.OnKeyPressEvent;
end;

class function TEventDispatcher.Create(
  const ADelegate: TProc<TObject>): TNotifyEvent;
begin
  Result := TEventDispatcher.Create().Wire(ADelegate);
end;

class function TEventDispatcher.Create(
  const ADelegate: TProcMoez): TKeyPressEvent;
begin
  Result := TEventDispatcher.Create().Wire(ADelegate);
end;

procedure TEventDispatcher.OnNotifyEvent(Sender: TObject);
begin
  if Assigned(FDelegate) then
    FDelegate(Sender);
end;

procedure TEventDispatcher.OnKeyPressEvent(Sender: TObject; var Key: Char);
begin
  if Assigned(FDelegate1) then
    FDelegate1(Sender, Key);
end;

end.
