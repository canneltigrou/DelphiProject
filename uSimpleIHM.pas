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
    CbInput1: TCheckBox;
    CbInput3: TCheckBox;
    CbInput2: TCheckBox;
    GroupBox2: TGroupBox;
    CbOutput1: TCheckBox;
    CbOutput2: TCheckBox;
    CbOutput3: TCheckBox;
    CheckBox10: TCheckBox;
    CbOutput6: TCheckBox;
    CbOutput5: TCheckBox;
    CbOutput7: TCheckBox;
    EditVitesse: TEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    EditCapaMin: TEdit;
    Label3: TLabel;
    EditCapaPlus: TEdit;
    Label5: TLabel;
    EditTangente: TEdit;
    Label7: TLabel;
    EditCapaNominale: TEdit;
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
    procedure Image1Click(Sender: TObject);
    procedure EditVitesseChange(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure AddMemoLine(message : String);
    procedure FormCreate(Sender: TForm);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    // Acces propriétés
    property memo : TMemo read Memo1 write Memo1 ;
    property Output1 : TCheckBox write cbOutput1;
    property Output2 : TCheckBox write cbOutput2;
    property Output3 : TCheckBox write cbOutput3;
    property Output4 : TCheckBox write cbOutput4;
    property Output5 : TCheckBox write cbOutput5;
    property Output6 : TCheckBox write cbOutput6;
    property Input1 : TCheckBox write cbInput1;
    property Input2 : TCheckBox write cbInput2;
    property Input3 : TCheckBox write cbInput3;
    property Vitesse : TEdit read EditVitesse write EditVitesse;
    property Impedance : TEdit read EditImpedance write EditImpedance;
    property EssaisVal : TEdit read EditEssaisVal write EditEssaisVal;
    property CodeLu : TEdit read EditCodeLu write EditCodeLu;
    property Tension : TEdit read EditTension write EditTension;
    property CapaNominale : TEdit read EditCapaNominale write EditCapaNominale;
    property Tangente : TEdit read EditTangente write EditTangente ;
    property CapaPlus : TEdit read EditCapaPlus write EditCapaPlus;
    property CapaMoins : TEdit read EditCapaMin write EditCapaMin;
    

  end;

var
  Felabore : TForm;

implementation

{$R *.dfm}
procedure TFormSimpleIHM.FormCreate(Sender: TForm);
begin
    Felabore := Sender;
end;




procedure TFormSimpleIHM.Image1Click(Sender: TObject);
begin
    Felabore.Visible := true;
end;

procedure TFormSimpleIHM.AddMemoLine(message : String);
begin
  Memo1.Lines.Add(message);
end;


procedure TFormSimpleIHM.EditVitesseChange(Sender: TObject);
begin
    //Felabore ;
end;

procedure TFormSimpleIHM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Felabore.Close;
    self.Close;
end;


end.
