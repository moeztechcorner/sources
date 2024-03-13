unit FrmBoutonLabelWeb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, htmlcomp, Vcl.ExtCtrls;

type
  TFormBoutonLabelWeb = class(TForm)
    PanelAffichageColonnes: TPanel;
    L_Accueil: THtLabel;
    L_Param: THtLabel;
    L_Donnees: THtLabel;
    L_APropos: THtLabel;
    procedure FormCreate(Sender: TObject);
    procedure L_ParamClick(Sender: TObject);
    procedure L_DonneesClick(Sender: TObject);
    procedure L_AProposClick(Sender: TObject);
    procedure L_AccueilClick(Sender: TObject);
  private
  public
  end;

var
  FormBoutonLabelWeb: TFormBoutonLabelWeb;

implementation

{$R *.dfm}

Const
  Html = '<!DOCTYPE html>'
        +'<html lang="fr">'
        +'<head>'
        +'<meta charset="UTF-8">'
        +'<meta name="viewport" content="width=device-width, initial-scale=1.0">'
        +'<style>'
        +'  body {'
        +'    font-family: Arial, sans-serif;'
        +'    text-align: center;'
        +'  }'
        +'  .Custom-Color {'
        +'    color: %s;'
        +'    %s;'
        +'  }'
        +'</style>'
        +'</head>'
        +'<body>'
        +'	<span class="Custom-Color">%s</span>'
        +'  </body>'
        +'</html>';

  AttributUnderline = 'text-decoration: underline';
  ColorActiveText   = '#0178D6';
  ColorInactiveText = '#333333';
  CaptionAccueil    = 'Accueil';
  CaptionParam      = 'Paramétrage';
  CaptionDonnees    = 'Gestion des données';
  CaptionAPropos    = 'A propos';

procedure TFormBoutonLabelWeb.FormCreate(Sender: TObject);
begin
  L_Accueil.Caption := Format(Html, [ColorActiveText, AttributUnderline, CaptionAccueil]);
  L_Param.Caption   := Format(Html, [ColorInactiveText, EmptyStr, CaptionParam]);
  L_Donnees.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionDonnees]);
  L_APropos.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionAPropos]);
end;

procedure TFormBoutonLabelWeb.L_AccueilClick(Sender: TObject);
begin
  L_Accueil.Caption := Format(Html, [ColorActiveText, AttributUnderline, CaptionAccueil]);
  L_Param.Caption   := Format(Html, [ColorInactiveText, EmptyStr, CaptionParam]);
  L_Donnees.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionDonnees]);
  L_APropos.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionAPropos]);
end;

procedure TFormBoutonLabelWeb.L_ParamClick(Sender: TObject);
begin
  L_Accueil.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionAccueil]);
  L_Param.Caption   := Format(Html, [ColorActiveText, AttributUnderline, CaptionParam]);
  L_Donnees.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionDonnees]);
  L_APropos.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionAPropos]);
end;

procedure TFormBoutonLabelWeb.L_DonneesClick(Sender: TObject);
begin
  L_Accueil.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionAccueil]);
  L_Param.Caption   := Format(Html, [ColorInactiveText, EmptyStr, CaptionParam]);
  L_Donnees.Caption := Format(Html, [ColorActiveText, AttributUnderline, CaptionDonnees]);
  L_APropos.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionAPropos]);
end;

procedure TFormBoutonLabelWeb.L_AProposClick(Sender: TObject);
begin
  L_Accueil.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionAccueil]);
  L_Param.Caption   := Format(Html, [ColorInactiveText, EmptyStr, CaptionParam]);
  L_Donnees.Caption := Format(Html, [ColorInactiveText, EmptyStr, CaptionDonnees]);
  L_APropos.Caption := Format(Html, [ColorActiveText, AttributUnderline, CaptionAPropos]);
end;

end.
