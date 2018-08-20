unit uAppareilCapacimetre1;

// ****************************************************************************
// Unit� "uAppareilCapacimetre1" pour la classe AppareilCapacimetre1.
// Descend de la classe Appareil.

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls, ExtCtrls, uAppareil;

//--------------------------D�claration de la classe AppareilCapacimetre1--------------------

type AppareilCapacimetre1 = class(Appareil)

      private
          CapaMin : Double;
          CapaMax : Double;
          tangente : Double;

      public
        constructor Create();

        // Proc�dures

        //Fonctions
        Function Configurer(memo : TMemo):HRESULT;
        Function Traiter_donnee(resText : String): TList;
        function AnnalyseResultatCapaMin(resultat: Double):Boolean;
        function AnnalyseResultatCapaMax(resultat: Double):Boolean;
        function AnnalyseResultatCapaTangente(resultat: Double):Boolean;


        // Acces propri�t�s
        property valeurCapaMin : Double read CapaMin write CapaMin ;
        property valeurCapaMax : Double read CapaMax write CapaMax ;
        property valeurTangente : Double read tangente write tangente ;
end;


implementation

constructor AppareilCapacimetre1.Create();
  begin
    Appareil.Create('TCPIP0::169.254.227.5::inst0::INSTR', ':FETC?');
    capaMin := 0;
    capaMax := 0;
    tangente := 0;
  end;


//------------------  Configure l'appareil de mesure ---------------------------
function AppareilCapacimetre1.Configurer(memo : TMemo):HRESULT;
var
   hresultat : HRESULT;
begin
  hresultat := S_OK;
  memo.Lines.Add('Configuration de l''appareil :');
  try
    try
        io.WriteString(':FUNC:IMP CSD', retCount); // Write to the instrument
        io.WriteString(':FREQ 100', retCount); // Write to the instrument
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

// a partir d'un string venant de la r�ponse de l'appareil, renvoie un double.
function ParseResultat(sResult: String) : Double;
var
  lFormatSettings:TFormatSettings;
begin
  sResult := StripNonAlphaNumeric(sResult);
  lFormatSettings.DecimalSeparator := '.';
  Result := StrToFloat(sResult, lFormatSettings);
end;

function AppareilCapacimetre1.AnnalyseResultatCapaMin(resultat: Double):Boolean;
begin
  if(resultat > CapaMin)
  then
    Result := False
  else
    Result := True
end;


function AnnalyseResultat(resultat: Double):Boolean;
var
  valRef : Double;
begin
  valRef := vRef;
  if(resultat / 500 * 1000000 > valRef)
  then
    Result := False
  else
    Result := True
end;

function AnnalyseResultat(resultat: Double; vRef: Double):Boolean;
var
  valRef : Double;
begin
  valRef := vRef;
  if(resultat / 500 * 1000000 > valRef)
  then
    Result := False
  else
    Result := True
end;







// prend en parametre la r�ponse de l'appareil. Permet de traiter cette r�ponse.
// envoie True si la r�ponse est dans les normes. False sinon.
function AppareilCapacimetre1.Traiter_donnee(resText : string):TList;
var
  resultatDouble : Double;
  resList : Array[1..3] of boolean;
begin
  resList := Tlist<Integer>.Create;

  resultatDouble := ParseResultat(resText);
  tmp := AnnalyseResultat(resultatDouble, valRef);
  result := tmp;
end;





end.
