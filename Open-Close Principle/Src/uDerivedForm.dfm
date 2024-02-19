inherited DerivedForm: TDerivedForm
  Caption = 'DerivedForm'
  ClientWidth = 427
  TextHeight = 15
  inherited TopPanel: TPanel
    Width = 421
    inherited LabelTitle: TLabel
      Height = 36
    end
  end
  inherited Container: TPanel
    Width = 421
    object Memo: TMemo
      Left = 257
      Top = 16
      Width = 150
      Height = 129
      Lines.Strings = (
        '')
      TabOrder = 6
    end
  end
  inherited BottomPanel: TPanel
    Width = 421
    inherited BitBtnOk: TBitBtn
      Left = 342
    end
    inherited BitBtnCancel: TBitBtn
      Left = 261
    end
  end
end
