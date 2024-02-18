object FrmObservsers: TFrmObservsers
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Observers'
  ClientHeight = 338
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Valider: TBitBtn
    Left = 214
    Top = 305
    Width = 75
    Height = 25
    Caption = 'Valider'
    TabOrder = 0
    OnClick = ValiderClick
  end
  object Annuler: TBitBtn
    Left = 133
    Top = 305
    Width = 75
    Height = 25
    Caption = 'Annuler'
    TabOrder = 1
    OnClick = AnnulerClick
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 16
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 24
    Top = 39
    Width = 97
    Height = 17
    Caption = 'CheckBox2'
    TabOrder = 3
  end
  object CheckBox3: TCheckBox
    Left = 24
    Top = 62
    Width = 97
    Height = 17
    Caption = 'CheckBox3'
    TabOrder = 4
  end
  object CheckBox4: TCheckBox
    Left = 24
    Top = 85
    Width = 97
    Height = 17
    Caption = 'CheckBox4'
    TabOrder = 5
  end
  object CheckBox5: TCheckBox
    Left = 24
    Top = 108
    Width = 97
    Height = 17
    Caption = 'CheckBox5'
    TabOrder = 6
  end
  object CheckBox6: TCheckBox
    Left = 24
    Top = 131
    Width = 97
    Height = 17
    Caption = 'CheckBox6'
    TabOrder = 7
  end
  object CheckBox7: TCheckBox
    Left = 24
    Top = 154
    Width = 97
    Height = 17
    Caption = 'CheckBox7'
    TabOrder = 8
  end
  object CheckBox8: TCheckBox
    Left = 24
    Top = 177
    Width = 97
    Height = 17
    Caption = 'CheckBox8'
    TabOrder = 9
  end
  object CheckBox9: TCheckBox
    Left = 24
    Top = 200
    Width = 97
    Height = 17
    Caption = 'CheckBox9'
    TabOrder = 10
  end
  object CheckBox10: TCheckBox
    Left = 24
    Top = 223
    Width = 97
    Height = 17
    Caption = 'CheckBox10'
    TabOrder = 11
  end
  object Edit1: TEdit
    Left = 168
    Top = 13
    Width = 121
    Height = 23
    TabOrder = 12
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 168
    Top = 42
    Width = 121
    Height = 23
    TabOrder = 13
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 168
    Top = 71
    Width = 121
    Height = 23
    TabOrder = 14
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 168
    Top = 100
    Width = 121
    Height = 23
    TabOrder = 15
    Text = 'Edit4'
  end
  object Edit5: TEdit
    Left = 168
    Top = 129
    Width = 121
    Height = 23
    TabOrder = 16
    Text = 'Edit5'
  end
  object Edit6: TEdit
    Left = 168
    Top = 158
    Width = 121
    Height = 23
    TabOrder = 17
    Text = 'Edit6'
  end
  object Edit7: TEdit
    Left = 168
    Top = 187
    Width = 121
    Height = 23
    TabOrder = 18
    Text = 'Edit7'
  end
  object Edit8: TEdit
    Left = 168
    Top = 216
    Width = 121
    Height = 23
    TabOrder = 19
    Text = 'Edit8'
  end
  object Edit9: TEdit
    Left = 168
    Top = 245
    Width = 121
    Height = 23
    TabOrder = 20
    Text = 'Edit9'
  end
  object Edit10: TEdit
    Left = 168
    Top = 274
    Width = 121
    Height = 23
    TabOrder = 21
    Text = 'Edit10'
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 59
    Top = 280
    object cdsComposant: TStringField
      FieldName = 'Composant'
      Size = 255
    end
    object cdsValeurChaine: TStringField
      FieldName = 'ValeurChaine'
      Size = 255
    end
    object cdsValeurBoolean: TBooleanField
      FieldName = 'ValeurBoolean'
    end
  end
end
