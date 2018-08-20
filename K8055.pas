unit K8055;

interface

uses
  Windows, StdCtrls, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Math, Buttons, ScktComp, ActiveX,
  VisaComLib_TLB, Generics.Collections, ComObj, System.Variants, //UChargementFichier;
  uFormConnection, appareilMultimetre;

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
    procedure SpeedButtonTestClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
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
    procedure CheckBox1Click(Sender: TObject);
    procedure ButtonFindValuesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    function ParseResultat(sResult: String) : Double;
  private
    { Private declarations }
  public
    FenetreDemarrage: TForm;
    { Public declarations }
  end;

var
  Form1: TForm1;
  n: integer;
  BitmapGood: TBitmap;
  BitmapBad: TBitmap;
  sInstructionAp1: String;
  sInstructionAp2: String;
  sInstructionAp3: String;
  sInstructionAp4: String;
  sInstuctionBroadcast: String;
  nbAppareilsConnectes: integer;

  rmMultiM : IResourceManager3;
  ioMultiM : IMessage;
  sessMultiM : IVisaSession;
  retCountMultiM : Integer;
  readResultMultiM : WideString;
  //connexion : TCWVisa;

  rmCapa1 : IResourceManager3;
  ioCapa1 : IMessage;
  sessCapa1 : IVisaSession;
  retCountCapa1 : Integer;
  readResultCapa1 : WideString;

  rmCapa2 : IResourceManager3;
  ioCapa2 : IMessage;
  sessCapa2 : IVisaSession;
  retCountCapa2 : Integer;
  readResultCapa2 : WideString;


  //dictionary: TDictionary<String, TDictionary<String , TStringList>>;
  //dict : TDictionary<integer, char>;
  dictionaryRef : TDictionary<String, String>  ;   // dictionaryRef[N°OF] = Article
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


procedure TForm1.ButtonConnect1Click(Sender: TObject);
var
  fn : String;
  hResultat : HRESULT;
begin
    LabelConnexion1.Visible := False;
    CoInitializeEx (NIL, COINIT_APARTMENTTHREADED);  // Start COM on this thread
    //fn := 'TCPIP0::169.254.4.61::hislip0::INSTR';
    fn := EditIP1.Text;
    hResultat := S_OK;
    try
    rmMultiM := CoResourceManager.Create;  // Create the VISA COM I/O Resource manager
    hResultat := rmMultiM.Open(fn, NO_LOCK, 0, '', sessMultiM); // Use the resource manager to create a VISA COM Session
    sessMultiM.QueryInterface(IID_IMessage, ioMultiM); // The IVisaSession interface is very general and does not have string reading/writing , we want to be able to read and write to the instrument
    Memo1.Lines.Add(fn);
    EditSend1.Text := sInstructionAp1;
    finally
       if(hResultat = S_OK)
    then
    begin
      LabelConnexion1.Caption := 'Appareil Connecté !';
      ButtonConnect1.Enabled := False;
    end
    else
      LabelConnexion1.Caption := 'Erreur lors de la connexion !';
    LabelConnexion1.Visible := True;
    end;

end;


procedure TForm1.ButtonConnect2Click(Sender: TObject);
var
  fn : String;
begin
    CoInitializeEx (NIL, COINIT_APARTMENTTHREADED);  // Start COM on this thread
    fn := EditIP2.Text;
    //fn := 'TCPIP::' + EditIP2.Text + '::' + EditPort2.Text + '::SOCKET';
    rmCapa1 := CoResourceManager.Create;  // Create the VISA COM I/O Resource manager
    rmCapa1.Open(fn, NO_LOCK, 0, '', sessCapa1); // Use the resource manager to create a VISA COM Session
    sessCapa1.QueryInterface(IID_IMessage, ioCapa1); // The IVisaSession interface is very general and does not have string reading/writing , we want to be able to read and write to the instrument
    Memo1.Lines.Add(fn);
    //ClientSocketAp2.Open;//Activates the client
end;

procedure TForm1.ButtonConnect3Click(Sender: TObject);
var
  fn : String;
  hResultat : HRESULT;
begin
    CoInitializeEx (NIL, COINIT_APARTMENTTHREADED);  // Start COM on this thread
    fn := EditIP3.Text;
    //fn := 'TCPIP::' + EditIP2.Text + '::' + EditPort2.Text + '::SOCKET';
    rmCapa2 := CoResourceManager.Create;  // Create the VISA COM I/O Resource manager
    hResultat := rmCapa2.Open(fn, NO_LOCK, 0, '', sessCapa2); // Use the resource manager to create a VISA COM Session
    sessCapa2.QueryInterface(IID_IMessage, ioCapa2); // The IVisaSession interface is very general and does not have string reading/writing , we want to be able to read and write to the instrument
    Memo1.Lines.Add(fn);

end;

