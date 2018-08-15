unit UChargementFichier;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, ComObj;

type
  TFChargementFichier = class(TForm)
    editPathFile: TEdit;
    buttonOK: TButton;
    LabelErreur: TLabel;
    procedure buttonOKClick(Sender: TObject);
  private
    { Déclarations privées }
    sFileName : string;
  public
    property nameWritten: string read sFileName;

    { Déclarations publiques }
  end;

implementation

{$R *.fmx}


procedure TFChargementFichier.buttonOKClick(Sender: TObject);

begin
    sFileName := editPathFile.Text;
    if not FileExists(sFileName) then
      LabelErreur.Visible := true
    else
      Self.ModalResult := mrOk;
end;

end.
