unit uAppareil;

// ****************************************************************************
// Unité "Appaeil.pas" de la classe Appareil, mère de tous les appareils
// tels que multimetre ou capacimetre.

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ComCtrls,VisaComLib_TLB, ComObj, System.Variants,
  Menus, GIFImg, ExtCtrls, ActiveX;

//--------------------------Déclaration de la classe Appareil--------------------

type Appareil = class
      protected
        rm : IResourceManager3;
        io : IMessage;
        sess : IVisaSession;
        retCount : Integer;
        readResult : WideString;

        adresse : string;
        instructionData : string;

      public

        constructor Create(adr:string; instruct: string);

        // Procédures
        //procedure SetAdress(adr:string);

        //Fonctions
        function Connecter(memo : TMemo):HRESULT;
        function Send(mess :string):string; // si envoi manuel depuis l'IHM.
                                            //Renvoie la réponse de l'appareil
        function Mesurer():string;

        // Acces propriétés
        property adress : string read adresse write adresse ;
        property instruction : string read instructionData write instructionData ;

end;


implementation

constructor Appareil.Create(adr:string; instruct:string);
  begin
    adresse := adr;
    instructionData := instruct;
  end;


//--------------- Connecte l'appareil à l'adresse adresse ----------------------
function Appareil.Connecter(memo : TMemo):HRESULT;
var
  hResultat : HRESULT;
begin
    CoInitializeEx (NIL, COINIT_APARTMENTTHREADED);  // Start COM on this thread
    hResultat := S_OK;
    try
      try
      Memo.Lines.Add('Tentative de connexion à : ' + adresse);
      rm := CoResourceManager.Create;  // Create the VISA COM I/O Resource manager
      hResultat := rm.Open(adresse, NO_LOCK, 0, '', sess); // Use the resource manager to create a VISA COM Session
      sess.QueryInterface(IID_IMessage, io); // The IVisaSession interface is very general and does not have string reading/writing , we want to be able to read and write to the instrument

      //EditSend1.Text := sInstructionAp1;
      except
        hresultat := S_FALSE;
      end;
    finally
        begin
          result := hResultat;
          if(hResultat = S_OK)
          then
            memo.Lines.Add('  Appareil Connecté !')
          else
          begin
            memo.Lines.Add('   Erreur lors de la connexion !' + int(hResultat).ToString);
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
function Appareil.Send(mess :string):string;
begin
    io.WriteString(mess, retCount); // Write to the instrument
    io.ReadString(1000, readResult); // read the result
    result := readResult;
end;

end.