procedure TForm1.ButtonConnect4Click(Sender: TObject);
begin
    //127.0.0.1 is the standard IP address to loop back to your own machine
    ClientSocketAp4.Address:= EditIP4.Text ;  //'127.0.0.1';
    ClientSocketAp4.Active := True;//Activates the client

 if(ClientSocketAp4.Socket.Connected=True)
    then
    begin
      LabelEtat1.Visible := True;
      ClientSocketAp4.Active := False;//Disconnects the client
      ButtonConnect4.Caption:='Connect';
    end;
end;

procedure TForm1.ButtonConnectAutomateClick(Sender: TObject);
var h,CardAddr:integer;
out_digital: longint;
out_analog: array[0..1] of longint;
begin
  CardAddr:= 3-(integer(sk5.Checked) + integer(sk6.Checked) * 2);
  h:= OpenDevice(CardAddr);
  case h of
    0..3: label12.caption:='Card '+ inttostr(h)+' connected';
    -1: label12.caption:='Card '+ inttostr(CardAddr)+' not found';
  end;
  if h>=0 then
    Timer1.Enabled:=True;
end;



(* Connexion Ethernet avec le 1er appareil de mesure *)



procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseDevice;
end;



procedure TForm1.SpeedButtonTestClick(Sender: TObject);
begin
  //timer2.enabled:=SpeedButton1.Down;
end;



procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  SetCurrentDevice(0);
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  SetCurrentDevice(1);
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  SetCurrentDevice(2);
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
  SetCurrentDevice(3);
end;


procedure TForm1.ButtonFindValuesClick(Sender: TObject);
begin
  currentCode := dictionaryRef[EditCodeLu.Text];
  EditEssaisVal.Text := (dictionaryValues[currentCode])['Essais val_1'].ToString;
  EditCapaMin.Text :=  (dictionaryValues[currentCode])['Cap_lim_bas'].ToString;
  EditCapaMax.Text :=  (dictionaryValues[currentCode])['Cap_lim_haut'].ToString;
  EditTangente.Text :=  (dictionaryValues[currentCode])['Essais val_0'].ToString;
  EditImpedance.Text :=  (dictionaryValues[currentCode])['Essais val_2'].ToString;
  EditTension.Text :=  (dictionaryValues[currentCode])['Tension nominale'].ToString;

end;

procedure TForm1.ButtonFrequenceClick(Sender: TObject);
begin
  OutputAnalogChannel(1,strtoint(EditFrequence.Text));
  //SetPWM(1,255-TrackBar1.position,2);
end;

procedure TForm1.ButtonSend1Click(Sender: TObject);
var
    Str : String;
begin
    ioMultiM.WriteString(EditSend1.Text, retCountMultiM); // Write to the instrument
    LabelSent1.Visible := true;
    ioMultiM.ReadString(1000, readResultMultiM); // read the result
    EditReception1.Text := readResultMultiM;
    LabelSent1.Visible := false;
    TraiterResAp1();
end;

procedure TForm1.ButtonSend2Click(Sender: TObject);
begin
    ioCapa1.WriteString(EditSend2.Text, retCountCapa1); // Write to the instrument
    LabelSent2.Visible := true;
    ioCapa1.ReadString(1000, readResultCapa1); // read the result
    EditReception2.Text := readResultCapa1;
    LabelSent2.Visible := false;
end;

procedure TForm1.ButtonSend3Click(Sender: TObject);
var
    Str : String;
begin
    ioCapa2.WriteString(EditSend3.Text, retCountCapa2); // Write to the instrument
    LabelSent3.Visible := true;
    ioCapa2.ReadString(1000, readResultCapa2); // read the result
    LabelSent3.Visible := false;
    EditReception3.Text := readResultCapa2;
end;

procedure TForm1.ButtonSend4Click(Sender: TObject);
var
    Str : String;
begin
    Str:=EditSend4.Text;
    ClientSocketAp4.Socket.SendText(str);//Send the messages to the server
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

    // accède à la feuille voulue
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

    // accède à la feuille voulue
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


      //Memo1.Lines.Add(sValue1 + ' ; ' + sValue2);
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

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
// top départ de l'appareil 1
  //ButtonSend1Click(Sender);
end;

procedure TForm1.ButtonDisconnectAutomateClick(Sender: TObject);
begin
    CloseDevice;
    label12.caption:='Disconnected'
end;


procedure TForm1.FormCreate(Sender: TObject);
var
  formConnect : TFormConnection;
  resModal : Integer;
begin
(*Canvas.InitializeBitmap(BitmapGood1);   *)

   //on connecte tout d'abord les différents appareils
   // pour l'instant l'appareil 1

   SetCounterDebounceTime(1,2);
   sInstructionAp1 := 'MEAS:VOLT:DC?';
   EditIP1.Text := 'TCPIP0::169.254.4.61::hislip0::INSTR';



   formConnect := TFormConnection.Create(self);
   formConnect.Show;
   formConnect.AddMemoLine('Connexion à l''appareil 1 : le Multimètre');
   try
      ButtonConnect1Click(Sender);
   finally
      formConnect.AddMemoLine(LabelConnexion1.Caption);



   end;
