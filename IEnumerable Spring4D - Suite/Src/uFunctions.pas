unit uFunctions;

interface

procedure Launch();

implementation

uses System.SysUtils,
     System.Math,
     Spring,
     Spring.Collections,
     uData,
     uDataInterface;

Type
  TCities = Array of String;

function RandomRangeF(Min, Max: Double): Double;
begin
  Result := RoundTo(Min + Random * (Max - Min), -2);
end;

function CreateList(): IList<IOrder>;
begin
  Randomize;
  var Cities: TCities := ['Paris', 'Lyon', 'Marseille', 'Bordeaux', 'Lille', 'Montpellier'];
  Result := TCollections.CreateList<IOrder>;
  for var i:=1 to 15 do
    Result.Add(TOrder.Create(i, RandomRangeF(10, 100), RandomRangeF(5, 10), Cities[Random(5)]));
end;

procedure DisplayList(const AList: IList<IOrder>);
begin
  AList.ForEach(
  procedure(const Order: IOrder)
  begin
    WriteLn('Commande N°' + Format('%.*d', [2, Order.Ref]) + ' Montant = ' + Format('%0.2f', [Order.Amount]) +
      ' | Acompte = ' + Format('%0.2f', [Order.Account]) +
      ' | Ville = ' + Order.City);
  end
  );
  WriteLn('');
end;

procedure ShowOrdersHavingCriteria(const AList: IList<IOrder>;
  ACriteria: Predicate<IOrder>; const AProcShow: Action<IOrder>);
begin
  AList.Where(ACriteria).ForEach(AProcShow);
end;

procedure Launch();
Begin
  var ListOrder := CreateList();

  DisplayList(ListOrder);

  var Selector: Func<IOrder, Double> := function(const Order: IOrder): Double
                                        begin
                                          Result := Order.Amount;
                                        end;

  var Displayer: Action<IOrder> := procedure(const Order: IOrder)
                                   begin
                                     Writeln('Commande N°'+Format('%.*d', [2, Order.Ref]));
                                   end;

  Writeln('Commandes ayant le montant min : ');
  var Criteria: Predicate<IOrder> := function(const Order: IOrder): Boolean
                                     begin
                                       Result := Order.Amount=ListOrder.Min(Selector);
                                     end;
  ShowOrdersHavingCriteria(ListOrder, Criteria, Displayer);
  WriteLn('');

  Writeln('Commandes ayant le montant max : ');
  Criteria := function(const Order: IOrder): Boolean
              begin
                Result := Order.Amount=ListOrder.Max(Selector);
              end;
  ShowOrdersHavingCriteria(ListOrder, Criteria, Displayer);
  WriteLn('');

  Writeln('Commandes ayant l''acompte min : ');
  ShowOrdersHavingCriteria(ListOrder,
                           function(const Order: IOrder): Boolean
                           begin
                             Result := Order.Account=ListOrder.Min(function(const Order: IOrder): Double
                                                                   begin
                                                                     Result := Order.Account;
                                                                   end);
                           end,
                           Displayer);
  WriteLn('');

  Writeln('Commandes ayant l''acompte max : ');
  ShowOrdersHavingCriteria(ListOrder,
                           function(const Order: IOrder): Boolean
                           begin
                             Result := Order.Account=ListOrder.Max(function(const Order: IOrder): Double
                                                                   begin
                                                                     Result := Order.Account;
                                                                   end);
                           end,
                           Displayer);
  WriteLn('');

  var AverageAmount := ListOrder.Average(function (const Order: IOrder): Double
                                         begin
                                           Result := Order.Amount;
                                         end);
  Writeln('Moyenne des montants = '+Format('%0.2f', [RoundTo(AverageAmount, -2)]));
  WriteLn('');

  var SumAccount := ListOrder.Sum(
    function (const Order: IOrder): Double
    begin
      Result := Order.Account;
    end
  );
  Writeln('Somme des acomptes = '+Format('%0.2f', [RoundTo(SumAccount, -2)]));
  WriteLn('');

  ListOrder.Clear;
  ListOrder.Add(TOrder.Create(16, 100, 50, 'Lyon'));
  ListOrder.Add(TOrder.Create(17, 200, 150, 'Lyon'));
  ListOrder.Add(TOrder.Create(18, 100, 50, 'Lyon'));
  ListOrder.Add(TOrder.Create(19, 200, 150, 'Lille'));
  ListOrder.Add(TOrder.Create(20, 100, 50, 'Paris'));
  ListOrder.Add(TOrder.Create(21, 200, 150, 'Strasbourg'));

  WriteLn('Commandes de la ville de Lyon = ');
  ListOrder.TakeWhile(
    function(const Order: IOrder): Boolean
    begin
      Result := Order.City='Lyon';
    end
  ).ForEach(
    procedure(const Order: IOrder)
    begin
      Writeln('Commande N°'+Format('%.*d', [2, Order.Ref]));
    end
  );
  WriteLn('');

End;

end.
