﻿unit K8055;

interface

uses
  Windows, StdCtrls, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Math, Buttons, ScktComp, ActiveX,
  VisaComLib_TLB, Generics.Collections, ComObj, System.Variants, //UChargementFichier;
  uFormConnection, uAppareilMultimetre, uAppareilCapacimetre1,
  uAppareilCapacimetre2, uAppareil, uLog, uUtils;
 // TQueue : http://docs.embarcadero.com/products/rad_studio/delphiAndcpp2009/HelpUpdate2/EN/html/delphivclwin32/Generics_Collections_TQueue.html

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
    GroupBoxOutputs: TGroupBox;
    CbOutput1: TCheckBox;
    CbOutput2: TCheckBox;
    CbOutput3: TCheckBox;
    CbOutput4: TCheckBox;
    CbOutput6: TCheckBox;
    CbOutput5: TCheckBox;
    CbOutput7: TCheckBox;
    SpeedButtonTest: TSpeedButton;
    ButtonDisconnectAutomate: TButton;
    EditFrequence: TEdit;
    Label3: TLabel;
    ButtonFrequence: TButton;
    GroupBoxAutomate: TGroupBox;
    LabelEtatAutomate: TLabel;
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
    LabelTangente_ESR: TLabel;
    EditTangente: TEdit;
    EditTension: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    EditImpedance: TEdit;
    CbACK1: TCheckBox;
    CbACK2: TCheckBox;
    CbACK3: TCheckBox;
    EditCapaNominale: TEdit;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    EditPas1_3: TEdit;
    EditPas3_2: TEdit;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    PanelStats: TPanel;
    Button1: TButton;
    ButtonCloseStats: TButton;
    LabelNbOK: TLabel;
    LabelNbCourantFuite: TLabel;
    LabelNbImpedance: TLabel;
    LabelNbCapaMin: TLabel;
    LabelNbCapaMax: TLabel;
    LabelNbTangente: TLabel;



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
    procedure afficherError( ErrorEvent: TErrorEvent; Mon_appareil : string);
    procedure ClientSocket4OnConnect(Sender: TObject;  Socket: TCustomWinSocket);
    procedure ButtonConnect3Click(Sender: TObject);
    procedure ButtonLoadFileClick(Sender: TObject);
    procedure ButtonTestClick(Sender: TObject);
    procedure TraiterResAp1();
    procedure TraiterResAp2();
    procedure TraiterResAp3();
    procedure ButtonFindValuesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FaireMesureAp1(Sender: TObject);
    procedure FaireMesureAp2(Sender: TObject);
    procedure FaireMesureAp3(Sender: TObject);
    procedure EnvoiTensionAp4();
    procedure EditCapaMinChange(Sender: TObject);
    procedure EditCapaMaxChange(Sender: TObject);
    procedure EditTangenteChange(Sender: TObject);
    procedure EditCapaNominaleChange(Sender: TObject);
    procedure EditEssaisValChange(Sender: TObject);
    procedure EditImpedanceChange(Sender: TObject);
    procedure EditPas1_3Change(Sender: TObject);
    procedure EditPas3_2Change(Sender: TObject);
    procedure ButtonCloseStatsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

  monLog : Log;
  compteurTop1 : Integer;
  compteurTop2 : Integer;
  compteurTop3 : Integer;

  fifoAp1 : TQueue<TResultat>;
  fifoAp3 : TQueue<TResultatsCapa2>;
  pas_1_3 : Integer;
  pas_3_2 : Integer;


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






(* ***************************************************************************
*************            Les appareils de mesures                **************
*************************************************************************** *)

function SeConnecter(memo : TMemo ; EditSend : TEdit; mon_appareil : Appareil; LabelConnexion : TLabel; ButtonConnect : TButton; EditIP : TEdit) : HRESULT;
var
  hResultat : HRESULT;
begin
    LabelConnexion.Visible := False;
    hResultat := S_OK;
    try
        EditIP.Text := mon_appareil.adress;
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




procedure TForm1.ButtonConnect1Click(Sender: TObject);
begin
    appareil1.adress := EditIP2.Text;
    SeConnecter(memo1, EditSend1, appareil1, LabelConnexion1, ButtonConnect1, EditIP1);
end;


procedure TForm1.ButtonConnect2Click(Sender: TObject);
begin
    appareil2.adress := EditIP2.Text;
    SeConnecter(memo1, EditSend2, appareil2, LabelConnexion2, ButtonConnect2, EditIP2);
