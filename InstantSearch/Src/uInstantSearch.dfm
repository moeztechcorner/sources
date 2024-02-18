object FrmInstantSearch: TFrmInstantSearch
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Instant Search'
  ClientHeight = 361
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  TextHeight = 15
  object ListBox: TListBox
    Left = 8
    Top = 8
    Width = 241
    Height = 345
    ItemHeight = 15
    TabOrder = 0
  end
  object SearchBox: TSearchBox
    Left = 255
    Top = 8
    Width = 254
    Height = 23
    TabOrder = 1
    Text = 'Chercher dans les valeurs de votre liste ...'
    OnChange = SearchBoxChange
    OnEnter = SearchBoxEnter
    OnExit = SearchBoxExit
    OnKeyDown = SearchBoxKeyDown
    OnKeyUp = SearchBoxKeyUp
  end
  object ListBoxResultats: TListBox
    Left = 255
    Top = 46
    Width = 254
    Height = 40
    Style = lbOwnerDrawFixed
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 21
    ParentFont = False
    TabOrder = 2
    StyleElements = []
    OnDblClick = ListBoxResultatsDblClick
    OnKeyDown = ListBoxResultatsKeyDown
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 211
    Top = 16
    object cdsNum: TIntegerField
      FieldName = 'Num'
    end
    object cdsValue: TStringField
      FieldName = 'Value'
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnMessage = ApplicationEventsMessage
    Left = 441
    Top = 104
  end
end
