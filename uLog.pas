unit uLog;

// ****************************************************************************
// Unité "uLog.pas" de la classe Log,
// Elle permet d'effectuer les differents compteurs,
// De logguer au cours du temps dans un fichier
// Et enfin de ressortir un pdf complet en fin de production.

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls, ComObj, System.Variants,
  Menus, ExtCtrls, DateUtils, uUtils;

//--------------------------Déclaration de la classe Appareil--------------------

type Log = class
      private
          // les compteurs :
          cc : Integer; // Courant de fuite
          courantFuite : Integer;
          impedance : Integer;
          capaMin : Integer;
          capaMax : Integer;
          tangente : Integer;
          nombreOK : Integer;

          // les résultats des calculs
          currentMultimetre : bool;
          currentCapa1 : TBoolList;
          currentCapa2 : TBoolList;
          currentCC : bool;

          // fichier
          fileName : string;
          logFile1 : TextFile;
          logFile2 : TextFile;

          // valeurs des mesures
          valeurVoltage : Double;
          valeurCapacite : Double;
          valeurTangente : Double;
          valeurImpedance : Double;

          // procedures
          procedure ChargerDansFichier();

      public

          constructor Create();

          // Procédures
          procedure ChangementComposants();
          procedure MultimetreResultat(res : bool ; resValue : Double);
          procedure Capacimetre1Resultat(res : TBoolList ; resValues : TDoubleList);
          procedure Capacimetre2Resultat(res : TBoolList ; resValue : Double);
          procedure AjoutCC();

          // Acces propriétés
          property vVoltage : Double read valeurVoltage write valeurVoltage ;
          property vCapacite : Double read valeurCapacite write valeurCapacite;
          property vTangente : Double read valeurTangente write valeurTangente;
          property vImpedance : Double read valeurImpedance write valeurImpedance;

          property nbCC : integer read cc;
          property nbCourantFuite : integer read courantFuite;
          property nbCapaMin : integer read capaMin;
          property nbCapaMax : integer read capaMax;
          property nbImpedance : integer read impedance;
          property nbOK :  integer read nombreOK;

end;


implementation

constructor Log.Create();
var
    myDate : TDateTime;
    myHour, myMin, mySec, myMilli : Word;
    Stg : string;
begin
   cc := 0; // Courant de fuite
   courantFuite := 0;
   impedance := 0;
   capaMin := 0;
   capaMax := 0;
   tangente := 0;
   nombreOK := 0;


    // creons tout d'abord le fichier qui nos servira.
    myDate := Now;
    DecodeTime(myDate, myHour, myMin, mySec, myMilli);
    fileName := FormatDateTime('dddddd', myDate) + '_' + myHour.ToString + myMin.ToString + mySec.ToString;

    AssignFile(logFile1,ExtractFilePath(Application.ExeName)+'Choix_' + fileName + '.txt');
    AssignFile(logFile2,ExtractFilePath(Application.ExeName)+'Mesures_' + fileName + '.txt');

    //Effacer le fichier et ecrire
    Stg:='Courant_de_fuite' + #9 + 'Capacite(-)' + #9 + 'Capacite(+)' + #9 + 'Tangente' + #9 + 'Capacite_trop_faible' + #9 + 'Impedance' + #9 + 'Absence_composant'; //Recupere dans la variable Stg le contenu de Edit1
    //AssignFile(logFile1,ExtractFilePath(Application.ExeName)+'test.txt');
    Rewrite(logFile1); //Crée puis ouvre un nouveau fichier
    Writeln(logFile1,Stg); //Writeln place une marque en fin de ligne
    CloseFile(logFile1);

    //Effacer le fichier et ecrire
    Stg:='Voltage' + #9 + 'Capacite' + #9 + 'Tangente' + #9 + 'Impedance'; //Recupere dans la variable Stg le contenu de Edit1
    //AssignFile(logFile1,ExtractFilePath(Application.ExeName)+'test.txt');
    Rewrite(logFile2); //Crée puis ouvre un nouveau fichier
    Writeln(logFile2,Stg); //Writeln place une marque en fin de ligne
    CloseFile(logFile2);
end;

//--------------- Ecriture dans fichier ----------------------
// log dans un fichier de sortie les differents resultats obtenus.
procedure Log.ChargerDansFichier();
var stg : String;
begin
    AssignFile(logFile1,ExtractFilePath(Application.ExeName)+'Choix_' + fileName + '.txt');
    AssignFile(logFile2,ExtractFilePath(Application.ExeName)+'Mesures_' + fileName + '.txt');

    stg := currentMultimetre.toString + #9 + currentCapa1[0].toString + #9 +
            currentCapa1[1].toString + #9 + currentCapa1[2].toString + #9 +
            currentCapa1[3].toString + #9 +
            currentCapa2[0].toString + #9 + currentCapa2[1].toString;

    Append(logFile1); //Prépare un fichier existant pour l'ajout de texte
    Writeln(logFile1,Stg); //Writeln écrit une marque fin de ligne
    CloseFile(logFile1);

    stg := valeurVoltage.toString + #9 + valeurCapacite.toString + #9 +
            valeurTangente.toString + #9 + valeurImpedance.toString;
    Append(logFile2); //Prépare un fichier existant pour l'ajout de texte
    Writeln(logFile2,Stg); //Writeln écrit une marque fin de ligne
    CloseFile(logFile2);
end;

//--------------- Changement de composant ----------------------
// Demnde l'écriture dans un fichier.
procedure Log.ChangementComposants();
begin
    ChargerDansFichier();
end;

procedure Log.MultimetreResultat(res : bool; resValue : Double);
begin
    currentMultimetre := res;
    valeurVoltage := resValue;
    if(not res) then
        Inc(courantFuite, 1);
end;

procedure Log.Capacimetre1Resultat(res : TBoolList; resValues : TDoubleList);
begin
    currentCapa1 := res;
    valeurCapacite := resValues[0];
    valeurTangente := resValues[1];
    if(not res[0]) then
        Inc(capaMin, 1);
    if(not res[1]) then
        Inc(capaMax, 1);
    if(not res[2]) then
        Inc(tangente, 1);

    if(res[0] and res[1] and res[2]) then
        Inc(nombreOK, 1);

end;
procedure Log.Capacimetre2Resultat(res : TBoolList; resValue : Double);
begin
    currentCapa2 := res;
    valeurImpedance := resValue;
    if(not res[0]) then
        Inc(impedance, 1);

end;

procedure Log.AjoutCC();
begin
    Inc(cc, 1);
end;

end.