end;

procedure TForm1.ButtonConnect3Click(Sender: TObject);
begin
    appareil3.adress := EditIP3.Text;
    SeConnecter(memo1, EditSend3, appareil3, LabelConnexion3, ButtonConnect3, EditIP3);
end;




(**********************************************************************
*********            Chargement du fichier         ********************
******************************************************************** *)
procedure Gestion_Tangente_ESR(LabelTangente_ESR : TLabel; memo : TMemo);
var
    TypeMesure : TMesure;
begin
    TypeMesure := TMesure(Round((dictionaryValues[currentCode])['Essais lib_0']));
    if(TypeMesure = TMesure.ESR) then
    begin
       appareil2.ConfigurerESR(memo);
       LabelTangente_ESR.Caption := 'ESR :';
    end
    else
    begin
        // à modifier par la suite en fonction du mot motTangente
        // ici par défaut, si absence de ESR, on estime Tangente.
        appareil2.ConfigurerTangente(memo) ;
        LabelTangente_ESR.Caption := 'Tangente :';
    end;
end;

function Caste_Tangente_ESR(stgValeur : string) : Double;
var
    stg : string;
    motTangente : string;
    motESR : string;
begin
    motTangente := 'Tg maxi';
    motESR := 'ESR';
    stg := ' ' + stgValeur; // espace devant pour eviter la position0
    if(Pos(motESR, stg) <> 0) then  // presence du mot ESR. on utilise l'enum du capa1 pour la valeur Double
        Result := Double(Ord(TMesure.ESR))
    else
        // à modifier par la suite en fonction du mot motTangente
        // ici par défaut, si absence de ESR, on estime Tangente.
        Result := Double(Ord(TMesure.Tangente));
end;

function calculFrequence(val : Double) : Integer;
var
    vitesseMin : Integer;
    vitesseMax : Integer;
    resDouble : Double;   // pour garder un peu de precision
    coeff : Double;

begin
    vitesseMin := 30;
    vitesseMAx := 70;
    coeff := (vitesseMax - vitesseMin)/9;
    // effectuons la formule générale (en %) :
    resDouble := (coeff * val) + vitesseMax - coeff;
    // Normalisons entre 0 et 255 pour l'automate :
    resDouble := resDouble * 2.55;

    // Retournons l'entier
    Result := Round(resDouble);
end;


function LireFichier(memo : TMemo): HRESULT;
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
    result := S_FALSE;
  // ouvre excel
    vMSExcel := CreateOleObject('Excel.Application');
    vMSExcel.Visible := false;

    sFileName := 'liste.xlsx';
    // ouvre le fichier en lecture seule
    sFullName := GetCurrentDir + '\' + sFileName;
    vLink := unassigned;
    try
        vReadOnly := true;
        vXLWorkbooks := vMSExcel.Workbooks;
        vXLWorkbook := vXLWorkbooks.Open(sFullName, vLink, vReadOnly);
    except
      on E: Exception do
        begin
          ShowMessage(E.message + sLineBreak + 'Vérifiez d''avoir un fichier "liste.xlsx" dans votre dossier !');
          //result := S_FALSE;
          vMSExcel.Quit;
          vMSExcel := Unassigned;
          exit;
        end
    end;


    // remplissage de la 1ere hashmap  :

    // acces a la feuille voulue
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
      try
           dictionaryRef.Add(sValue1, sValue2);
      except
      on E: Exception do
        begin
          ShowMessage(E.message + sLineBreak + 'ligne ' + IntToStr(j) + ' : ' + sValue1 + ' -> ' + sValue2);
          vMSExcel.Quit;
          vMSExcel := Unassigned;
          result := S_FALSE;
          exit;
        end
      end;
      //dictionaryRef.Add(sValue1, sValue2);

      Inc(j, 1);

      sRange1 := 'A' + IntToStr(j);
      vCell := vWorksheet.Range[sRange1];
      sValue1 := vCell.Value;
    end;

    // remplissage de la 2eme hashmap  :

    // acces de la feuille voulue
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

      sRange2 := 'L1';       // ICI il s'agit de la colonne en string indiquant si Tangente ou ESR
      vCell := vWorksheet.Range[sRange2];
      sValue2 := vCell.Value;
      sRange3 := 'L' + IntToStr(j)  ;
      vCell := vWorksheet.Range[sRange3];
      sValue3 := vCell.Value;
      tmpDict.Add(sValue2, Caste_Tangente_ESR(sValue3));


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

      sRange2 := 'G1';
      vCell := vWorksheet.Range[sRange2];
      sValue2 := vCell.Value;
      sRange3 := 'G' + IntToStr(j)  ;
      vCell := vWorksheet.Range[sRange3];
      sValue3 := vCell.Value;
      tmpDict.Add(sValue2, StrToFloat(sValue3, lFormatSettings));

      sRange2 := 'R1';
      vCell := vWorksheet.Range[sRange2];
      sValue2 := vCell.Value;
      sRange3 := 'R' + IntToStr(j)  ;
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
    Result := S_OK;
    //Gestion_Tangente_ESR();

