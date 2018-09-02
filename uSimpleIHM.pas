unit uSimpleIHM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TFormSimpleIHM = class(TForm)
    Memo1: TMemo;
    Image1: TImage;
    Label15: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    Button1: TButton;
    Edit1: TEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Edit5: TEdit;
    Label8: TLabel;
    EditTension: TEdit;
    EditCodeLu: TEdit;
    ButtonFindValues: TButton;
    Label1: TLabel;
    EditEssaisVal: TEdit;
    Label2: TLabel;
    EditImpedance: TEdit;
    Label9: TLabel;
    Label6: TLabel;
    CbOutput4: TCheckBox;
    Label10: TLabel;
    procedure ButtonOKClick(Sender: TObject);
    procedure GroupBox5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);


  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure AddMemoLine(message : String);

    // Acces propriétés
    property memo : TMemo read Memo1 write Memo1 ;

  end;

var
  FC: TFormSimpleIHM;

implementation

{$R *.dfm}
procedure TFormSimpleIHM.AddMemoLine(message : String);
begin
  Memo1.Lines.Add(message);
end;


procedure TFormSimpleIHM.ButtonOKClick(Sender: TObject);
begin
    self.Close;
end;




