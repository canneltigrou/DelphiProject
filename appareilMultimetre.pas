unit appareilMultimetre;

// ****************************************************************************
// Unité "U_34450A_USB.pas"
// permettant de créer la classe Multimetre 34450A
// qui a été créer lors de la configuration.
// Unité pour le logiciel de mesure "Mozart"

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls,CWVisaLib_TLB,
  Menus, GIFImg, ExtCtrls;

//--------------------------Déclaration de la classe C_34450A_USB--------------------

type C_34450A_USB = class
      public
        connexion : TCWVisa;
        adresse : string;
        data : string;

        constructor Create(adr:string ; con: TCWVisa);
        // Procédures
        procedure Configurer(mode,output,resolution: string);
        procedure Clear_Status_Byte;
        procedure Lancer_trigger;

        //Fonctions
        function MesurerT(kel_mesure, uni:string):string;
        function identifierAppareil:string;
        function Read_Status_byte : string;
        Function Read_SRE : string;
        Function Mesure_en_attente : boolean;
        Function Traiter_donnee(string_a_traiter : string):string;

      private
        cable, ten, ten2,frequence : string;
        Default_param, resolution, output : string;
        unite : double;
        mes_num :integer;
end;


implementation

constructor C_34450A_USB.Create(adr:string; con:TCWVisa);
  begin
    connexion := con;
    adresse := adr; //normalement pas utilisé
    connexion.Open;
  end;

//---------------------------Début Procedure configurer------------------------
procedure C_34450A_USB.Configurer(mode,output,resolution: string);
  begin
      output        := '1';
      resolution    := '2.0E-5';
      Default_param := 'DCV';    // réglage par défaut

      connexion.Write('*RST');  // Reset
      Clear_Status_Byte;  // Clear status byte

      // Paramétrage des valeurs mesurés
      if mode = 'DCV' then  Default_param := ('VOLT:DC')
      else if mode = 'ACV' then Default_param := ('VOLT:AC')
      else if mode = 'DCI' then Default_param := ('CURR:DC')
      else if mode = 'ACI' then Default_param := ('CURR:AC')
      else if mode = 'OHM' then Default_param := ('RES')
      else if mode = 'Frequence' then Default_param := ('FREQ') ;

      connexion.Write('CONF:' + Default_param );    // RANGE auto par default
      connexion.Write('FORM:OUTP '+output);               // ne pas recuperer l'uniter lors de la mesure
      connexion.Write(Default_param+':RES '+resolution); // Resolution M

      //Masque des bits de statut (il n'y aura donc aucune Requete donc aucune pile de requete)
      connexion.Write('*SRE 0');

      // Vide le buffer;
      MesurerT('Vide-Tamp', '');

  end;

//---------------------------- Début Procédure Effacer mot de statut -----------
procedure C_34450A_USB.Clear_Status_Byte;
begin
  connexion.Write('*CLS');
end;

//---------------------------- Début Fonction Lire le mot de statut -----------
Function C_34450A_USB.Read_Status_byte : string;
begin
  connexion.Write('*STB?');
  result := Connexion.Read;
end;

//---------------------------- Début Fonction lire SRE Value -----------
Function C_34450A_USB.Read_SRE : string;
begin
  connexion.Write('*SRE?');
  result := Connexion.Read;
end;

//------- Début Fonction lire registre si mesure effectué en attente -----------
// Cette fonction est à customiser en fonction des Appareil pour renvoyer TRUE
// Si une mesure est en attente
Function C_34450A_USB.Mesure_en_attente : boolean;
var r_temp : integer;
begin
  connexion.Write('*STB?');
  sleep(100);  //-410  Query INTERRUPTED Query is followed by DAB or GET before the response is completed.
  r_temp := Connexion.Read;
  // On masque ensuite le bit 7 du Registre des bytes de statut
  // pour connaitre l'état de ce bit dans le registre de statut de fonctionnement

  if (r_temp and $80) = 128 then result:= TRUE
  else result := FALSE;

end;

//----------------------------Début fonction MesurerT--------------------------
function C_34450A_USB.MesurerT(kel_mesure, uni:string):string;
var Tension,exposant_T ,MesureT, mes_string : string;
    m : integer;
    dbl_value : double;