end;

procedure ChargementFile(memo : TMemo; buttonFollowing : TButton);
var
    hresultat : HRESULT;
begin
    memo.Lines.Add('Chargement du fichier excel...') ;
    dictionaryRef:= TDictionary<String, String>.create;
    dictionaryValues := TDictionary<String,Tdictionary<String, Double>>.create;
    hresultat := LireFichier(memo); // lecture du fichier
    if hresultat = S_OK then
    begin
        memo.Lines.Add('   >> Chargement du fichier terminé avec succes !') ;
        buttonFollowing.Enabled := True;
    end
    else
        memo.Lines.Add('   >> ERROR : erreur survenue lors du chargementt du fichier');
    //ButtonLoadFile.Enabled := False;
end;



procedure TForm1.ButtonLoadFileClick(Sender: TObject);
begin
  LabelEnCours.Visible := True;
  ChargementFile(memo1, ButtonFindValues);
  LabelEnCours.Visible := False;
end;

procedure TForm1.ButtonFindValuesClick(Sender: TObject);
var
  tmp : Integer;
begin
  if(not dictionaryRef.ContainsKey(EditCodeLu.Text)) then
  begin
      ShowMessage('Oups... Désolé.' + sLineBreak + 'Il semblerait que cette référence ne soit pas mentionnée dans le fichier que j''ai chargé.'
                    + sLineBreak + 'Veuillez réessayer !');
      exit;

  end;
  try
      currentCode := dictionaryRef[EditCodeLu.Text];
      Gestion_Tangente_ESR(LabelTangente_ESR, memo1);

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
      EditCapaNominale.Text :=  (dictionaryValues[currentCode])['Capacité nominale'].ToString;
      appareil2.valeurCapaNominale := (dictionaryValues[currentCode])['Capacité nominale'];
      tmp := calculFrequence((dictionaryValues[currentCode])['Temps de charge (s)']);
      EditFrequence.Text :=  tmp.ToString;
      //OutputAnalogChannel(1,(dictionaryValues[currentCode])['Temps de charge (s)']);
      OutputAnalogChannel(1, tmp);

  except on E: Exception do
      ShowMessage(E.message + sLineBreak + 'Peut-etre votre organisation du fichier Excel a-t-elle changé ?'
                  + sLineBreak + 'Pour ma part j''ai besoin de :'
                  + sLineBreak + '"Essais val_1" colonne O'
                  + sLineBreak + '"Cap_lim_bas" colonne J'
                  + sLineBreak + '"Cap_lim_haut" colonne K'
                  + sLineBreak + '"Essais lib_0" colonne L'
                  + sLineBreak + '"Essais val_0" colonne M'
                  + sLineBreak + '"Essais val_2" colonne P'
                  + sLineBreak + '"Tension nominale" colonne F '
                  + sLineBreak + '"Capacité nominale" colonne G '
                  + sLineBreak + '"Temps de charge (s)" colonne R'
              );
  end;
  EnvoiTensionAp4();
  OutputAnalogChannel(1,strtoint(EditFrequence.Text));
end;



(*********************************************************************
************************ automate ************************************
******************************************************************** *)
procedure TForm1.ButtonDisconnectAutomateClick(Sender: TObject);
begin
    CloseDevice;
    LabelEtatAutomate.caption:='Disconnected' ;
end;


