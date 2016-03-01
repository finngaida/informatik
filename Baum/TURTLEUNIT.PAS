unit TurtleUnit;

interface

uses Forms, Graphics, Dialogs;

type

TTurtle = class(TObject)
 private
  Form                    : TForm;
  richtung, jetztx, jetzty: real;
  penaktiv                : boolean;
  farbe                   : TColor;
  breite                  : Integer;
  procedure line(x1, y1, x2, y2: Integer);
 public
  constructor Create(AForm: TForm);
  function ycor: real;
  function xcor: real;
  function heading: real;
  function  getColor: TColor;
  function  getWidth: Integer;
  procedure setWidth(aWidth: Integer);
  procedure setColor(aColor: TColor);
  procedure setposition(x,y: real);
  procedure setheading(winkel: real);
  procedure forwd(schritt: real);
  procedure back(schritt: real);
  procedure left(winkel: real);
  procedure right(winkel: real);
  procedure penup;
  procedure pendown;
  procedure home;
  procedure bottom;
end;

PROCEDURE Warte(sec : Real);

implementation

uses Windows, SysUtils;

  constructor TTurtle.Create(AForm: TForm);
    begin
      inherited Create;
      Form := AForm;
      penup;
      home;
      pendown;
      Farbe := clBlack;
    end;

  procedure TTurtle.line(x1, y1, x2, y2: Integer);
    var AlteStiftPosition: TPoint;
        AlteStiftFarbe:    TColor;
        AlteStiftBreite:   Integer;
    begin
        with Form.Canvas do
          begin
            AlteStiftFarbe    := Pen.Color;
            pen.Color         := Farbe;
            AlteStiftBreite   := Pen.Width;
            pen.Width         := Breite;
            AlteStiftPosition := PenPos;
            MoveTo(x1, y1);
            LineTo(x2, y2);
            PenPos    := AlteStiftPosition;
            Pen.Width := AlteStiftBreite;
            Pen.Color := AlteStiftFarbe;
          end;
    end;

  function TTurtle.getWidth: Integer;
    begin      getWidth := Breite;    end;

  procedure TTurtle.setWidth(aWidth: Integer);
    begin       IF aWidth <   1 THEN Breite :=   1
           ELSE IF Breite > 100 THEN Breite := 100
           ELSE                      Breite := aWidth;
    end;

  function TTurtle.getColor: TColor;
    begin      getColor := Farbe;    end;

  procedure TTurtle.setColor(aColor: TColor);
    begin      Farbe := aColor;    end;

  function TTurtle.xcor: real;
    begin xcor:= jetztx end;

  function TTurtle.ycor: real;
    begin ycor:= jetzty end;

  function TTurtle.heading: real;
    begin heading:= richtung end;

  procedure TTurtle.setposition(x, y: real);
     begin
       jetztx :=  x + Form.ClientWidth  / 2.0;
       jetzty := -y + Form.ClientHeight / 2.0;
     end;

  procedure TTurtle.setheading(winkel: real);
     begin
       richtung := - winkel;
     end;

  procedure TTurtle.forwd(schritt: real);
    var neux, neuy: real;
    begin
      neux := jetztx + schritt * cos(pi*(90.0+richtung)/180.0);
      neuy := jetzty - schritt * sin(pi*(90.0+richtung)/180.0);
      if penaktiv then
        line(round(jetztx), round(jetzty),
             round(neux)  , round(neuy));
      jetztx := neux;
      jetzty := neuy;
    end;

  procedure TTurtle.back(schritt: real);
    begin forwd(-schritt) end;

  procedure TTurtle.left(winkel: real);
    begin richtung:=richtung+winkel; end;

  procedure TTurtle.right(winkel: real);
    begin left(-winkel) end;

  procedure TTurtle.penup;
    begin penaktiv:=false end;

  procedure TTurtle.pendown;
    begin penaktiv:= true end;

  procedure TTurtle.home;
    begin
      if penaktiv then
        line(round(jetztx), round(jetzty),
             round(Form.ClientWidth  / 2.0),
             round(Form.ClientHeight / 2.0));
      setposition(0.0, 0.0);
      setheading(0.0);
    end;

  procedure TTurtle.bottom;
    begin
      if penaktiv then
        line(round(jetztx), round(jetzty),
             round(Form.ClientWidth / 2.0),
             round(Form.ClientHeight));
      setposition(0.0, - Form.ClientHeight / 2.0);
      setheading(0.0);
    end;

PROCEDURE Warte(sec: Real);
VAR Start, diff : TDateTime;
BEGIN
  Start := Now;
  diff  := sec / 86400.0;
  WHILE (Now - Start) < diff DO;
END;

begin

end.
