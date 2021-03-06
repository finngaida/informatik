unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TurtleUnit, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button2: TButton;
    Edit5: TEdit;
    ColorDialog1: TColorDialog;
    Button3: TButton;
    Button4: TButton;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button5: TButton;
    Edit7: TEdit;
    Button6: TButton;
    ListBox1: TListBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;

    // eigene
    procedure checkErrors();
    procedure clear();
    procedure SaveDeadFile();
    procedure OpenDeadFile();

    // delphi
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button5Click(Sender: TObject);
    procedure Edit7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    peter:TTurtle;
    xarr: array of real;
    yarr: array of real;
    current: integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
var len, i,x, anzahl, speed, winkel1, winkel2,winkelart, dicke:integer;

// eigene

procedure TForm1.checkErrors();
begin

  if length(edit1.Text)=0 then len:=10 else len:=strToInt(edit1.Text);
  if length(edit2.Text)=0 then anzahl:=20 else anzahl:=strToInt(edit2.Text);
  if length(edit3.Text)=0 then winkel1:=90 else winkel1:=strToInt(edit3.Text);
  if length(edit5.Text)=0 then winkel2:=0 else winkel2:=strToInt(edit5.Text);
  if length(edit4.Text)=0 then speed:=100 else speed:=500-strToInt(edit4.Text);
  if length(edit6.Text)=0 then dicke:=1 else dicke:=strToInt(edit6.Text);

end;

procedure TForm1.clear();
begin
  peter.penup();
  Form1.Refresh();
  peter.home();
end;

//Save to file
procedure TForm1.SaveDeadFile();
var
  Datei:TextFile;
begin
SaveDialog1.FileName:=edit7.text;
 if SaveDialog1.Execute then
  begin
  AssignFile(Datei, SaveDialog1.FileName);
  Rewrite(Datei);
  WriteLn(Datei,edit1.Text);
  WriteLn(Datei,edit2.Text);
  WriteLn(Datei,edit3.Text);
  WriteLn(Datei,edit4.Text);
  WriteLn(Datei,edit5.Text);
  WriteLn(Datei,edit6.Text);
  CloseFile(Datei);
  end;
end;

//Open files

procedure TForm1.OpenDeadFile();
var
  Datei:TextFile;
  output:String;
begin
OpenDialog1.FileName:=Listbox1.Items[ListBox1.Itemindex];
 if OpenDialog1.Execute then
  begin
  AssignFile(Datei, OpenDialog1.FileName);
  Reset(Datei);
  ReadLn(Datei,output);
  edit1.Text:=output;
  ReadLn(Datei,output);
  edit2.Text:=output;
  ReadLn(Datei,output);
  edit3.Text:=output;
  ReadLn(Datei,output);
  edit4.Text:=output;
  ReadLn(Datei,output);
  edit5.Text:=output;
  ReadLn(Datei,output);
  edit6.Text:=output;
  CloseFile(Datei);
  end;
end;


// Delphis

procedure TForm1.Button1Click(Sender: TObject);
begin

  clear();

  peter.pendown();
  winkelart:=1;

  checkErrors();

  peter.setWidth(dicke);

  for i:=0 to anzahl do
  begin
    for x:=0 to speed do
      begin
        peter.forwd(len*i/speed);
        sleep(5);
      end;
      if winkelart = 1 then
      begin
        peter.left(winkel1);
        winkelart:=2;
      end
      else if winkelart = 2 then
      begin
        peter.right(winkel2);
        winkelart:=1;
      end;
  end;


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  peter:=TTurtle.create(self);
  current:=0;

end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
edit1.Text:='';
end;

procedure TForm1.Edit2Enter(Sender: TObject);
begin
edit2.Text:='';
end;

procedure TForm1.Edit3Enter(Sender: TObject);
begin
edit3.Text:='';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
clear();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
colordialog1.color:=peter.getColor;
if colordialog1.Execute then peter.setColor(colordialog1.Color);
end;

procedure TForm1.Edit4Enter(Sender: TObject);
begin
edit4.text:='';
end;

procedure TForm1.Edit5Enter(Sender: TObject);
begin
edit5.text:='';
end;

procedure TForm1.Button4Click(Sender: TObject);
var Ran1,Ran2: integer;
begin

  Peter.pendown;

  if length(edit1.Text)=0 then len:=10 else len:=strToInt(edit1.Text);
  if length(edit2.Text)=0 then anzahl:=20 else anzahl:=strToInt(edit2.Text);
  if length(edit3.Text)=0 then winkel1:=90 else winkel1:=strToInt(edit3.Text);
  if length(edit5.Text)=0 then winkel2:=90 else winkel2:=strToInt(edit5.Text);
  if length(edit4.Text)=0 then speed:=100 else speed:=500-strToInt(edit4.Text);

  for i:=0 to anzahl do
  begin
    for x:=0 to speed do
      begin
      Randomize;
      Ran2:=Random(12);
        peter.forwd(Ran2*i/speed);
        sleep(5);
      end;
      Randomize;
      Ran1 := Random(360);
      peter.left(Ran1);
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (Key = 08) then
begin
peter.penup();
Form1.Refresh();
peter.home();
end;

if (Key = VK_HOME) then
begin
peter.penup();
peter.home();
end;

if (Key = VK_RETURN) then
begin
Button1.Click();
end;

//-------------------------------
if (Key = VK_LEFT)then
begin
Peter.left(90);

end;

if (Key = VK_RIGHT) then
begin
Peter.right(90);
end;

if (Key = VK_UP) then
begin

peter.forwd(5);

{xarr[current+1]:=peter.xcor;
yarr[current+1]:=peter.ycor;
current:=current+1;}

end;

if (Key = VK_DOWN) then
begin
Peter.pendown;
end;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
if length(edit7.Text)>0 then
  ListBox1.items.add(edit7.text);
  SaveDeadFile();
end;

procedure TForm1.Edit7Click(Sender: TObject);
begin
edit7.text:='';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  OpenDeadFile();
end;

end.
