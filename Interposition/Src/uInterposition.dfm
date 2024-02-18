object FrmInterposition: TFrmInterposition
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Interposition'
  ClientHeight = 125
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object EditData: TEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object BtnAddSomeData: TButton
    Left = 168
    Top = 23
    Width = 113
    Height = 25
    Caption = 'Add Some Data'
    TabOrder = 1
    OnClick = BtnAddSomeDataClick
  end
  object EditNoData: TEdit
    Left = 24
    Top = 64
    Width = 121
    Height = 23
    TabOrder = 2
  end
end
