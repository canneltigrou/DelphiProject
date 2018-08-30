unit uAppareilCapacimetre2;

// ****************************************************************************
// Unité "uAppareilCapacimetre2" pour la classe AppareilCapacimetre2.
// Descend de la classe Appareil.

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls, ExtCtrls, uAppareil, uUtils, uLog;

//--------------------------Déclaration de la classe AppareilCapacimetre2--------------------
// Il s'agit ici d'un appareil Capacimetre de la technologie keysight
// et qui permettra de mesurer l'impedance.
// et de comparer le resultat a une valeur seuil.
// C'est une classe fille de Appareil, laquelle permet une connexion par ethernet.
type AppareilCapacimetre2 = class(Appareil)

      private
      valRef : Double;

      public
        constructor Create();

        // Procédures

        //Fonctions
        Function Configurer(memo : TMemo):HRESULT; override;
        Function Traiter_donnee(resText : String):TResultatsCapa2;

        // Acces propriétés
        property valeurImpedance : Double read valRef write valRef ;
end;


implementation

// Initialise cet appareil. Cet appareil doit etre un capacimetre de keysight
// avec une adresse paramétree comme ci dessous
// IP : 169.254.221.61
// identité :  TCPIP0::169.254.221.61::inst0::INSTR
constructor AppareilCapacimetre2.Create();
  begin
    // Rappel : Create(Adresse_de_l_appareil , Commande_instruction_pour_valeur)
    Appareil(Self).Create('TCPIP0::169.254.221.61::inst0::INSTR', ':FETC?');
    valRef := 0; // la valRef sera maj par l'IHM.
  end;


//------------------  Configure l'appareil de mesure ---------------------------

// Configure l'appareil de type capacimetre de Keysight
// pour recevoir une valeur d'impédance.
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
    except
        hresultat := S_FALSE;
    end;
  finally
    result := hresultat;

  end;
end;


// ----------------- Fonctions pour Traitement des mesures ---------------------

// ici, on reçoit 2 valeurs par l'appareil. On ne souhaite garder que la 1ere.
// Les valeurs sont exprimés de types +1.23456E-7 et sont séparées par des virgules.
function StripNonAlphaNumeric(const AValue: string): string;
var
  I : Integer;
  stop : boolean;
begin
  Result := '';
  stop := false;
  I := 0;
  while((I < AValue.Length) and (not stop)) do
    begin
      if AValue.Chars[I] in ['0'..'9', 'e', 'E', '-', '+', '.'] then
        Result := Result + AValue.Chars[I]
      else
        if AValue.Chars[I] = ',' then
          stop := true;
      inc(I, 1);
    end;
end;

// a partir d'un string venant de la réponse de l'appareil, renvoie un double.
// Les valeurs sont exprimés de types +1.23456E-7
function ParseResultat(sResult: String) : Double;
var
  lFormatSettings:TFormatSettings;
begin
  sResult := StripNonAlphaNumeric(sResult);
  lFormatSettings.DecimalSeparator := '.';
  Result := StrToFloat(sResult, lFormatSettings);
end;

// prend en parametre la réponse de l'appareil. Permet de traiter cette réponse.
// envoie True si la réponse est dans les normes. False sinon.
function AppareilCapacimetre2.Traiter_donnee(resText : string): TResultatsCapa2;
var
  resultatDouble : Double;
begin
  SetLength(Result.Annalyse, 2);
  resultatDouble := ParseResultat(resText);
  if(valRef > 0) then
      Result.Annalyse[0] := ((resultatDouble * 1000) < valRef)   // valRef est en milliOhm, le resultatDouble en Ohm
  else
      Result.Annalyse[0] := true;
  Result.Annalyse[1] := resultatDouble < 1000;
  Result.Valeur :=  resultatDouble;
  //monLog.Capacimetre2Resultat(result, resultatDouble);

end;

end.
