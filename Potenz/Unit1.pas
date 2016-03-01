unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

FUNCTION Potenz(Base,Expo:Integer):int64;
var
i:Integer;
begin

Result:= Base;

for i := 1 to Expo-1 do
  begin
    Result:= Result*Base;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
edit1.Text:= IntToStr(Potenz(StrToInt(edit2.Text),StrToInt(Edit3.Text)));
end;

procedure TForm1.Edit2Enter(Sender: TObject);
begin
edit2.Text:='';
end;

procedure TForm1.Edit3Enter(Sender: TObject);
begin
edit3.Text:='';
end;

end.
