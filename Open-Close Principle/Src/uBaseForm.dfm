object BaseForm: TBaseForm
  Left = 0
  Top = 0
  Margins.Left = 20
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'BaseForm'
  ClientHeight = 257
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object TopPanel: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 421
    Height = 41
    Align = alTop
    TabOrder = 0
    object LabelTitle: TLabel
      AlignWithMargins = True
      Left = 21
      Top = 4
      Width = 34
      Height = 21
      Margins.Left = 20
      Align = alLeft
      Alignment = taCenter
      Caption = 'Title'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
  end
  object Container: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 421
    Height = 157
    Align = alClient
    TabOrder = 1
    object Edit1: TEdit
      Left = 16
      Top = 16
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 16
      Top = 45
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 16
      Top = 74
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object CheckBox1: TCheckBox
      Left = 160
      Top = 19
      Width = 81
      Height = 17
      Caption = 'CheckBox1'
      TabOrder = 3
    end
    object CheckBox2: TCheckBox
      Left = 160
      Top = 48
      Width = 81
      Height = 17
      Caption = 'CheckBox2'
      TabOrder = 4
    end
    object CheckBox3: TCheckBox
      Left = 160
      Top = 77
      Width = 81
      Height = 17
      Caption = 'CheckBox3'
      TabOrder = 5
    end
  end
  object BottomPanel: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 213
    Width = 421
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtnOk: TBitBtn
      AlignWithMargins = True
      Left = 346
      Top = 4
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object BitBtnCancel: TBitBtn
      AlignWithMargins = True
      Left = 265
      Top = 4
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
