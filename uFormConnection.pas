unit uFormConnection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormConnection = class(TForm)
    Memo1: TMemo;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    procedure AddMemoLine(message : String);
  end;

var
  FC: TFormConnection;

implementation

{$R *.dfm}
procedure TFormConnection.AddMemoLine(message : String);
begin
  Memo1.Lines.Add(message);
end;


end.