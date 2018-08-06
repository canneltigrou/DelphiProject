unit K8055;

interface

uses
  Windows, FMX.StdCtrls, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Math, Buttons,ScktComp(* , FMX.StdCtrls *);

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    SK6: TCheckBox;
    SK5: TCheckBox;
    Timer1: TTimer;
    ButtonConnectAutomate: TButton;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBoxOutputs: TGroupBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CbOutputAp1: TCheckBox;
    CbOutputAp2: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    GroupBox4: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Timer2: TTimer;
    SpeedButtonTest: TSpeedButton;
    GroupBox10: TGroupBox;
    Button8: TButton;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button10: TButton;
    ButtonDisconnectAutomate: TButton;
    EditFrequence: TEdit;
    Label3: TLabel;
    ButtonFrequence: TButton;
    EditIP1: TEdit;

    //adresse: string; // adresse IP
    //port: integer;
    EditPort1: TEdit;
    LabelPort1: TLabel;
    EditIP2: TEdit;
    EditPort2: TEdit;
    GroupBoxAutomate: TGroupBox;
    GroupBoxAp1: TGroupBox;
    Label12: TLabel;
    GroupBoxAp2: TGroupBox;
    GroupBoxAp4: TGroupBox;
    EditIP4: TEdit;
    EditPort4: TEdit;
    LabelRecuAp1: TLabel;
    EditRecuAp1: TEdit;
    EditRecuAp2: TEdit;
    EditRecuAp4: TEdit;
    LabelRecuAp2: TLabel;
    LabelRecuAp4: TLabel;
    ImageAp1: TImage;
    ImageAp2: TImage;
    ImageAp4: TImage;
    ClientSocketAp1: TClientSocket;
    ClientSocketAp2: TClientSocket;
    ClientSocketAp3: TClientSocket;
    ClientSocketAp4: TClientSocket;
    ServerSocket: TServerSocket;
    LabelEtatConnexion: TLabel;
    ButtonEnvoiBroadcast: TButton;
    Label1: TLabel;
    EditEnvoiBroadcast: TEdit;
    GroupBoxServer: TGroupBox;
    ButtonStartServer: TButton;
    GroupBoxAp3: TGroupBox;
    LabelRecuAp3: TLabel;
    ImageAp3: TImage;
    EditIP3: TEdit;
    EditPort3: TEdit;
    EditRecuAp3: TEdit;

    procedure FormCreate(Sender: TObject);

    procedure ButtonConnectAutomateClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButtonTestClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button8Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure CbOutputAp1Click(Sender: TObject);
    procedure CbOutputAp2Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure ButtonDisconnectAutomateClick(Sender: TObject);
    procedure ButtonFrequenceClick(Sender: TObject);
    procedure ButtonEnvoiBroadcastClick(Sender: TObject);
    procedure ServerSocketClientConnect(Sender: TObject;  Socket: TCustomWinSocket);
    procedure ButtonStartServerClick(Sender: TObject);
    procedure ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);

  private
    { Private declarations }
  public
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



procedure TForm1.Timer1Timer(Sender: TObject);
var i, Data1, Data2: integer;
begin
  timer1.enabled:=false;
  Edit1.text:=inttostr(ReadCounter(1));
  ReadAllAnalog(Data1,Data2);
  i:=ReadAllDigital;
  CheckBox1.checked:=(i and 1)>0;
  CheckBox2.checked:=(i and 2)>0;
  CheckBox3.checked:=(i and 4)>0;
  CheckBox4.checked:=(i and 8)>0;
  CheckBox5.checked:=(i and 16)>0;
  timer1.enabled:=true;
end;


procedure TForm1.Timer2Timer(Sender: TObject);
begin
    ClearDigitalChannel(n);
    TCheckBox(Form1.FindComponent('CheckBox'+inttostr(n+5))).checked:=false;
    inc(n);
    if n=9 then n:=1;
    TCheckBox(Form1.FindComponent('CheckBox'+inttostr(n+5))).checked:=true;
    SetDigitalChannel(n);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SetAllDigital;
  CbOutputAp1.checked:=true;
  CbOutputAp2.checked:=true;
  CheckBox8.checked:=true;
  CheckBox9.checked:=true;
  CheckBox10.checked:=true;
  CheckBox11.checked:=true;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  ClearAllDigital;
  CbOutputAp1.checked:=false;
  CbOutputAp2.checked:=false;
  CheckBox8.checked:=false;
  CheckBox9.checked:=false;
  CheckBox10.checked:=false;
  CheckBox11.checked:=false;
end;

// Ici : un client se connecte, normalement un appareil de mesure
procedure TForm1.ServerSocketClientConnect(Sender: TObject;  Socket: TCustomWinSocket);
begin
  Socket.SendText('Connected');//Sends a message to the client
//If at least a client is connected to the server, then the server can communicate
//Enables the Send button and the edit box
  ButtonEnvoiBroadcast.Enabled:=true;
  EditIP1.Text := Socket.LocalAddress;
  EditPort1.Text := Socket.LocalPort.ToString;
end;



procedure TForm1.SpeedButtonTestClick(Sender: TObject);
begin
  //timer2.enabled:=SpeedButton1.Down;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ResetCounter(1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ResetCounter(2);
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
var t1:integer;
begin
  case RadioGroup1.ItemIndex of
    0: t1:=0;
    1: t1:=2;
    2: t1:=10;
    3: t1:=1000;
  end;
  SetCounterDebounceTime(1,t1);
end;



