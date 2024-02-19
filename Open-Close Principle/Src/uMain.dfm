object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Main'
  ClientHeight = 349
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object BaseForm1: TBitBtn
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'BaseForm1'
    TabOrder = 0
    OnClick = BaseForm1Click
  end
  object BaseForm2: TBitBtn
    Left = 8
    Top = 47
    Width = 75
    Height = 25
    Caption = 'BaseForm2'
    TabOrder = 1
    OnClick = BaseForm2Click
  end
  object BaseForm3: TBitBtn
    Left = 8
    Top = 78
    Width = 75
    Height = 25
    Caption = 'BaseForm3'
    TabOrder = 2
    OnClick = BaseForm3Click
  end
  object BaseForm4: TBitBtn
    Left = 8
    Top = 109
    Width = 75
    Height = 25
    Caption = 'BaseForm4'
    TabOrder = 3
    OnClick = BaseForm4Click
  end
end
