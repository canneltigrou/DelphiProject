program K8055N_Demo;

uses
  Forms,
  K8055 in 'K8055.pas' {Form1};
  //TFormConnection in 'uFormConnection.pas' {FormConnection};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TFormConnection, FormConnection);
  Application.Run;
end.