procedure TForm1.ButtonConnectAutomateClick(Sender: TObject);
var h,CardAddr:integer;
//out_digital: longint;
//out_analog: array[0..1] of longint;
begin
  pas_1_3 := StrToInt(EditPas1_3.Text);
  pas_3_2 := StrToInt(EditPas3_2.Text);

  CardAddr:= 3-(integer(sk5.Checked) + integer(sk6.Checked) * 2);
  h:= OpenDevice(CardAddr);
  case h of
    0..3: LabelEtatAutomate.caption:='Card '+ inttostr(h)+' connected';
    -1: LabelEtatAutomate.caption:='Card '+ inttostr(CardAddr)+' not found';
  end;
  if h>=0 then
    Timer1.Enabled:=True;
  ClearAllDigital;

  //EditPas1_3.Enabled := False;
  //EditPas3_2.Enabled := False;

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
    // sera le point de depart pour préciser qu'on change de composant pour le log
    Inc(compteurTop1, 1);
    memo1.Lines.Add('compteurTop1 -> ' + IntToStr(compteurTop1));
    CheckBox1.Checked := True;
    FaireMesureAp1(Sender);
    TraiterResAp1();
  end
  else
    CheckBox1.checked:=(i and 1)>0;

  if((not CheckBox2.Checked) and ((i and 2)>0))
  then
  begin
    Inc(compteurTop2, 1);
    memo1.Lines.Add('compteurTop2 -> ' + IntToStr(compteurTop2));
    CheckBox2.Checked := True;
    FaireMesureAp2(Sender);
    TraiterResAp2();
  end
  else
    CheckBox2.checked:=(i and 2)>0;

  if((not CheckBox3.Checked) and ((i and 4)>0))
  then
  begin
    Inc(compteurTop3, 1);
    memo1.Lines.Add('compteurTop3 -> ' + IntToStr(compteurTop3));
    CheckBox3.Checked := True;
    FaireMesureAp3(Sender);
    TraiterResAp3();
  end
  else
    CheckBox3.checked:=(i and 4)>0;
  //CheckBox4.checked:=(i and 8)>0;
  //CheckBox5.checked:=(i and 16)>0;
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

(* Ici du 1er appareil a effectué une mesure sur un composant précis.
On ne log pas tout de suite les résultats : on stocke donc le résultat dans la pile
*)

procedure TForm1.TraiterResAp1();
var
  res : Boolean;
  fifoElmt : TResultat;
begin
  CbOutput1.checked := false;
  fifoElmt := appareil1.Traiter_donnee(EditReception1.Text);
  fifoAp1.Enqueue(fifoElmt);
  res := fifoElmt.Annalyse;
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

procedure TForm1.FaireMesureAp1(Sender: TObject);
begin
    EditSend1.Text := appareil1.instruction;
    LabelSent1.Visible := true;
    EditReception1.Text := appareil1.Mesurer();
    memo1.Lines.Add('Instruction de mesure envoyé à l''appareil_1');
    LabelSent1.Visible := false;
    //TraiterResAp1();
end;


procedure TForm1.ButtonSend1Click(Sender: TObject);
var
    str : string;
begin
    str := appareil1.Send(EditSend1.Text, cbACK3.Checked);
    memo1.Lines.Add('message envoyé à l''appareil 1');
    EditReception1.Text := str;
end;

(* *******************************************************************
*********   Annalyse Appareil 2 Capacimetre **************************
*********     Capacite + Tangente           **************************
******************************************************************* *)

(* Ici il s'agit du dernier appareil a effectué une mesure sur un composant précis.
On récupère donc les différentes valeurs dans les fifo concernant ce composant pour log.
*)
procedure TForm1.TraiterResAp2();
var
  res : TBoolList;
  fifoElmt : TResultats;
begin
  SetLength(res, 3);
  fifoElmt := appareil2.Traiter_donnee(EditReception2.Text);
  if compteurTop2 >= (pas_1_3 + pas_3_2) then
  begin
      monLog.LogComposant( fifoAp1.Dequeue, fifoElmt, fifoAp3.Dequeue);
      Memo1.Lines.Add('Je souhaite imprimer dans le fichier !');
  end;

  res := fifoElmt.Annalyse;
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
  if(res[3] = True)
  then
  begin
    LabelEtat2.Caption := LabelEtat2.Caption + ' - OK';
    CbOutput5.checked := false;
    ClearDigitalChannel(5);
  end
  else
  begin
    LabelEtat2.Caption := LabelEtat2.Caption  + ' - KO';
    CbOutput5.checked := true;
    SetDigitalChannel(5);
  end;
