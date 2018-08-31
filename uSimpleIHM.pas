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
    procedure ButtonOKClick(Sender: TObject);


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



end.
