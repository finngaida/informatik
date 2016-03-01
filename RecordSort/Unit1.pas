unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
    TTyp = record
    

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure Edit1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private-Deklarationen}
  public
    { Public-Deklarationen}
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Edit1Click(Sender: TObject);
begin
edit1.text:='';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
listbox1.clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

if edit1.text <> '' then begin
    listbox1.items.add(edit1.text);
end;

end;

end.