end;






procedure TForm1.ClientSocket4Disconnect(Sender: TObject;  Socket: TCustomWinSocket);
begin
   Socket.SendText('Disconnected');//Send the “Disconnected” message to the server
//str is set to “Disconnected” when the Disconnect button is pressed
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
     Memo1.Lines.Add(Appareil + ' : Erreur d''écriture sur la connexion socket');

  if ErrorEvent=eeReceive then
    Memo1.Lines.Add(Appareil +' : Erreur de lecture sur la connexion socket');

  if ErrorEvent=eeConnect then
    Memo1.Lines.Add(Appareil + ' : Une demande de connexion déjà acceptée n''a pas pu être achevée');

  if ErrorEvent=eeDisconnect then
    Memo1.Lines.Add(Appareil + ' : Erreur de fermeture d''une connexion');

  if ErrorEvent=eeAccept then
    Memo1.Lines.Add(Appareil + ' : Erreur d''acceptation d''une demande de connexion cliente');

end;


procedure TForm1.ClientSocketAp4Error(Sender: TObject; Socket: TCustomWinSocket;  ErrorEvent: TErrorEvent;
var ErrorCode: Integer);
begin
   afficherError( ErrorEvent , 'Ap4')  ;

  ErrorCode:=0;
  ClientSocketAp4.Active := False;
  labelConnexion4.Visible := True;
end;


procedure TForm1.ClientSocketAp4Read(Sender: TObject; Socket: TCustomWinSocket);
begin
//Reads and displays the message received from the server;
    EditReception1.Text := Socket.ReceiveText;
    LabelSent4.Visible := false;
end;

(*********************************************************************
************************ automate ************************************
******************************************************************** *)


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
  end
  else
    CheckBox1.checked:=(i and 1)>0;
  CheckBox2.checked:=(i and 2)>0;
  CheckBox3.checked:=(i and 4)>0;
  CheckBox4.checked:=(i and 8)>0;
  CheckBox5.checked:=(i and 16)>0;
  timer1.enabled:=true;
end;


(* ******************************************************************
*********   Appareil 2 Capacimetre  (Capa, tg)  *********************
******************************************************************* *)

procedure ParametrisationAp2(EditSend : TEdit; Sender: TObject);
var
  text: String;
begin
    (*
    text := ': FUNC : IMP CSD';
    EditSend.Text := text;
    Form1.ButtonSend2Click(Sender);

    : FREQ 100   *)

    ioCapa1.WriteString(': FUNC : IMP CSD', retCountCapa1); // Write to the instrument
    //ioCapa1.ReadString(1000, readResultCapa1); // read the result
    ioCapa1.WriteString(': FREQ 100 ', retCountCapa1); // Write to the instrument
    //ioCapa1.ReadString(1000, readResultCapa1); // read the result
    ioCapa1.WriteString(': TRIG : SOUR BUS', retCountCapa1); // Write to the instrument
    //ioCapa1.ReadString(1000, readResultCapa1); // read the result



end;




(* ******************************************************************
*********   Annalyse Appareil 1 Multimetre **************************
******************************************************************* *)


function StripNonAlphaNumeric(const AValue: string): string;
var
  I : Integer;
begin
Result := '';
  for I := 0 to AValue.Length do
  begin
    if AValue.Chars[I] in ['0'..'9', 'e', 'E', '-', '+', ',' , '.'] then
      Result := Result + AValue.Chars[I]
  end;
end;

function TForm1.ParseResultat(sResult: String) : Double;
var
  lFormatSettings:TFormatSettings;
begin
  sResult := StripNonAlphaNumeric(sResult);
  lFormatSettings.DecimalSeparator := '.';
  Result := StrToFloat(sResult, lFormatSettings);
  memo1.lines.Add(floatToStr(Result));
end;

function AnnalyseResultatAp1(resultat: Double; vRef: Double):Boolean;
// on veut comparer les résultats en microA. : tension / 500ohm * 1000000
// on compare à la colone 'Essais val_1' colonne 0 feuil8 sur Excel
var
  valRef : Double;
begin
  //valRef :=  30000;     // exemple. sera pris de la hashmap
  valRef := vRef;
  if(resultat / 500 * 1000000 > valRef)
  then
    Result := False
  else
    Result := True
end;

procedure TForm1.TraiterResAp1();
var
  resultatDouble : Double;
  tmp : Boolean;
begin
  CbOutput1.checked := false;
  resultatDouble := ParseResultat(EditReception1.Text);
  tmp := AnnalyseResultatAp1( resultatDouble, dictionaryValues[currentCode]['Essais val_1']);
  if(tmp = True)
  then
  begin
    LabelEtat1.Caption := 'OK';

  end
  else
  begin
    LabelEtat1.Caption := 'KO';
    CbOutput1.checked := true;
    SetDigitalChannel(1);
  end;


end;

procedure TForm1.ButtonTestClick(Sender: TObject);
begin
    TraiterResAp1();


end;


end.
