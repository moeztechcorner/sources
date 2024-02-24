program EnumerableSpring4D;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  System.Generics.Collections,
  Spring,
  Spring.Collections,
  uData in 'Src\uData.pas',
  uDataInterface in 'Src\uDataInterface.pas';

function RandomRangeF(Min, Max: Double): Double;
begin
  Result := RoundTo(Min + Random * (Max - Min), -2);
end;

var
  Selector1, Selector2: Func<IOrder, Double>;

begin
  try
    Randomize;
    var ListOrder1 := TList<IOrder>.Create;
    for var i:=1 to 15 do
      ListOrder1.Add(TOrder.Create(i, RandomRangeF(10, 100), RandomRangeF(10, 100)));

    WriteLn('Liste des commandes :');
    for var Order in ListOrder1 do
      WriteLn('Commande N°'+Order.Ref.ToString+' Montant = '+Order.Amount.ToString+ ' | Acompte = '+Order.Account.ToString);

    WriteLn('');
    WriteLn('Recherche classique :');
    var Max: Double := 0;
    for var Order in ListOrder1 do
      if Order.Amount>Max then
        Max := Order.Amount;
    Writeln('Le plus grand montant qui est égal à '+Max.ToString+' euros');

    Max := 0;
    for var Order in ListOrder1 do
      if Order.Account>Max then
        Max := Order.Account;
    Writeln('Le plus grand acompte qui est égal à '+Max.ToString+' euros');

    WriteLn('');
    WriteLn('IEnumarable Spring4D :');
    var ListOrder2: IList<IOrder> := TCollections.CreateList<IOrder>;
    for var Order in ListOrder1 do
      ListOrder2.Add(TOrder.Create(Order.Ref, Order.Amount, Order.Account));

    Selector1 := function(const param: IOrder): Double
    begin
      Result := param.Amount;
    end;

    Writeln('Le plus grand montant qui est égal à '+ListOrder2.Max(Selector1).ToString+' euros');

    Selector2 := function(const param: IOrder): Double
    begin
      Result := param.Account;
    end;

    Writeln('Le plus grand acompte qui est égal à '+ListOrder2.Max(Selector2).ToString+' euros');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
