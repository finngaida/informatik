unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    n1,n2:Integer;
    Result:Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

n1:= StrToInt(Edit1.Text)-1;
n2:= n1-1;

while n2 <> 0 do
  begin
         Result:= n1+n2;

  end;

Edit2.Text := IntToStr(Result);

end;

end.
