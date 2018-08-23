unit uFormConnection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormConnection = class(TForm)
    Memo1: TMemo;
    ButtonOK: TButton;
    Label1: TLabel;
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
  FC: TFormConnection;

implementation

{$R *.dfm}
procedure TFormConnection.AddMemoLine(message : String);
begin
  Memo1.Lines.Add(message);
end;


procedure TFormConnection.ButtonOKClick(Sender: TObject);
begin
    self.Close;
end;



end.
