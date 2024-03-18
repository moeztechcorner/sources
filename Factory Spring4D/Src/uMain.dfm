object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Factory classique contre un Factory du  Spring4D'
  ClientHeight = 262
  ClientWidth = 1273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object BitBtnClassicFactoryRedEdit: TBitBtn
    Left = 8
    Top = 10
    Width = 160
    Height = 25
    Caption = 'Classic Factory - TEdit Red'
    TabOrder = 0
    OnClick = BitBtnClassicFactoryRedEditClick
  end
  object BitBtnSpring4DFactoryRedEdit: TBitBtn
    Left = 8
    Top = 39
    Width = 160
    Height = 25
    Caption = 'Spring4D Factory TEdit Red'
    TabOrder = 1
    OnClick = BitBtnSpring4DFactoryRedEditClick
  end
  object BitBtnClassicFactoryBlueEdit: TBitBtn
    Left = 175
    Top = 10
    Width = 160
    Height = 25
    Caption = 'Classic Factory - TEdit Blue'
    TabOrder = 2
    OnClick = BitBtnClassicFactoryBlueEditClick
  end
  object BitBtnSpring4DFactoryBlueEdit: TBitBtn
    Left = 175
    Top = 39
    Width = 160
    Height = 25
    Caption = 'Spring4D Factory TEdit Blue'
    TabOrder = 3
    OnClick = BitBtnSpring4DFactoryBlueEditClick
  end
end