end;

procedure TForm1.FaireMesureAp2(Sender: TObject);
begin
    EditSend2.Text := appareil2.instruction;
    LabelSent2.Visible := true;
    EditReception2.Text := appareil2.Mesurer();
    LabelSent2.Visible := false;
    memo1.Lines.Add('Instruction de mesure envoyé à l''appareil_2: cpt = ' + IntToStr(compteurTop2));
    //TraiterResAp2();
end;



procedure TForm1.ButtonSend2Click(Sender: TObject);
var
    str : string;
begin
    str := appareil2.Send(EditSend2.Text, cbACK2.Checked);
    memo1.Lines.Add('message envoyé à l''appareil 2');
    EditReception2.Text := str;
end;


(* *******************************************************************
*********   Annalyse Appareil 3 Capacimetre **************************
*********         Impedance                 **************************
******************************************************************* *)
procedure TForm1.TraiterResAp3();
var
  res : TBoolList;
  fifoElmt : TResultatsCapa2;
begin
  fifoElmt := appareil3.Traiter_donnee(EditReception3.Text);
  if compteurTop3 >= (pas_1_3) then
      fifoAp3.Enqueue(fifoElmt);
  res := fifoElmt.Annalyse;
  if(res[0] = True)
  then
  begin
    LabelEtat3.Caption := 'OK';
    CbOutput6.checked := false;
    ClearDigitalChannel(6);
  end
  else
  begin
    LabelEtat3.Caption := 'KO';
    CbOutput6.checked := true;
    SetDigitalChannel(6);
  end;
  if(res[1] = True)
  then
  begin
    LabelEtat3.Caption := LabelEtat3.Caption + ' - OK';
    CbOutput7.checked := false;
    ClearDigitalChannel(7);
  end
  else
  begin
    LabelEtat3.Caption := LabelEtat3.Caption + ' - KO';
    CbOutput7.checked := true;
    SetDigitalChannel(7);
  end;
end;


procedure TForm1.FaireMesureAp3(Sender: TObject);
begin
    EditSend3.Text := appareil3.instruction;
    LabelSent3.Visible := true;
    EditReception3.Text := appareil3.Mesurer();
    memo1.Lines.Add('Instruction de mesure envoyé à l''appareil_3 : cpt = ' + IntToStr(compteurTop3));
    LabelSent3.Visible := false;
    //TraiterResAp3();
end;

procedure TForm1.ButtonSend3Click(Sender: TObject);
var
    str : string;
begin
    str := appareil3.Send(EditSend3.Text, cbACK3.Checked);
    memo1.Lines.Add('message envoyé à l''appareil 3');
    EditReception3.Text := str;
end;

(*************************************************************************
************* Connection a l'appareil 4 : ClientSocket *******************
************************************************************************** *)

procedure TForm1.ClientSocket4Disconnect(Sender: TObject;  Socket: TCustomWinSocket);
begin
   Socket.SendText('Disconnected');//Send the ÂDisconnectedÂ message to the server
//str is set to Disconnected when the Disconnect button is pressed
//A client cannot send messages if it is not connected to a server
   ButtonSend4.Enabled:=False;
   ButtonConnect4.Caption:='Connect';
   LabelConnexion4.Caption := 'Déconnecté';
    LabelConnexion4.Visible := True;
end;

procedure TForm1.ButtonConnect4Click(Sender: TObject);
begin
    //127.0.0.1 is the standard IP address to loop back to your own machine
    ClientSocketAp4.Address:= EditIP4.Text ;  //'127.0.0.1';
    ClientSocketAp4.Port:= StrToInt(EditPort4.Text) ;
    ClientSocketAp4.Active := True;//Activates the client
    LabelConnexion4.Caption := 'Connecté';
    LabelConnexion4.Visible := True;
end;



procedure TForm1.ClientSocket4OnConnect(Sender: TObject;  Socket: TCustomWinSocket);
var
    str : string;
