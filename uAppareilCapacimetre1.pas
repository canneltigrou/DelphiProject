unit uAppareilCapacimetre1;

// ****************************************************************************
// Unité "uAppareilCapacimetre1" pour la classe AppareilCapacimetre1.
// Descend de la classe Appareil.

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls, ExtCtrls, uAppareil, uUtils, uLog;

type TMesure = (Tangente, ESR);

//--------------------------Déclaration de la classe AppareilCapacimetre1--------------------
// Il s'agit ici d'un appareil Capacimetre de la technologie keysight
// et qui permettra de mesurer la capacité et la tangente ou ESR
// et dee comparer les resultats a des valeurs seuils.
// C'est une classe fille de Appareil, laquelle permet une connexion par ethernet.
type AppareilCapacimetre1 = class(Appareil)

      private
          CapaMin : Double;
          CapaMax : Double;
          tangente : Double;
          CapaNominale : Double;
          typeMesure : TMesure;


      public
        constructor Create();

        // Procédures

        //Fonctions
        Function Configurer(memo : TMemo):HRESULT; override;
        Function ConfigurerTangente(memo : TMemo):HRESULT;
        Function ConfigurerESR(memo : TMemo):HRESULT;
        Function Traiter_donnee(resText : String): TResultats;

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
// par défaut pour recevoir une capacité et une tangente.
function AppareilCapacimetre1.Configurer(memo : TMemo):HRESULT;
begin
    Result := ConfigurerTangente(memo)
end;

// Configure l'appareil de type capacimetre de Keysight
// pour recevoir une valeur de capacite et une la TANGENTE.
function AppareilCapacimetre1.ConfigurerTangente(memo : TMemo):HRESULT;
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
    typeMesure := TMesure.Tangente;

  end;
end;

function AppareilCapacimetre1.ConfigurerESR(memo : TMemo):HRESULT;
var
   hresultat : HRESULT;
begin
  hresultat := S_OK;
  memo.Lines.Add('Configuration de l''appareil :');
  try
    try
        io.WriteString(':FUNC:IMP RSD', retCount); // Write to the instrument
        io.WriteString(':FREQ 100', retCount); // Write to the instrument
    except
        hresultat := S_FALSE;
    end;
  finally
    result := hresultat;
    typeMesure := TMesure.ESR;
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
function AppareilCapacimetre1.Traiter_donnee(resText : string):TResultats;
var
  resultatDouble : TDoubleList;
begin
  resultatDouble := ParseResultat(resText);
  SetLength(Result.Annalyse, 3);
  Result.Annalyse[0] := ((resultatDouble[0] * 1000000) > CapaMin);
  Result.Annalyse[1] := ((resultatDouble[0] * 1000000) < CapaMax);
  Result.Annalyse[3] := ((resultatDouble[0] * 1000000) > (0.4 * CapaNominale));

  if(typeMesure = TMesure.Tangente) then
      Result.Annalyse[2] := ((resultatDouble[1] * 100) < tangente)
  else
      Result.Annalyse[2] := ((resultatDouble[1] * 1000) < tangente); // Ici cas de l'ESR


  Result.Valeur := resultatDouble;
  //monLog.Capacimetre1Resultat(result, resultatDouble);
end;



end.
