unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, TARadialSeries, TASources,
  Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Math, types;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    ListBox5: TListBox;
    Source1: TListChartSource;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Series1Draw(ACanvas: TCanvas; const ARect: TRect);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    sx, vx, ax, sy, vy, ay:Double ;
      t, dt, s0:Integer
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

  sy := 0.5 * ay * power(dt, 2) + vy * dt;
  vy := sy / dt;
  sx := sx + 1;

  if sy < s0 then
  begin

   listBox1.items.add('t = ' + FloatToStr(dt/10) + ' s');
   ListBox1.TopIndex := -1 + ListBox1.Items.Count;
   listbox2.items.add('sy = ' + FloatToStr(s0 - sy) + ' m');
   ListBox2.TopIndex := -1 + ListBox2.Items.Count;
   listbox3.items.add('vy = ' + FloatToStr(vy*1000) + ' m/s');
   ListBox3.TopIndex := -1 + ListBox3.Items.Count;
   dt := dt + t;
   Source1.Add(sx, s0-sy);

  end
  else timer1.enabled := false;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.Clear;             //marco hat einen kleinen Penis
  ComboBox1.Items.Add('die Erde');
  ComboBox1.Items.Add('den Mond');
  ComboBox1.Items.Add('den Mars');
  ComboBox1.Items.Add('den Jupiter');
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  button1.caption := 'Bring mich auf ' + ComboBox1.text + ', Scottie!';
  button1.enabled := true;

  if ComboBox1.text = 'die Erde' then edit7.text := FloatToStr(9.81)
     else if ComboBox1.text = 'den Mond' then edit7.text := FloatToStr(1.62)
     else if ComboBox1.text = 'den Mars' then edit7.text := FloatToStr(3.73)
     else if ComboBox1.text = 'den Jupiter' then edit7.text := FloatToStr(24.79);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

   if button1.caption = 'Houston, we have a problem!' then
     begin
     timer1.enabled:= false;
     dt := 0;
     button1.caption := 'Bring mich auf ' + ComboBox1.text + ', Scottie!';

     end
   else
     begin

     // defaults setzen
     dt := 1; //sx := 0; sy := 0; vx := 0; vy := 0; ay := 0;

     // daten auslesen
     sx := StrToFloat(edit3.text);
     sy := StrToFloat(edit4.text);
     vx := StrToFloat(edit5.text);
     vy := StrToFloat(edit6.text);
     ay := StrToFloat(edit7.text);
     s0 := StrToInt(edit8.text);

     if ComboBox1.text = 'die Erde' then ay := 9.81/1000
     else if ComboBox1.text = 'den Mond' then ay := 1.62/1000
     else if ComboBox1.text = 'den Mars' then ay := 3.73/1000
     else if ComboBox1.text = 'den Jupiter' then ay := 24.79/1000;

     t := StrToInt(edit1.Text);
     timer1.Interval := t;
     timer1.enabled := true;

     s0 := StrToInt(edit2.text);

     button1.caption := 'Houston, we have a problem!'

   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   listbox1.items.clear();
   listbox2.items.clear();
   listbox3.items.clear();
   Source1.Clear;
   dt := 1; sx := 0; sy := 0; vx := 0; vy := 0; ay := 0;
end;

procedure TForm1.Label5Click(Sender: TObject);
begin

end;

procedure TForm1.Series1Draw(ACanvas: TCanvas; const ARect: TRect
  );
begin

end;

end.

