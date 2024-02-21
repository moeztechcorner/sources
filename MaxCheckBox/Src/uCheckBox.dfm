object FrmCheckBox: TFrmCheckBox
  Left = 0
  Top = 0
  Caption = 'FrmCheckBox'
  ClientHeight = 196
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object CheckListEdit: TCheckListEdit
    Left = 264
    Top = 37
    Width = 250
    Height = 23
    TabOrder = 0
    AutoDropWidthSize = False
    DropWidth = 250
    DropFont.Charset = DEFAULT_CHARSET
    DropFont.Color = clWindowText
    DropFont.Height = -12
    DropFont.Name = 'Segoe UI'
    DropFont.Style = []
    EditorEnabled = False
    Items.Strings = (
      'CheckBox 1'
      'CheckBox 2'
      'CheckBox 3'
      'CheckBox 4'
      'CheckBox 5'
      'CheckBox 6'
      'CheckBox 7'
      'CheckBox 8'
      'CheckBox 9'
      'CheckBox 10')
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -12
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    TextDelimiter = ';'
    TextEndChar = ''
    TextStartChar = ''
    OnClickCheck = CheckListEditClickCheck
    Version = '1.4.4.7'
  end
  object CheckListBox: TCheckListBox
    Left = 8
    Top = 8
    Width = 250
    Height = 177
    ItemHeight = 17
    Items.Strings = (
      'CheckBox 1'
      'CheckBox 2'
      'CheckBox 3'
      'CheckBox 4'
      'CheckBox 5'
      'CheckBox 6'
      'CheckBox 7'
      'CheckBox 8'
      'CheckBox 9'
      'CheckBox 10')
    ScrollWidth = 10
    TabOrder = 1
    OnClickCheck = CheckListBoxClickCheck
  end
  object cxCheckComboBox: TcxCheckComboBox
    Left = 264
    Top = 8
    Properties.EmptySelectionText = '(Pas de s'#233'lection)'
    Properties.Items = <
      item
        Description = 'CheckBox 1'
      end
      item
        Description = 'CheckBox 2'
      end
      item
        Description = 'CheckBox 3'
      end
      item
        Description = 'CheckBox 4'
      end
      item
        Description = 'CheckBox 5'
      end
      item
        Description = 'CheckBox 6'
      end
      item
        Description = 'CheckBox 7'
      end
      item
        Description = 'CheckBox 8'
      end
      item
        Description = 'CheckBox 9'
      end
      item
        Description = 'CheckBox 10'
      end>
    Properties.OnClickCheck = cxCheckComboBox1PropertiesClickCheck
    TabOrder = 2
    Width = 249
  end
end