begin
  FormatSettings.DecimalSeparator := '.';
  // Début d'une mesure
  if kel_mesure = 'Vide-Tamp' then
    begin
      //connexion.Write('MEM:CLE DBUF');    // Vide le buffer
      //connexion.Write('MEM:FILL DBUF');   // Autorise l'écriture sur le buffer
      mes_num := 0;
      connexion.Write('INIT');    // se met en attente d'un nouveau trig
      result := 'OK';
    end;

  if kel_mesure = 'Tens' then
    begin
      mes_string := connexion.Read;       // Récupère les caractères

      // Tronçonnage du résultat
      for m := 0 to mes_num-1 do
        begin
          mes_string := copy(mes_string,Pos(',',mes_string)+1,length(mes_string));
          mes_string := copy(mes_string,Pos(',',mes_string)+1,length(mes_string));
          mes_string := copy(mes_string,Pos(',',mes_string)+1,length(mes_string));
          mes_string := copy(mes_string,Pos(',',mes_string)+1,length(mes_string));  //Lit la mesure de la tangente ou R
        end;
      mes_num := mes_num + 1;             // Première mesure ou mesure suivante

      Tension := (mes_string.Split(['#']))[0];            //lis la mesure
      Tension := Traiter_donnee(Tension);                 //Traite la mesure afin de resortir sous un format bien précis "Val+E+nn"
      exposant_T := copy(Tension,length(Tension)-3,4);    //Extrait la valeur de l'exposant Tension
      Tension := copy(Tension,1,length(Tension)-4);       //Extrait la valeur de la Tension
      //au cas où le reste ne soit pas une valeur flottante, je le met = 0
      if not trystrtofloat(Tension, dbl_value) then Tension := '0';


      // Traitement de l'unité de mesure
      if uni='V' then unite := 1
      else if uni='mV' then unite := 1000
      else if uni='A' then unite := 1
      else if uni='mA' then unite := 1000
      else if uni='Ohm' then unite := 1
      else if uni ='µA' then unite := 1000000;


      // Traitement de l'exposant Tension
      if (exposant_T='E-00')OR(exposant_T='E+00')
               then MesureT := FloatToStr(unite*StrtoFloat(Tension))
      else if exposant_T='E+12' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*1000000000000)
      else if exposant_T='E+11' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*100000000000)
      else if exposant_T='E+10' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*10000000000)
      else if exposant_T='E+09' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*1000000000)
      else if exposant_T='E+08' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*100000000)
      else if exposant_T='E+07' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*10000000)
      else if exposant_T='E+06' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*1000000)
      else if exposant_T='E+05' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*100000)
      else if exposant_T='E+04' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*10000)
      else if exposant_T='E+03' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*1000)
      else if exposant_T='E+02' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*100)
      else if exposant_T='E+01' then MesureT := FloatToStr(unite*StrtoFloat(Tension)*10)
      else if (exposant_T='E-00')OR(exposant_T='E+00')then MesureT := FloatToStr(unite*StrtoFloat(Tension))
        else if exposant_T='E-01' then MesureT := FloatToStr(unite*StrtoFloat(Tension)/10)
        else if exposant_T='E-02' then MesureT := FloatToStr(unite*StrtoFloat(Tension)/100)
        else if exposant_T='E-03' then MesureT := FloatToStr(unite*StrtoFloat(Tension)/1000)
        else if exposant_T='E-04' then MesureT := FloatToStr(unite*StrtoFloat(Tension)/10000)
        else if exposant_T='E-05' then MesureT := FloatToStr(unite*StrtoFloat(Tension)/100000)
        else if exposant_T='E-06' then MesureT := FloatToStr(unite*StrtoFloat(Tension)/1000000)
        else if exposant_T='E-07' then MesureT := FloatToStr(unite*StrtoFloat(Tension)/10000000)
        else if exposant_T='E-08' then MesureT := FloatToStr(unite*StrtoFloat(Tension)/100000000)
        else if exposant_T='E-09' then MesureT := FloatToStr(unite*StrtoFloat(Tension)/1000000000)
        else if exposant_T='E-10' then MesureT := FloatToStr(unite*StrtoFloat(Tension)/10000000000) ;

      // Reconstitution du résultat (Tension en V)
      result := MesureT;
      if result='' then result:='0.0';
    end
end;

//---------------------------- Début fonction identifierAppareil -----------------
function C_34450A_USB.identifierAppareil;
begin
  connexion.Write('*IDN?');   //Identification Appareil (tous les paramètres)
                              //Identification Appareil (N°id)
  sleep(1500); // E-410 Query INTERRUPTED Query is followed by DAB or GET before the response is completed.
  result := connexion.Read;   //Met l'identification dans la variable result
end;

//---------------------------Début Procedure Lancer_Trigger-------------------------
procedure C_34450A_USB.Lancer_Trigger;
//var type_trig : string;
begin
    connexion.Write('INIT');
    connexion.Write('FETC?');
    //connexion.Write('READ?'); //equivalent a INIT + FETC?
end;

// ------------------------- Fonction Traitement des mesures ---------------------
Function C_34450A_USB.Traiter_donnee(string_a_traiter : string):string;
var string_temp : string;
    i, j, k : integer;
begin
  string_temp := string_a_traiter;
  j:=0;
  k:=0;
  for i := 1 to length(string_temp)+1 do
    begin
      if string_temp[i] = 'E' then
          begin
            j := i;
            k := 1;
          end
      else
        begin
          if k>=1 then
              if ((string_temp[i]='-') or (string_temp[i]='+') or (string_temp[i]='0')
                  or (string_temp[i]='1') or (string_temp[i]='2') or (string_temp[i]='3')
                  or (string_temp[i]='4') or (string_temp[i]='5') or (string_temp[i]='6')
                  or (string_temp[i]='7') or (string_temp[i]='8') or (string_temp[i]='9')) then
                    k := k + 1
              else
                  begin   // Si k=3 alors l'exposant est positif et on rajoute le +
                    if k = 3 then string_temp := copy(string_temp, 1, j) + '+' + copy(string_temp, j+1, k-1)
                    else if k = 4 then string_temp := copy(string_temp, 1, j+k-1); // Sinon l'exposant est négatif
                  end;   // On est sur d'avoir un exposant à la fin de 4 caractère "E+nn" ou "E-nn"
        end;
    end;
  if j = 0 then string_temp := copy(string_temp, 1, 6)+'E+00';
  result := string_temp;
end;

end.
