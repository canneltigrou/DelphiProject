unit uAppareilCapacimetre1;

// ****************************************************************************
// Unité "uAppareilCapacimetre1" pour la classe AppareilCapacimetre1.
// Descend de la classe Appareil.

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls, ExtCtrls, uAppareil;


//--------------------------Déclaration de la classe AppareilCapacimetre1--------------------
// Il s'agit ici d'un appareil Capacimetre de la technologie keysight
// et qui permettra de mesurer la capacité et la tangente
// et dee comparer les resultats a des valeurs seuils.
// C'est une classe fille de Appareil, laquelle permet une connexion par ethernet.
type AppareilCapacimetre1 = class(Appareil)

      private
          CapaMin : Double;
          CapaMax : Double;
          tangente : Double;
          CapaNominale : Double;

      public
        constructor Create();

        // Procédures

        //Fonctions
        Function Configurer(memo : TMemo):HRESULT; override;
        Function Traiter_donnee(resText : String): TBoolList;

        // Acces propriétés
        property valeurCapaMin : Double read CapaMin write CapaMin ;
        property valeurCapaMax : Double read CapaMax write CapaMax ;
        property valeurTangente : Double read tangente write tangente ;
        property valeurCapaNominale : Double read CapaNominale write CapaNominale ;
end;


implementation
// Initialise cet appareil. Cet appareil doit etre un capacimetre de keysight
// avec une adresse paramétree comme ci dessous
// IP : 169.254.227.5
// identité :  TCPIP0::169.254.227.5::inst0::INSTR
constructor AppareilCapacimetre1.Create();
  begin
    Appareil(Self).Create('TCPIP0::169.254.227.5::inst0::INSTR', ':FETC?');
    // les valeurs ci-dessous doivent etre maj par l'IHM.
    CapaMin := 0;
    CapaMax := 0;
    tangente := 0;
    CapaNominale := 0;
  end;


//------------------  Configure l'appareil de mesure ---------------------------
// Configure l'appareil de type capacimetre de Keysight
// pour recevoir une valeur de capacite une la tangente.
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
    except
        hresultat := S_FALSE;
    end;
  finally
    result := hresultat;

  end;
end;


// ----------------- Fonctions pour Traitement des mesures ---------------------
// ici, on reçoit 3 valeurs par l'appareil. On ne souhaite garder que les 2 premieres.
// Les valeurs sont exprimés de types +1.23456E-7 et sont séparées par des virgules.
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
// la tangenteReference etant en pourcentage et la reponse en taux, je *100 le taux
function AppareilCapacimetre1.Traiter_donnee(resText : string):TBoolList;
var
  resultatDouble : TDoubleList;
begin
  resultatDouble := ParseResultat(resText);
  SetLength(result, 3);
  result[0] := ((resultatDouble[0] * 1000000) > CapaMin);
  result[1] := ((resultatDouble[0] * 1000000) < CapaMax);
  result[2] := ((resultatDouble[1] * 100) < tangente);
  result[3] := ((resultatDouble[0] * 1000000) > (0.4 * CapaNominale));
end;



end.
