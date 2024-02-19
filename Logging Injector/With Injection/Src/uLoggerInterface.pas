unit uLoggerInterface;

interface

type
  ILogger = interface
    ['{4C052928-EB8C-4A34-8B72-79FE12D28692}']
    procedure Log(s: string);
  end;

  TAbstractLogger = class(TInterfacedObject, ILogger)
  public
    procedure Log(s: string); virtual; abstract;
  end;

implementation

end.
