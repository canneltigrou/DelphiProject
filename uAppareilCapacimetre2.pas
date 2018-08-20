unit uAppareilCapacimetre2;

// ****************************************************************************
// Unité "uAppareilCapacimetre2" pour la classe AppareilCapacimetre2.
// Descend de la classe Appareil.

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls, ExtCtrls, uAppareil;

//--------------------------Déclaration de la classe AppareilCapacimetre2--------------------

type AppareilCapacimetre2 = class(Appareil)

      private
      valRef : Double;

      public
        constructor Create();

        // Procédures

        //Fonctions
        Function Configurer(memo : TMemo):HRESULT;
        Function Traiter_donnee(resText : String):boolean;

        // Acces propriétés
        property valeurImpedance : Double read valRef write valRef ;
end;


implementation

constructor AppareilCapacimetre2.Create();
  begin
    Appareil(Self).Create('TCPIP0::169.254.221.61::inst0::INSTR', ':FETC?');
    valRef := 0;
  end;


//------------------  Configure l'appareil de mesure ---------------------------
function AppareilCapacimetre2.Configurer(memo : TMemo):HRESULT;
var
   hresultat : HRESULT;
begin
  hresultat := S_OK;
  memo.Lines.Add('Configuration de l''appareil :');
  try
    try
        io.WriteString(':FUNC:IMP ZTD', retCount); // Write to the instrument
        io.WriteString(':FREQ 10000', retCount); // Write to the instrument
        io.WriteString(':TRIG:SOUR BUS', retCount); // Write to the instrument
    except
        hresultat := S_FALSE;
    end;
  finally
    result := hresultat;

  end;
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

// a partir d'un string venant de la réponse de l'appareil, renvoie un double.
function ParseResultat(sResult: String) : Double;
var
  lFormatSettings:TFormatSettings;
begin
  sResult := StripNonAlphaNumeric(sResult);
  lFormatSettings.DecimalSeparator := '.';
  Result := StrToFloat(sResult, lFormatSettings);
end;

function AnnalyseResultat(resultat: Double; vRef: Double):Boolean;
// on veut comparer les résultats en microA. : tension / 500ohm * 1000000
// on compare à la colone 'Essais val_1' colonne 0 feuil8 sur Excel
var
  valRef : Double;
begin
  //valRef :=  30000;     // exemple. sera pris de la hashmap
  valRef := vRef;
  if(resultat / 500 * 1000000 > valRef)
  then
    Result := False
  else
    Result := True
end;

// prend en parametre la réponse de l'appareil. Permet de traiter cette réponse.
// envoie True si la réponse est dans les normes. False sinon.
function AppareilCapacimetre2.Traiter_donnee(resText : string): boolean;
var
  resultatDouble : Double;
  tmp : Boolean;
begin
  resultatDouble := ParseResultat(resText);
  tmp := AnnalyseResultat(resultatDouble, valRef);
  result := tmp;
end;





end.
