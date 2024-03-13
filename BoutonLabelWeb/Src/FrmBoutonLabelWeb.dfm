object FormBoutonLabelWeb: TFormBoutonLabelWeb
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Bouton Label Web'
  ClientHeight = 315
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PanelAffichageColonnes: TPanel
    Left = 0
    Top = 0
    Width = 483
    Height = 40
    Align = alTop
    ShowCaption = False
    TabOrder = 0
    object L_Accueil: THtLabel
      AlignWithMargins = True
      Left = 11
      Top = 9
      Width = 51
      Height = 23
      Margins.Left = 10
      Margins.Top = 8
      Margins.Bottom = 7
      Align = alLeft
      AutoSize = False
      Caption = 'Accueil'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      OnClick = L_AccueilClick
    end
    object L_Param: THtLabel
      AlignWithMargins = True
      Left = 75
      Top = 9
      Width = 92
      Height = 23
      Margins.Left = 10
      Margins.Top = 8
      Margins.Bottom = 7
      Align = alLeft
      AutoSize = False
      Caption = 'Param'#233'trage'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      OnClick = L_ParamClick
    end
    object L_Donnees: THtLabel
      AlignWithMargins = True
      Left = 180
      Top = 9
      Width = 149
      Height = 23
      Margins.Left = 10
      Margins.Top = 8
      Margins.Bottom = 7
      Align = alLeft
      AutoSize = False
      Caption = 'Gestion des donn'#233'es'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      OnClick = L_DonneesClick
    end
    object L_APropos: THtLabel
      AlignWithMargins = True
      Left = 342
      Top = 9
      Width = 65
      Height = 23
      Margins.Left = 10
      Margins.Top = 8
      Margins.Bottom = 7
      Align = alLeft
      AutoSize = False
      Caption = 'A propos'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      OnClick = L_AProposClick
    end
  end
end