procedure TForm1.Button8Click(Sender: TObject);
var k: integer;
CardFound: boolean;
begin
  CardFound:=False;
  Timer1.Enabled:= False;
  RadioButton1.Enabled:=False;
  RadioButton2.Enabled:=False;
  RadioButton3.Enabled:=False;
  RadioButton4.Enabled:=False;   
  k:=SearchDevices;
  if k > 0 then
  begin
    Timer1.Enabled:=True;
    Label12.caption:='Connected';
  end;
  if (k and 1)>0 then
  begin
    CardFound:=True;
    RadioButton1.Enabled:=True;
    RadioButton1.Checked:=True;
    SetCurrentDevice(0);
  end;
  if (k and 2)>0 then
  begin
    RadioButton2.Enabled:=True;
    if not CardFound then
    begin
      CardFound:=True;
      RadioButton2.Checked:=True;
      SetCurrentDevice(1);
    end;
  end;
  if (k and 4)>0 then
  begin
    RadioButton3.Enabled:=True;
    if not CardFound then
    begin
      CardFound:=True;
      RadioButton3.Checked:=True;
      SetCurrentDevice(2);
    end;
  end;
  if (k and 8)>0 then
  begin
    RadioButton4.Enabled:=True;
    if not CardFound then
    begin
      RadioButton4.Checked:=True;
      SetCurrentDevice(3)
    end;
  end; 
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


procedure TForm1.ButtonFrequenceClick(Sender: TObject);
begin
  OutputAnalogChannel(1,strtoint(EditFrequence.Text));
  //SetPWM(1,255-TrackBar1.position,2);
end;

procedure TForm1.ButtonStartServerClick(Sender: TObject);

begin
   if(ServerSocket.Active = False)//The button caption is ‘Start’
   then
   begin
      ServerSocket.Active := True;//Activates the server socket
      LabelEtatConnexion.Caption:='Server Started';
      ButtonStartServer.Caption:='Stop';//Set the button caption
   end
   else//The button caption is ‘Stop’
   begin
      ServerSocket.Active := False;//Stops the server socket
      LabelEtatConnexion.Caption:= 'Server Stopped';
      ButtonStartServer.Caption:='Start';
     //If the server is closed, then it cannot send any messages
      //Button1.Enabled:=false;//Disables the “Send” button
      //Edit1.Enabled:=false;//Disables the edit box
   end;
end;

procedure TForm1.Button10Click(Sender: TObject);
var out_digital: integer;
out_analog: array[0..1] of integer;
begin
  out_digital:=ReadBackDigitalOut;
  ReadBackAnalogOut(@out_analog[0]);
  CbOutputAp1.checked:=(out_digital and 1)>0;
  CbOutputAp2.checked:=(out_digital and 2)>0;
  CheckBox8.checked:=(out_digital and 4)>0;
  CheckBox9.checked:=(out_digital and 8)>0;
  CheckBox10.checked:=(out_digital and 16)>0;
  CheckBox11.checked:=(out_digital and 32)>0;
end;

procedure TForm1.CbOutputAp1Click(Sender: TObject);
begin
  if CbOutputAp1.checked then SetDigitalChannel(1)
    else ClearDigitalChannel(1);
end;

procedure TForm1.CbOutputAp2Click(Sender: TObject);
begin
  if CbOutputAp2.checked then SetDigitalChannel(2)
    else ClearDigitalChannel(2);
end;

procedure TForm1.CheckBox8Click(Sender: TObject);
begin
  if CheckBox8.checked then SetDigitalChannel(3)
    else ClearDigitalChannel(3);
end;

procedure TForm1.CheckBox9Click(Sender: TObject);
begin
  if CheckBox9.checked then SetDigitalChannel(4)
    else ClearDigitalChannel(4);
end;



procedure TForm1.CheckBox10Click(Sender: TObject);
begin
  if CheckBox10.checked then SetDigitalChannel(5)
    else ClearDigitalChannel(5);
end;

procedure TForm1.CheckBox11Click(Sender: TObject);
begin
  if CheckBox11.checked then SetDigitalChannel(6)
    else ClearDigitalChannel(6);
end;



procedure TForm1.ButtonDisconnectAutomateClick(Sender: TObject);
begin
    CloseDevice;
    RadioButton1.enabled:=false;
    RadioButton2.enabled:=false;
    RadioButton3.enabled:=false;
    RadioButton4.enabled:=false;
    RadioButton1.checked:=false;
    RadioButton2.checked:=false;
    RadioButton3.checked:=false;
    RadioButton4.checked:=false;
    label12.caption:='Disconnected'
end;

(* Bouton test : permet d'envoyer la commande spécifié dans la textBox.
sera exécuté automatiquement par la suite  *)
procedure TForm1.ButtonEnvoiBroadcastClick(Sender: TObject);
        var
  i: integer;
begin
     sInstuctionBroadcast :=EditEnvoiBroadcast.Text;//Take the string (message) sent by the server
     EditEnvoiBroadcast.Text:='';//Clears the edit box
     //Sends the messages to all clients connected to the server
     for i:=0 to ServerSocket.Socket.ActiveConnections-1 do
        ServerSocket.Socket.Connections[i].SendText(sInstuctionBroadcast);//Sent
end;


procedure TForm1.FormCreate(Sender: TObject);

begin
(*Canvas.InitializeBitmap(BitmapGood1);   *)
BitmapGood := TBitmap.Create;
BitmapGood.LoadFromFile('Good.png');
BitmapBad := TBitmap.Create;
BitmapBad.LoadFromFile('Bad.png');
ImageAp1.Picture.Bitmap := BitmapGood;
ImageAp1.Show;

end;

procedure TForm1.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
Begin
//Read the message received from the client and add it to the memo text
// The client identifier appears in front of the message
  EditRecuAp1.Text:= Socket.ReceiveText;
end;

end.


