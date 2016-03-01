program Verschlusseln1Proj1;

uses
  Forms,
  Verschluesseln1Unit1 in 'Verschluesseln1Unit1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
