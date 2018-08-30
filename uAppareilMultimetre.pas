unit uAppareilMultimetre;

// ****************************************************************************
// Unité "uAppareilMultimetre" pour la classe AppareilMultimetre.
// Descend de la classe Appareil.

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls, ExtCtrls, uAppareil, uLog, uUtils;

//--------------------------Déclaration de la classe AppareilMultimetre--------------------
// Il s'agit ici d'un appareil Multimetre de la technologie keysight
// et qui permettra de mesurer le voltage.
// et de comparer le resultat a une valeur seuil.
// C'est une classe fille de Appareil, laquelle permet une connexion par ethernet.
type AppareilMultimetre = class(Appareil)

      private
      valRef : Double;

      public
        constructor Create();

        // Procédures

        //Fonctions
        Function Configurer(memo : TMemo):HRESULT;
        Function Traiter_donnee(resText : String):TResultat;

        // Acces propriétés
        property valeurRef : Double read valRef write valRef ;
end;


implementation
// Initialise cet appareil. Cet appareil doit etre un multimetre de keysight
// avec une adresse paramétree comme ci dessous
// IP : 169.254.4.61
// identité :  TCPIP0::169.254.4.61::hislip0::INSTR
constructor AppareilMultimetre.Create();
  begin
    // Rappel : Create(Adresse_de_l_appareil , Commande_instruction_pour_valeur)
    Appareil(Self).Create('TCPIP0::169.254.4.61::hislip0::INSTR', 'MEAS:VOLT:DC?');
    valRef := 0;    // la valRef sera maj par l'IHM.
  end;


//------------------  Configure l'appareil de mesure ---------------------------
// Configure l'appareil de type multimetre de Keysight
// pour recevoir une valeur de voltage.
function AppareilMultimetre.Configurer(memo : TMemo):HRESULT;
  begin
    memo.Lines.Add('Pas de configuration requise pour cet appareil');
    result := S_OK;
  end;


// ----------------- Fonctions pour Traitement des mesures ---------------------
// Les valeurs sont exprimés de types +1.23456E-7
// mais comportent d'autres caracteres comme des retours a la ligne
function StripNonAlphaNumeric(const AValue: string): string;
var
  I : Integer;
begin
Result := '';
  for I := 0 to AValue.Length do
  begin
    if AValue.Chars[I] in ['0'..'9', 'e', 'E', '-', '+', '.', ','] then
      Result := Result + AValue.Chars[I]
  end;
end;

// a partir d'un string venant de la réponse de l'appareil, renvoie un double.
function ParseResultat(sResult: String) : Double;
var
  lFormatSettings:TFormatSettings;
begin
  sResult := StripNonAlphaNumeric(sResult);
  lFormatSettings.DecimalSeparator := '.';
  Result := StrToFloat(sResult, lFormatSettings);
end;

// on veut comparer les résultats en microA. : tension / 500ohm * 1000000
// on compare à la colone 'Essais val_1' colonne 0 feuil8 sur Excel
// cette valeur seil doit avoir ete mise a jour par l'ihm.
function AnnalyseResultat(resultat: Double; vRef: Double):Boolean;
var
  valTmp : Double;
begin
  valTmp := (resultat / 500) * 1000000 ;
  Result := (valTmp < vRef)  ;
end;

// prend en parametre la réponse de l'appareil. Permet de traiter cette réponse.
// envoie True si la réponse est dans les normes. False sinon.
function AppareilMultimetre.Traiter_donnee(resText : string): TResultat;
var
  resultatDouble : Double;
begin
  resultatDouble := ParseResultat(resText);
  Result.Annalyse := AnnalyseResultat(resultatDouble, valRef);
  Result.Valeur := resultatDouble;
  //monLog.MultimetreResultat(result, resultatDouble);
end;

end.
