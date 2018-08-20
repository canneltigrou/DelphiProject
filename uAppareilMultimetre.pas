unit uAppareilMultimetre;

// ****************************************************************************
// Unit� "uAppareilMultimetre" pour la classe AppareilMultimetre.
// Descend de la classe Appareil.

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls, ExtCtrls, uAppareil;

//--------------------------D�claration de la classe AppareilMultimetre--------------------

type AppareilMultimetre = class(Appareil)

      private
      valRef : Double;

      public
        constructor Create();

        // Proc�dures

        //Fonctions
        Function Configurer(memo : TMemo):HRESULT;
        Function Traiter_donnee(resText : String):boolean;

        // Acces propri�t�s
        property valeurRef : Double read valRef write valRef ;
end;


implementation

constructor AppareilMultimetre.Create();
  begin
    Appareil.Create('TCPIP0::169.254.4.61::hislip0::INSTR', 'MEAS:VOLT:DC?');
    valRef := 0;
  end;


//------------------  Configure l'appareil de mesure ---------------------------
function AppareilMultimetre.Configurer(memo : TMemo):HRESULT;
  begin
    memo.Lines.Add('Pas de configuration requise pour cet appareil');
    result := S_OK;
  end;


// ----------------- Fonctions pour Traitement des mesures ---------------------

function StripNonAlphaNumeric(const AValue: string): string;
var
  I : Integer;
begin
Result := '';
  for I := 0 to AValue.Length do
  begin
    if AValue.Chars[I] in ['0'..'9', 'e', 'E', '-', '+'] then
      Result := Result + AValue.Chars[I]
  end;
end;

// a partir d'un string venant de la r�ponse de l'appareil, renvoie un double.
function ParseResultat(sResult: String) : Double;
var
  lFormatSettings:TFormatSettings;
begin
  sResult := StripNonAlphaNumeric(sResult);
  lFormatSettings.DecimalSeparator := '.';
  Result := StrToFloat(sResult, lFormatSettings);
end;

function AnnalyseResultat(resultat: Double; vRef: Double):Boolean;
// on veut comparer les r�sultats en microA. : tension / 500ohm * 1000000
// on compare � la colone 'Essais val_1' colonne 0 feuil8 sur Excel
var
  valRef : Double;
  valTmp : Double;
begin
  //valRef :=  30000;     // exemple. sera pris de la hashmap
  valRef := vRef;
  valTmp := (resultat / 500) * 1000000 ;
  //memo1.Lines.Add('val recu : ' + floattostr(valTmp));
  //memo1.Lines.Add('donne : ' + floattostr(valTmp));
  if(valTmp > valRef)
  then
    Result := False
  else
    Result := True

end;

// prend en parametre la r�ponse de l'appareil. Permet de traiter cette r�ponse.
// envoie True si la r�ponse est dans les normes. False sinon.
function AppareilMultimetre.Traiter_donnee(resText : string): boolean;
var
  resultatDouble : Double;
  tmp : Boolean;
begin
  resultatDouble := ParseResultat(resText);
  tmp := AnnalyseResultat(resultatDouble, valRef);
  result := tmp;
end;





end.
