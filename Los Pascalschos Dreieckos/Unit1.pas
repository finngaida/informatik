unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen}
  public
    { Public-Deklarationen}
  end;

var
  Form1: TForm1;
  goal: Integer;
  n,k : Integer;

implementation

{$R *.DFM}

procedure TForm1.Edit1Click(Sender: TObject);
begin
edit1.text:='';
end;

procedure TForm1.Edit2Click(Sender: TObject);
begin
edit2.text:='';
end;

function pascal(zeile, spalte:Integer) : Integer;
var z, s : Integer;
begin

     z:=zeile;
     s:=spalte;


     if  (s <> 1) then  Result := trunc((n/k)*pascal(z-1, s-1));


end;

procedure TForm1.Button1Click(Sender: TObject);
begin

     n:=strtoint(edit1.text);
     k:=strtoint(edit2.text);
     label2.Caption := inttostr(pascal(strtoint(edit1.text), strtoint(edit2.text)));

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     goal:=0;
end;

end.
