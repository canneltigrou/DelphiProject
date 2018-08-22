unit uAppareil;

// ****************************************************************************
// Unit� "Appaeil.pas" de la classe Appareil, m�re de tous les appareils
// tels que multimetre ou capacimetre.
// Elle permet de se connecter par ethernet a un appareil de la technologie keysight.
// Elle utilise pour cela la librairie donnee par keysight telechargeable sur :
// https://www.keysight.com/upload/cmc_upload/All/readme_IO_Libraries_18_1_23218.htm
// et le fichier VisaComLib_TLB ici legerement modifi�

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls,VisaComLib_TLB, ComObj, System.Variants,
  Menus, GIFImg, ExtCtrls, ActiveX;

//--------------------------D�claration de la classe Appareil--------------------

type Appareil = class
      protected
        rm : IResourceManager3;
        io : IMessage;
        sess : IVisaSession;
        retCount : Integer;
        readResult : WideString;

        // initialises par les classes filles selon l'appareil en concerne.
        adresse : string;
        instructionData : string;   // concerne l'instruction envoy� pour chaque mesure

      public

        constructor Create(adr:string; instruct: string);

        // Proc�dures

        //Fonctions
        function Connecter(memo : TMemo):HRESULT;
        function Send(mess :string; ack : boolean):string; // si envoi manuel depuis l'IHM.
                                            //Renvoie la r�ponse de l'appareil
        function Mesurer():string;
        function Configurer(memo : TMemo) : HRESULT; Virtual; Abstract;  // Must be implemented in child

        // Acces propri�t�s
        property adress : string read adresse write adresse ;
        property instruction : string read instructionData write instructionData ;

end;


implementation

constructor Appareil.Create(adr:string; instruct:string);
  begin
    adresse := adr;
    instructionData := instruct;
  end;


//--------------- Connecte l'appareil � l'adresse adresse ----------------------
function Appareil.Connecter(memo : TMemo):HRESULT;
var
  hResultat : HRESULT;
begin
    CoInitializeEx (NIL, COINIT_APARTMENTTHREADED);  // Start COM on this thread
    hResultat := S_OK;
    try
      try
      Memo.Lines.Add('Tentative de connexion � : ' + adresse);
      rm := CoResourceManager.Create;  // Create the VISA COM I/O Resource manager
      hResultat := rm.Open(adresse, NO_LOCK, 0, '', sess); // Use the resource manager to create a VISA COM Session
      sess.QueryInterface(IID_IMessage, io); // The IVisaSession interface is very general and does not have string reading/writing , we want to be able to read and write to the instrument
      except
        hresultat := S_FALSE;
      end;
    finally
        begin
          result := hResultat;
          if(hResultat = S_OK)
          then
            memo.Lines.Add('  Appareil Connect� !')
          else
          begin
            memo.Lines.Add('   Erreur lors de la connexion !');
          end;
        end;
    end;
end;

//----------- Envoie la commande d'instruction pour la mesure ------------------
function Appareil.Mesurer():string;
begin
    io.WriteString(instructionData, retCount); // Write to the instrument
    io.ReadString(1000, readResult); // read the result
    result := readResult;
end;

//--------- Envoie la commande entree en parametre a l'appareil ----------------
function Appareil.Send(mess :string; ack : boolean):string;
begin
    result := '';
    io.WriteString(mess, retCount); // Write to the instrument
    if(ack) then
    begin
        io.ReadString(1000, readResult); // read the result
        result := readResult;
    end;
end;

end.
