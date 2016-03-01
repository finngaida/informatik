unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    PaintBox1: TPaintBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Edit1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edit1Click(Sender: TObject);
begin
edit1.Text := '';
end;


procedure TForm1.Button1Click(Sender: TObject);
var i, j, x, y,total:integer;
var inner:real;
begin

if length(edit1.Text) <> 0 then
begin

  paintbox1.Canvas.CleanupInstance;

  total := strToInt(edit1.text);

  for j:=0 to total do begin
  for i:=0 to 10000 do
  begin

    x:=random(500);
    y:=random(500);

    if sqrt(x*x + y*y) <= total then
    begin
       paintbox1.Canvas.Pixels[x, y] := clred;
       inner:=inner+1;
    end
    else begin

       paintbox1.Canvas.Pixels[x, y] := clgreen;

    end;

  end;
  end;

end;

label2.caption:=floatToStr(inner/total*4);

end;

end.
