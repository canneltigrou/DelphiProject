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
    GroupBoxInputs: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBoxOutputs: TGroupBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CbOutputAp1: TCheckBox;
    CbOutputAp2: TCheckBox;
    CbOutputAp3: TCheckBox;
    CbOutputAp4: TCheckBox;
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
    LabelAdressIP4: TLabel;
    LabelPort4: TLabel;
    ButtonConnect4: TButton;
    LabelEnvoi4: TLabel;
    EditSend4: TEdit;
    ButtonTop: TButton;
    ButtonSend4: TButton;
    LabelEtat4: TLabel;
    CbTypeAp4: TComboBox;
    GroupBoxAp3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LabelEtat3: TLabel;
    EditIP3: TEdit;
    EditPort3: TEdit;
    EditReception3: TEdit;
    ButtonConnect3: TButton;
    EditSend3: TEdit;
    ButtonSend3: TButton;
    CbTypeAp3: TComboBox;
    GroupBoxAp2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    LabelEtat2: TLabel;
    EditIP2: TEdit;
    EditPort2: TEdit;
    EditReception2: TEdit;
    ButtonConnect2: TButton;
    EditSend2: TEdit;
    ButtonSend2: TButton;
    CbTypeAp2: TComboBox;
    GroupBoxAp1: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    LabelEtat1: TLabel;
    EditIP1: TEdit;
    EditPort1: TEdit;
    EditReception1: TEdit;
    ButtonConnect1: TButton;
    EditSend1: TEdit;
    ButtonSend1: TButton;
    CbTypeAp1: TComboBox;
    LabelConnexion1: TLabel;
    LabelConnexion3: TLabel;
    LabelConnexion2: TLabel;
    LabelConnexion4: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label15: TLabel;

    procedure FormCreate(Sender: TObject);

    procedure ButtonConnectAutomateClick(Sender: TObject);
    procedure SpeedButtonTestClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure CbOutputAp1Click(Sender: TObject);
    procedure CbOutputAp2Click(Sender: TObject);
    procedure CbOutputAp3Click(Sender: TObject);
    procedure CbOutputAp4Click(Sender: TObject);
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
  CbOutputAp3.checked:=(out_digital and 4)>0;
  CbOutputAp4.checked:=(out_digital and 8)>0;
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

procedure TForm1.CbOutputAp3Click(Sender: TObject);
begin
  if CbOutputAp3.checked then SetDigitalChannel(3)
    else ClearDigitalChannel(3);
end;

procedure TForm1.CbOutputAp4Click(Sender: TObject);
begin
  if CbOutputAp4.checked then SetDigitalChannel(4)
    else ClearDigitalChannel(4);
end;




procedure TForm1.ButtonDisconnectAutomateClick(Sender: TObject);
begin
    CloseDevice;
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


end;



procedure TForm1.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
Begin
//Read the message received from the client and add it to the memo text
// The client identifier appears in front of the message
  EditReception1.Text:= Socket.ReceiveText;
end;

end.