begin
   LabelConnexion4.Caption := 'Connecté';
   ButtonSend4.Enabled:= True;
   // envoi des instructions
   str := 'SYSTem:LOCK ON';
   EditSend4.Text := str;
   ClientSocketAp4.Socket.SendText(AnsiString(str));//Send the messages to the server
   Memo1.Lines.Add('Envoi à l''appareil4 de : ' + EditSend4.Text);
   str := 'VOLT ' + (dictionaryValues[currentCode])['Tension nominale'].ToString;;
   EditSend4.Text := str;
   ClientSocketAp4.Socket.SendText(AnsiString(str));//Send the messages to the server
   //LabelSent4.Visible := true;
   Memo1.Lines.Add('Envoi à l''appareil4 de : ' + EditSend4.Text);
   // Activation de la sortie
   str := 'OUTPut ON';
   EditSend4.Text := str;
   ClientSocketAp4.Socket.SendText(AnsiString(str));//Send the messages to the server
   Memo1.Lines.Add('Envoi à l''appareil4 de : ' + EditSend4.Text);
end;

procedure TForm1.ButtonSend4Click(Sender: TObject);
var
    str : String;
begin
    str := EditSend4.Text;
    ClientSocketAp4.Socket.SendText(AnsiString(str));//Send the messages to the server
    LabelSent4.Visible := true;
end;

procedure TForm1.afficherError( ErrorEvent: TErrorEvent; Mon_appareil : string);
begin
   if ErrorEvent=eeGeneral then
    Memo1.Lines.Add(Mon_appareil + ' : Erreur inattendu');

  if ErrorEvent=eeSend then
     Memo1.Lines.Add(Mon_appareil + ' : Erreur d''ecriture sur la connexion socket');

  if ErrorEvent=eeReceive then
    Memo1.Lines.Add(Mon_appareil +' : Erreur de lecture sur la connexion socket');

  if ErrorEvent=eeConnect then
    Memo1.Lines.Add(Mon_appareil + ' : Une demande de connexion deja  acceptee n''a pas pu etre achevee');

  if ErrorEvent=eeDisconnect then
    Memo1.Lines.Add(Mon_appareil + ' : Erreur de fermeture d''une connexion');

  if ErrorEvent=eeAccept then
    Memo1.Lines.Add(Mon_appareil + ' : Erreur d''acceptation d''une demande de connexion cliente');

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
    EditReception4.Text := String(Socket.ReceiveText);
    LabelSent4.Visible := false;
end;

procedure TForm1.EditCapaMaxChange(Sender: TObject);
begin
    appareil2.valeurCapaMax := StrToFloat(EditCapaMax.Text);
end;

procedure TForm1.EditCapaMinChange(Sender: TObject);
begin
    appareil2.valeurCapaMin := StrToFloat(EditCapaMin.Text);
end;

procedure TForm1.EditCapaNominaleChange(Sender: TObject);
begin
    appareil2.valeurCapaNominale := StrToFloat(EditCapaNominale.Text);
end;

procedure TForm1.EditEssaisValChange(Sender: TObject);
begin
    appareil1.valeurRef := StrToFloat(EditEssaisVal.Text);
end;

procedure TForm1.EditImpedanceChange(Sender: TObject);
begin
    appareil3.valeurImpedance := StrToFloat(EditImpedance.Text);
end;

procedure TForm1.EditPas1_3Change(Sender: TObject);
begin
    pas_1_3 := StrToInt(EditPas1_3.Text);
end;

procedure TForm1.EditPas3_2Change(Sender: TObject);
begin
    pas_3_2 := StrToInt(EditPas3_2.Text);
end;

procedure TForm1.EditTangenteChange(Sender: TObject);
begin
    appareil2.valeurTangente := StrToFloat(EditTangente.text);
end;

procedure TForm1.EnvoiTensionAp4();
begin
    try

        // connexion au serveur
        ClientSocketAp4.Address:= EditIP4.Text ;  //'127.0.0.1';
        ClientSocketAp4.Port:= StrToInt(EditPort4.Text) ;
        ClientSocketAp4.Active := True;//Activates the client
        LabelConnexion4.Visible := True;


    except on E: Exception do
        begin
              ShowMessage(E.message + sLineBreak + 'Il semblerait que l''appareil se soit déconnecté avant la fin des envois d''instructions.');
        end;
    end;

end;





(* *************************************************************************
*************       Configuration initiale         *************************
*************************************************************************** *)

procedure TForm1.FormCreate(Sender: TObject);
var
  formConnect : TFormConnection;
