program K8055N_Demo;

uses
  Forms,
  K8055 in 'K8055.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
