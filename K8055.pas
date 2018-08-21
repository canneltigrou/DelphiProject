unit K8055;

interface

uses
  Windows, StdCtrls, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Math, Buttons, ScktComp, ActiveX,
  VisaComLib_TLB, Generics.Collections, ComObj, System.Variants, //UChargementFichier;
  uFormConnection, uAppareilMultimetre, uAppareilCapacimetre1,
  uAppareilCapacimetre2, uAppareil;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    SK6: TCheckBox;
    SK5: TCheckBox;
    Timer1: TTimer;
    ButtonConnectAutomate: TButton;
    GroupBoxInputs: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBoxOutputs: TGroupBox;
    CbOutput1: TCheckBox;
    CbOutput2: TCheckBox;
    CbOutput3: TCheckBox;
    CbOutput4: TCheckBox;
    CbOutput5: TCheckBox;
    SpeedButtonTest: TSpeedButton;
    ButtonDisconnectAutomate: TButton;
    EditFrequence: TEdit;
    Label3: TLabel;
    ButtonFrequence: TButton;
    GroupBoxAutomate: TGroupBox;
    Label12: TLabel;
    GroupBoxAp4: TGroupBox;
    EditIP4: TEdit;
    EditPort4: TEdit;
    EditReception4: TEdit;
    LabelRecuAp4: TLabel;


    LabelAdressIP4: TLabel;
    LabelPort4: TLabel;
    ButtonConnect4: TButton;
    LabelEnvoi4: TLabel;
    EditSend4: TEdit;
    ButtonSend4: TButton;
    GroupBoxAp3: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    LabelEtat3: TLabel;
    EditIP3: TEdit;
    EditReception3: TEdit;
    ButtonConnect3: TButton;
    EditSend3: TEdit;
    ButtonSend3: TButton;
    GroupBoxAp2: TGroupBox;
    Label10: TLabel;
    Label14: TLabel;
    LabelEtat2: TLabel;
    EditIP2: TEdit;
    EditReception2: TEdit;
    ButtonConnect2: TButton;
    EditSend2: TEdit;
    ButtonSend2: TButton;
    GroupBoxAp1: TGroupBox;
    Label16: TLabel;
    Label19: TLabel;
    LabelEtat1: TLabel;
    EditIP1: TEdit;
    EditReception1: TEdit;
    ButtonConnect1: TButton;
    EditSend1: TEdit;
    ButtonSend1: TButton;
    LabelConnexion1: TLabel;
    LabelConnexion3: TLabel;
    LabelConnexion2: TLabel;
    LabelConnexion4: TLabel;
    LabelSent1: TLabel;
    LabelSent2: TLabel;
    LabelSent3: TLabel;
    LabelSent4: TLabel;
    Memo1: TMemo;
    ButtonLoadFile: TButton;
    EditCodeLu: TEdit;
    ButtonFindValues: TButton;
    ButtonTest: TButton;
    Label1: TLabel;
    EditEssaisVal: TEdit;
    LabelEnCours: TLabel;
    ClientSocketAp4: TClientSocket;
    GroupBoxLoadFile: TGroupBox;
    Label2: TLabel;
    EditCapaMin: TEdit;
    EditCapaMax: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    EditTangente: TEdit;
    EditTension: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    EditImpedance: TEdit;


    procedure FormCreate(Sender: TObject);

    procedure ButtonConnectAutomateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonDisconnectAutomateClick(Sender: TObject);
    procedure ButtonFrequenceClick(Sender: TObject);
    procedure ButtonConnect1Click(Sender: TObject);
    procedure ButtonSend1Click(Sender: TObject);
    procedure ButtonSend3Click(Sender: TObject);
    procedure ButtonSend2Click(Sender: TObject);
    procedure ButtonSend4Click(Sender: TObject);
    procedure ButtonConnect2Click(Sender: TObject);
    procedure ButtonConnect4Click(Sender: TObject);
    procedure ClientSocket4Disconnect(Sender: TObject;  Socket: TCustomWinSocket);
    procedure ClientSocketAp4Error(Sender: TObject; Socket: TCustomWinSocket;  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocketAp4Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure afficherError( ErrorEvent: TErrorEvent; Appareil : string);
    procedure ClientSocket4OnConnect(Sender: TObject;  Socket: TCustomWinSocket);
    procedure ButtonConnect3Click(Sender: TObject);
    procedure ButtonLoadFileClick(Sender: TObject);
    procedure ButtonTestClick(Sender: TObject);
    procedure TraiterResAp1();
    procedure TraiterResAp2();
    procedure TraiterResAp3();
    procedure ButtonFindValuesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EditReception2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n: integer;

  appareil1: AppareilMultimetre;
  appareil2: AppareilCapacimetre1;
  appareil3: AppareilCapacimetre2;

  dictionaryRef : TDictionary<String, String>  ;   // dictionaryRef[NÂ°OF] = Article
  dictionaryValues : TDictionary<String, TDictionary<String, Double>>; // dictionaryValues[Article] = les valeurs importante du excel pour cet aticle
  currentCode : String;


implementation

{$R *.DFM}
function SetCurrentDevice(CardAddress: integer): integer; stdcall; external 'K8055d.dll';
function OpenDevice(CardAddress: integer): integer; stdcall; external 'K8055d.dll';
function SearchDevices: integer; stdcall; external 'K8055d.dll';
function Version: integer; stdcall; external 'K8055d.dll';
procedure CloseDevice; stdcall; external 'K8055d.dll';
function ReadAnalogChannel(Channel: integer):integer; stdcall; external 'K8055d.dll';
procedure ReadAllAnalog(var Data1, Data2: integer); stdcall; external 'K8055d.dll';
procedure OutputAnalogChannel(Channel: integer; Data: integer); stdcall; external 'K8055d.dll';
procedure ClearAnalogChannel(Channel: integer); stdcall; external 'K8055d.dll';
procedure SetAnalogChannel(Channel: integer); stdcall; external 'K8055d.dll';
procedure SetAllAnalog; stdcall; external 'K8055d.dll';
procedure WriteAllDigital(Data: integer);stdcall;  external 'K8055d.dll';
procedure ClearDigitalChannel(Channel: integer); stdcall; external 'K8055d.dll';
procedure ClearAllDigital; stdcall; external 'K8055d.dll';
procedure SetDigitalChannel(Channel: integer); stdcall; external 'K8055d.dll';
procedure SetAllDigital; stdcall; external 'K8055d.dll';
function ReadDigitalChannel(Channel: integer): Boolean; stdcall; external 'K8055d.dll';
function ReadAllDigital: integer; stdcall; external 'K8055d.dll';
function ReadCounter(CounterNr: integer): integer; stdcall; external 'K8055d.dll';
procedure ResetCounter(CounterNr: integer); stdcall; external 'K8055d.dll';
procedure SetCounterDebounceTime(CounterNr, DebounceTime:integer); stdcall; external 'K8055d.dll';
procedure SetPWM(Channel: integer; Data: integer; Frequency: integer); stdcall; external 'K8055d.dll';
function ReadBackDigitalOut:Longint; stdcall; external 'K8055d.dll';
procedure ReadBackAnalogOut(Buffer: Pointer); stdcall; external 'K8055d.dll';
function Connected: boolean; stdcall; external 'K8055d.dll';



(* *************************************************************************
************* CREATE *******************************************************
*************************************************************************** *)

function SeConnecter(memo : TMemo ; EditSend : TEdit; mon_appareil : Appareil; LabelConnexion : TLabel; ButtonConnect : TButton) : HRESULT;
var
  hResultat : HRESULT;
begin
    LabelConnexion.Visible := False;
    hResultat := S_OK;
    try
        hResultat := mon_appareil.Connecter(memo);
        EditSend.Text := mon_appareil.instruction;
    finally
        begin
          result := hResultat;
          if(hResultat = S_OK)
          then
          begin
            LabelConnexion.Caption := 'Appareil Connecte!';
            ButtonConnect.Enabled := False;
          end
          else
            LabelConnexion.Caption := 'Erreur lors de la connexion !' ;
          LabelConnexion.Visible := True;
        end;
    end;
end;

function Configurer(memo : TMemo ; EditSend : TEdit; mon_appareil : Appareil; LabelConnexion : TLabel; ButtonConnect : TButton) : HRESULT;
var
  hResultat : HRESULT;
begin
    hResultat := S_OK;
    try
        hResultat := mon_appareil.Configurer(memo);
    finally
        begin
          result := hResultat;
          if(hResultat = S_OK)
          then
          begin
            LabelConnexion.Caption := 'Appareil Configure!';
            //ButtonConnect.Enabled := False;
          end
          else
            LabelConnexion.Caption := 'Erreur lors de la configuration !';
          LabelConnexion.Visible := True;
        end;
    end;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
  formConnect : TFormConnection;
begin
(*Canvas.InitializeBitmap(BitmapGood1);   *)

   SetCounterDebounceTime(1,2);
   // on crÃ© les diffÃ©rents appareils pour les connexions
   appareil1 := AppareilMultimetre.Create;
   appareil2 := AppareilCapacimetre1.Create;
   appareil3 := AppareilCapacimetre2.Create;

   // ici rien ne s'affiche, cette Form n'est pas encore cree.
   // nous allons donc crÃ©er une fenetre TFormConnection pour tenir informer de ce qui se fait.
   formConnect := TFormConnection.Create(self);
   formConnect.Show;

   //on connecte tout d'abord les diffÃ©rents appareils
   formConnect.AddMemoLine('Connexion a l''appareil 1 : le Multimetre');
   try
      SeConnecter(memo1, EditSend1, appareil1, LabelConnexion1, ButtonConnect1);
   finally
      formConnect.AddMemoLine(LabelConnexion1.Caption);
      try
        formConnect.AddMemoLine('Configuration de l''appareil 1 : le Multimetre');
        if(ButtonConnect1.Enabled = false)then
          Configurer(memo1, EditSend1, appareil1, LabelConnexion1, ButtonConnect1);
      finally
        formConnect.AddMemoLine(LabelConnexion1.Caption);
        formConnect.AddMemoLine('Connexion a l''appareil 2 : le Capacimetre');
        try
            SeConnecter(memo1, EditSend2, appareil2, LabelConnexion2, ButtonConnect2);
        finally
            formConnect.AddMemoLine(LabelConnexion2.Caption);
            try
              formConnect.AddMemoLine('Configuration de l''appareil 2 : le Capacimetre');
                if(ButtonConnect2.Enabled = false)then
                    Configurer(memo1, EditSend2, appareil2, LabelConnexion2, ButtonConnect2);
            finally
            formConnect.AddMemoLine(LabelConnexion1.Caption);
      end;
   end;


      end;
   end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseDevice;
end;



(* ***************************************************************************
*************            Les appareils de mesures                **************
*************************************************************************** *)



procedure TForm1.ButtonConnect1Click(Sender: TObject);
begin
    SeConnecter(memo1, EditSend1, appareil1, LabelConnexion1, ButtonConnect1);
end;


procedure TForm1.ButtonConnect2Click(Sender: TObject);
begin
    SeConnecter(memo1, EditSend2, appareil2, LabelConnexion2, ButtonConnect2);
end;

procedure TForm1.ButtonConnect3Click(Sender: TObject);
begin
    SeConnecter(memo1, EditSend3, appareil3, LabelConnexion3, ButtonConnect3);
end;


procedure TForm1.ButtonConnect4Click(Sender: TObject);
begin
    //127.0.0.1 is the standard IP address to loop back to your own machine
    ClientSocketAp4.Address:= EditIP4.Text ;  //'127.0.0.1';
    ClientSocketAp4.Port:= StrToInt(EditPort4.Text) ;
    ClientSocketAp4.Active := True;//Activates the client

  (* if(ClientSocketAp4.Socket.Connected=True)
    then
    begin
      LabelEtat1.Visible := True;
      ClientSocketAp4.Active := False;//Disconnects the client
      ButtonConnect4.Caption:='Connect';
    end;
    *)
end;


procedure TForm1.ButtonFindValuesClick(Sender: TObject);
begin
  currentCode := dictionaryRef[EditCodeLu.Text];
  EditEssaisVal.Text := (dictionaryValues[currentCode])['Essais val_1'].ToString;
  Appareil1.valeurRef := (dictionaryValues[currentCode])['Essais val_1'];
  EditCapaMin.Text :=  (dictionaryValues[currentCode])['Cap_lim_bas'].ToString;
  appareil2.valeurCapaMin := (dictionaryValues[currentCode])['Cap_lim_bas'];
  EditCapaMax.Text :=  (dictionaryValues[currentCode])['Cap_lim_haut'].ToString;
  appareil2.valeurCapaMax := (dictionaryValues[currentCode])['Cap_lim_haut'];
  EditTangente.Text :=  (dictionaryValues[currentCode])['Essais val_0'].ToString;
  appareil2.valeurTangente := (dictionaryValues[currentCode])['Essais val_0'];
  EditImpedance.Text :=  (dictionaryValues[currentCode])['Essais val_2'].ToString;
  appareil3.valeurImpedance := (dictionaryValues[currentCode])['Essais val_2'];
  EditTension.Text :=  (dictionaryValues[currentCode])['Tension nominale'].ToString;
end;



procedure TForm1.ButtonSend1Click(Sender: TObject);
begin
    LabelSent1.Visible := true;
    EditReception1.Text := appareil1.Mesurer();
    LabelSent1.Visible := false;
    TraiterResAp1();
end;

procedure TForm1.ButtonSend2Click(Sender: TObject);
begin
    LabelSent2.Visible := true;
    EditReception2.Text := appareil2.Mesurer();
    LabelSent2.Visible := false;
    TraiterResAp2();
end;

procedure TForm1.ButtonSend3Click(Sender: TObject);
begin
    LabelSent3.Visible := true;
    EditReception3.Text := appareil2.Mesurer();
    LabelSent3.Visible := false;
    TraiterResAp3();
end;

procedure TForm1.ButtonSend4Click(Sender: TObject);
var
    str : String;
begin
    str := EditSend4.Text;
    ClientSocketAp4.Socket.SendText(AnsiString(str));//Send the messages to the server
    LabelSent4.Visible := true;
end;



procedure LireFichier();
var
vMSExcel : variant;
    vXLWorkbooks, vXLWorkbook, vReadOnly, vLink : variant;
    sFileName : string;
    sFullName : string;
    aSheetName : AnsiString;
    vWorksheet : variant;
    sValue1, sRange1, sValue2, sRange2, sValue3, sRange3 : string;
    vCell : variant;
    j : integer;
    tmpDict : TDictionary<String, Double>;
    lFormatSettings : TFormatSettings;
begin
    lFormatSettings.DecimalSeparator := ',';

  // ouvre excel
    vMSExcel := CreateOleObject('Excel.Application');
    vMSExcel.Visible := false;

    sFileName := 'liste.xlsx';
    // ouvre le fichier en lecture seule
    sFullName := GetCurrentDir + '\' + sFileName;
    vLink := unassigned;
    vReadOnly := true;
    vXLWorkbooks := vMSExcel.Workbooks;
    vXLWorkbook := vXLWorkbooks.Open(sFullName, vLink, vReadOnly);


    // remplissage de la 1ere hashmap  :

    // accÃ¨de Ã  la feuille voulue
    aSheetName := 'Feuil5';
    vWorksheet := vXLWorkbook.WorkSheets[aSheetName];

    j := 2;
    sRange1 := 'A2';
    vCell := vWorksheet.Range[sRange1];
    sValue1 := vCell.Value;
    while sValue1 <> '' do
    begin
      sRange2 := 'B' + IntToStr(j);
      vCell := vWorksheet.Range[sRange2];
      sValue2 := vCell.Value;
      //Memo1.Lines.Add(sValue1 + ' ; ' + sValue2);
      dictionaryRef.Add(sValue1, sValue2);

      Inc(j, 1);

      sRange1 := 'A' + IntToStr(j);
      vCell := vWorksheet.Range[sRange1];
      sValue1 := vCell.Value;
    end;

    // remplissage de la 2eme hashmap  :

    // accÃ¨de Ã  la feuille voulue
    aSheetName := 'Feuil8';
    vWorksheet := vXLWorkbook.WorkSheets[aSheetName];

    j := 2;
    sRange1 := 'A2';
    vCell := vWorksheet.Range[sRange1];
    sValue1 := vCell.Value;
    while sValue1 <> '' do
    begin
      tmpDict := TDictionary<String, Double>.Create();
      sRange2 := 'O1';
      vCell := vWorksheet.Range[sRange2];
      sValue2 := vCell.Value;
      sRange3 := 'O' + IntToStr(j)  ;
      vCell := vWorksheet.Range[sRange3];
      sValue3 := vCell.Value;
      tmpDict.Add(sValue2, StrToFloat(sValue3, lFormatSettings));

      sRange2 := 'J1';
      vCell := vWorksheet.Range[sRange2];
      sValue2 := vCell.Value;
      sRange3 := 'J' + IntToStr(j)  ;
      vCell := vWorksheet.Range[sRange3];
      sValue3 := vCell.Value;
      tmpDict.Add(sValue2, StrToFloat(sValue3, lFormatSettings));

      sRange2 := 'K1';
      vCell := vWorksheet.Range[sRange2];
      sValue2 := vCell.Value;
      sRange3 := 'K' + IntToStr(j)  ;
      vCell := vWorksheet.Range[sRange3];
      sValue3 := vCell.Value;
      tmpDict.Add(sValue2, StrToFloat(sValue3, lFormatSettings));

      sRange2 := 'M1';
      vCell := vWorksheet.Range[sRange2];
      sValue2 := vCell.Value;
      sRange3 := 'M' + IntToStr(j)  ;
      vCell := vWorksheet.Range[sRange3];
      sValue3 := vCell.Value;
      tmpDict.Add(sValue2, StrToFloat(sValue3, lFormatSettings));

      sRange2 := 'Q1';
      vCell := vWorksheet.Range[sRange2];
      sValue2 := vCell.Value;
      sRange3 := 'Q' + IntToStr(j)  ;
      vCell := vWorksheet.Range[sRange3];
      sValue3 := vCell.Value;
      tmpDict.Add(sValue2, StrToFloat(sValue3, lFormatSettings));

      sRange2 := 'F1';
      vCell := vWorksheet.Range[sRange2];
      sValue2 := vCell.Value;
      sRange3 := 'F' + IntToStr(j)  ;
      vCell := vWorksheet.Range[sRange3];
      sValue3 := vCell.Value;
      tmpDict.Add(sValue2, StrToFloat(sValue3, lFormatSettings));

      dictionaryValues.Add(sValue1, tmpDict);

      Inc(j, 1);

      sRange1 := 'A' + IntToStr(j);
      vCell := vWorksheet.Range[sRange1];
      sValue1 := vCell.Value;
    end;

    vMSExcel.Quit;
    vMSExcel := Unassigned;

end;



procedure TForm1.ButtonLoadFileClick(Sender: TObject);
begin
  LabelEnCours.Visible := True;
  dictionaryRef:= TDictionary<String, String>.create;
  dictionaryValues := TDictionary<String,Tdictionary<String, Double>>.create;
// lecture du fichier
  LireFichier();
  LabelEnCours.Visible := False;
  ButtonLoadFile.Enabled := False;
end;


procedure TForm1.ButtonDisconnectAutomateClick(Sender: TObject);
begin
    CloseDevice;
    label12.caption:='Disconnected'
end;





procedure TForm1.ClientSocket4Disconnect(Sender: TObject;  Socket: TCustomWinSocket);
begin
   Socket.SendText('Disconnected');//Send the ÂDisconnectedÂ message to the server
//str is set to ÂDisconnectedÂ when the Disconnect button is pressed
//A client cannot send messages if it is not connected to a server
   ButtonSend4.Enabled:=False;
   ButtonConnect4.Caption:='Connect';
end;


procedure TForm1.ClientSocket4OnConnect(Sender: TObject;  Socket: TCustomWinSocket);
begin
   ButtonSend4.Enabled:= True;
  // ButtonConnect2.Caption:='Connect';
end;

procedure TForm1.afficherError( ErrorEvent: TErrorEvent; Appareil : string);
begin
   if ErrorEvent=eeGeneral then
    Memo1.Lines.Add(Appareil + ' : Erreur inattendu');

  if ErrorEvent=eeSend then
     Memo1.Lines.Add(Appareil + ' : Erreur d''Ã©criture sur la connexion socket');

  if ErrorEvent=eeReceive then
    Memo1.Lines.Add(Appareil +' : Erreur de lecture sur la connexion socket');

  if ErrorEvent=eeConnect then
    Memo1.Lines.Add(Appareil + ' : Une demande de connexion dÃ©jÃ  acceptÃ©e n''a pas pu Ãªtre achevÃ©e');

  if ErrorEvent=eeDisconnect then
    Memo1.Lines.Add(Appareil + ' : Erreur de fermeture d''une connexion');

  if ErrorEvent=eeAccept then
    Memo1.Lines.Add(Appareil + ' : Erreur d''acceptation d''une demande de connexion cliente');

end;


procedure TForm1.ClientSocketAp4Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
   afficherError( ErrorEvent , 'Ap4')  ;

  ErrorCode:=0;
  ClientSocketAp4.Active := False;
  labelConnexion4.Visible := True;
end;


procedure TForm1.ClientSocketAp4Read(Sender: TObject; Socket: TCustomWinSocket);
begin
//Reads and displays the message received from the server;
    EditReception1.Text := String(Socket.ReceiveText);
    LabelSent4.Visible := false;
end;

procedure TForm1.EditReception2Change(Sender: TObject);
begin

end;

(*********************************************************************
************************ automate ************************************
******************************************************************** *)

procedure TForm1.ButtonConnectAutomateClick(Sender: TObject);
var h,CardAddr:integer;
//out_digital: longint;
//out_analog: array[0..1] of longint;
begin
  CardAddr:= 3-(integer(sk5.Checked) + integer(sk6.Checked) * 2);
  h:= OpenDevice(CardAddr);
  case h of
    0..3: label12.caption:='Card '+ inttostr(h)+' connected';
    -1: label12.caption:='Card '+ inttostr(CardAddr)+' not found';
  end;
  if h>=0 then
    Timer1.Enabled:=True;
  ClearAllDigital;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
var i: integer;
begin
  timer1.enabled:=false;
  Memo1.Lines.Add(inttostr(ReadCounter(1)));

  i:=ReadAllDigital;
  if((not CheckBox1.Checked) and ((i and 1)>0))
  then
  begin
    CheckBox1.Checked := True;
    ButtonSend1Click(Sender);
    TraiterResAp1();
  end
  else
    CheckBox1.checked:=(i and 1)>0;

  if((not CheckBox2.Checked) and ((i and 2)>0))
  then
  begin
    CheckBox2.Checked := True;
    ButtonSend2Click(Sender);
    TraiterResAp2();
  end
  else
    CheckBox2.checked:=(i and 2)>0;

  if((not CheckBox3.Checked) and ((i and 4)>0))
  then
  begin
    CheckBox3.Checked := True;
    ButtonSend3Click(Sender);
    TraiterResAp3();
  end
  else
    CheckBox3.checked:=(i and 4)>0;
  CheckBox4.checked:=(i and 8)>0;
  CheckBox5.checked:=(i and 16)>0;
  timer1.enabled:=true;
end;


procedure TForm1.ButtonFrequenceClick(Sender: TObject);
begin
  OutputAnalogChannel(1,strtoint(EditFrequence.Text));
  //SetPWM(1,255-TrackBar1.position,2);
end;



(* ******************************************************************
*********   Annalyse Appareil 1 Multimetre **************************
******************************************************************* *)

procedure TForm1.TraiterResAp1();
var
  res : Boolean;
begin
  CbOutput1.checked := false;
  res := appareil1.Traiter_donnee(EditReception1.Text);
  if(res = True)
  then
  begin
    LabelEtat1.Caption := 'OK';
    ClearDigitalChannel(1);
  end
  else
  begin
    LabelEtat1.Caption := 'KO';
    CbOutput1.checked := true;
    SetDigitalChannel(1);
  end;
end;

(* *******************************************************************
*********   Annalyse Appareil 2 Capacimetre **************************
*********     CapacitÃ© + Tangente           **************************
******************************************************************* *)
procedure TForm1.TraiterResAp2();
var
  res : TBoolList;
begin
  SetLength(res, 3);
  res := appareil2.Traiter_donnee(EditReception2.Text);
  if(res[0] = True)
  then
  begin
    LabelEtat2.Caption := 'OK';
    CbOutput2.checked := false;
    ClearDigitalChannel(2);
  end
  else
  begin
    LabelEtat2.Caption := 'KO';
    CbOutput2.checked := true;
    SetDigitalChannel(2);
  end;
  if(res[1] = True)
  then
  begin
    LabelEtat2.Caption := LabelEtat2.Caption + ' - OK';
    CbOutput3.checked := false;
    ClearDigitalChannel(3);
  end
  else
  begin
    LabelEtat2.Caption := LabelEtat2.Caption + ' - KO';
    CbOutput3.checked := true;
    SetDigitalChannel(3);
  end;
  if(res[2] = True)
  then
  begin
    LabelEtat2.Caption := LabelEtat2.Caption + ' - OK';
    CbOutput4.checked := false;
    ClearDigitalChannel(4);
  end
  else
  begin
    LabelEtat2.Caption := LabelEtat2.Caption  + ' - KO';
    CbOutput4.checked := true;
    SetDigitalChannel(4);
  end;
end;


(* *******************************************************************
*********   Annalyse Appareil 2 Capacimetre **************************
*********     CapacitÃ© + Tangente           **************************
******************************************************************* *)
procedure TForm1.TraiterResAp3();
begin
     //
end;


(* ****************************************************************************
*************           TEST              *************************************
***************************************************************************** *)

procedure TForm1.ButtonTestClick(Sender: TObject);
begin
    TraiterResAp1();
    TraiterResAp2();
end;


end.
