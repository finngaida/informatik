unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }


  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

FUNCTION Essen(n: Long): Long;
var
    counter, o:Long;
begin

    o:=n;
    counter:=n;

    if o = 0 then result:=1
    else if o = 1 then result:=1
    else begin
        while o>1 do begin
        o:=o-1   ;
          counter :=  counter * o;

        end;

        result := counter;

    end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  label2.Caption:=IntToStr(Essen(StrToInt(edit1.text)));
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
edit1.text:='';
end;

end.