begin
(*Canvas.InitializeBitmap(BitmapGood1);   *)
   //SetCounterDebounceTime(1,2);
   Timer1.Interval := 200;
   // on cre les differents appareils pour les connexions
   appareil1 := AppareilMultimetre.Create;
   appareil2 := AppareilCapacimetre1.Create;
   appareil3 := AppareilCapacimetre2.Create;
   monLog := Log.Create;
   fifoAp1 := TQueue<TResultat>.Create;
   fifoAp3 := TQueue<TResultatsCapa2>.Create;

   // ici rien ne s'affiche, cette Form n'est pas encore cree.
   // nous allons donc crÃ©er une fenetre TFormConnection pour tenir informer de ce qui se fait.
   formConnect := TFormConnection.Create(self);
   formConnect.Show;

   //on connecte tout d'abord les diffÃ©rents appareils
   formConnect.AddMemoLine('Connexion a l''appareil 1 : le Multimetre');
   try
      SeConnecter(memo1, EditSend1, appareil1, LabelConnexion1, ButtonConnect1, EditIP1);
   finally
      formConnect.AddMemoLine('  >> ' + LabelConnexion1.Caption);
      try
        formConnect.AddMemoLine('Configuration de l''appareil 1');
        if(ButtonConnect1.Enabled = false)then
          Configurer(memo1, EditSend1, appareil1, LabelConnexion1, ButtonConnect1);
      finally
          formConnect.AddMemoLine('  >> ' + LabelConnexion1.Caption);
          formConnect.AddMemoLine('Connexion a l''appareil 2 : le Capacimetre');
          try
              SeConnecter(memo1, EditSend2, appareil2, LabelConnexion2, ButtonConnect2, EditIP2);
          finally
              formConnect.AddMemoLine('  >> ' + LabelConnexion2.Caption);
              try
                formConnect.AddMemoLine('Configuration de l''appareil 2');
                  if(ButtonConnect2.Enabled = false)then
                      Configurer(memo1, EditSend2, appareil2, LabelConnexion2, ButtonConnect2);
              finally
                  formConnect.AddMemoLine('  >> ' + LabelConnexion2.Caption);
                  formConnect.AddMemoLine('Connexion a l''appareil 3 : le 2eme Capacimetre');
                  try
                      SeConnecter(memo1, EditSend3, appareil3, LabelConnexion3, ButtonConnect3, EditIP3);
                  finally
                      formConnect.AddMemoLine('  >> ' + LabelConnexion3.Caption);
                      try
                        formConnect.AddMemoLine('Configuration de l''appareil 3');
                          if(ButtonConnect3.Enabled = false)then
                              Configurer(memo1, EditSend3, appareil3, LabelConnexion3, ButtonConnect3);
                      finally
                        formConnect.AddMemoLine('  >> ' + LabelConnexion3.Caption);
                        ChargementFile(formConnect.memo, ButtonFindValues);
                        formConnect.AddMemoLine('Connexion à l''automate');
                        ButtonConnectAutomateClick(Sender);
                        formConnect.AddMemoLine('  >> ' + LabelEtatAutomate.Caption);
                      end;
                  end;
              end;
          end;
      end;
   end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseDevice;
end;



(* ****************************************************************************
*************           TEST              *************************************
***************************************************************************** *)

procedure TForm1.ButtonTestClick(Sender: TObject);
begin
    TraiterResAp1();
    Inc(compteurTop2,1);
    TraiterResAp2();
    Inc(compteurTop3,1);
    TraiterResAp3();
end;


(* ****************************************************************************
*************           TEST              *************************************
***************************************************************************** *)


procedure TForm1.Button1Click(Sender: TObject);
begin
    PanelStats.Visible := true;
    LabelNbOK.Caption := 'Nombre de composants conformes : ' + IntToStr(monLog.nbOK);
    LabelNbCourantFuite.Caption := 'Nombre de défauts courant de fuite : ' + IntToStr(monLog.nbCourantFuite);
    LabelNbImpedance.Caption := 'Nombre de défauts d''impédance : ' + IntToStr(monLog.nbImpedance);
    LabelNbCapaMin.Caption := 'Nombre de défauts capa (-) : ' + IntToStr(monLog.nbCapaMin);
    LabelNbCapaMax.Caption := 'Nombre de défauts capa (+) : ' + IntToStr(monLog.nbCapaMax);
    LabelNbTangente.Caption := 'Nombre de défauts tangente : '+ IntToStr(monLog.nbTangente);
end;

procedure TForm1.ButtonCloseStatsClick(Sender: TObject);
begin
    PanelStats.Visible := false;
end;



end.
