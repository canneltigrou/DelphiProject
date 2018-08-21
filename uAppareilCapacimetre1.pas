unit uAppareilCapacimetre1;

// ****************************************************************************
// Unité "uAppareilCapacimetre1" pour la classe AppareilCapacimetre1.
// Descend de la classe Appareil.

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls, ExtCtrls, uAppareil;


  type
  TStringList = array of string;
  TDoubleList = array of Double;
  TBoolList = array of Boolean;

//--------------------------Déclaration de la classe AppareilCapacimetre1--------------------

type AppareilCapacimetre1 = class(Appareil)

      private
          CapaMin : Double;
          CapaMax : Double;
          tangente : Double;

      public
        constructor Create();

        // Procédures

        //Fonctions
        Function Configurer(memo : TMemo):HRESULT;
        Function Traiter_donnee(resText : String): TBoolList;

        // Acces propriétés
        property valeurCapaMin : Double read CapaMin write CapaMin ;
        property valeurCapaMax : Double read CapaMax write CapaMax ;
        property valeurTangente : Double read tangente write tangente ;
end;


implementation

constructor AppareilCapacimetre1.Create();
  begin
    Appareil(Self).Create('TCPIP0::169.254.227.5::inst0::INSTR', ':FETC?');
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
function StripNonAlphaNumeric(const AValue: string): TStringList;
var
  I, cpt : Integer;
  tmp : String;
begin
  SetLength(Result, 2);
  tmp := '';
  cpt := 0;
  for I := 0 to AValue.Length do
  begin
    if AValue.Chars[I] in ['0'..'9', 'e', 'E', '-', '+', '.'] then
      tmp := tmp + AValue.Chars[I]
    else
    if AValue.Chars[I] = ',' then
      begin
          if(cpt < 2) then
          begin
            Result[cpt] := tmp;
            tmp:= '';
          end;
          cpt := cpt + 1;
      end;
  end;
end;

// a partir d'un string venant de la réponse de l'appareil, renvoie un double.
function ParseResultat(sResult: string) : TDoubleList;
var
  lFormatSettings:TFormatSettings;
  tmpResult:TStringList;
begin
  lFormatSettings.DecimalSeparator := '.';
  SetLength(Result, 2);
  tmpResult := StripNonAlphaNumeric(sResult);
  Result[0] := StrToFloat(tmpResult[0], lFormatSettings);
  Result[1] := StrToFloat(tmpResult[1], lFormatSettings);
end;



// prend en parametre la réponse de l'appareil. Permet de traiter cette réponse.
// envoie True si la réponse est dans les normes. False sinon.
function AppareilCapacimetre1.Traiter_donnee(resText : string):TBoolList;
var
  resultatDouble : TDoubleList;
begin
  resultatDouble := ParseResultat(resText);
  SetLength(result, 3);
  result[0] := (resultatDouble[0] > CapaMin);
  result[1] := (resultatDouble[0] < CapaMax);
  result[2] := (resultatDouble[1] < tangente);
end;



end.
