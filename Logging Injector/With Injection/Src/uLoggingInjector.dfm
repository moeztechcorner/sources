object FrmLogging: TFrmLogging
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Logging'
  ClientHeight = 299
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object mLogs: TMemo
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 433
    Height = 225
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Align = alTop
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnDoBusinessThings: TBitBtn
    Left = 10
    Top = 241
    Width = 111
    Height = 25
    Caption = 'Traitement m'#233'tier'
    TabOrder = 1
    OnClick = btnDoBusinessThingsClick
  end
end
