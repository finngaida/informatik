unit Verschluesseln1Unit1; // Schluessel ist ZK mit CASE und Details

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    VerButton: TButton;
    Schluessel1Edit: TEdit;
    RadioGroup1: TRadioGroup;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    ProgressBar_inZeile: TProgressBar;
    label2: TLabel;
    ProgressBar_inDatei: TProgressBar;
    Label3: TLabel;
    ProgressBar_gesamt: TProgressBar;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Timer1: TTimer;
    procedure VerButtonClick(Sender: TObject);
  private
    { Private-Deklarationen}
  public
    { Public-Deklarationen}
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.VerButtonClick(Sender: TObject);
VAR Laenge, Code1, Code2, i, s1, Nr, SchluesselLaenge: Integer;
    Z1, Z2, c: Char;
    KT, GT, SchluesselZK: STRING;
    inFile, outFile : TextFile;
    GesamtLaenge, GesamtZeilen, AktuelleZeile, GesamtLaenge_Position:Integer;
    GesamtZeilen_Position, AktuelleZeile_Position : Integer;
    SL: TSTringList;
begin

  // Dateiname auslesen
  if OpenDialog1.Execute then begin
     AssignFile(inFile, OpenDialog1.FileName);

     CASE Radiogroup1.ItemIndex OF
           0: AssignFile(outFile, 'supergeheim.txt');
           1: AssignFile(outFile, 'wenigergeheim.txt');
     END;
  end;

  // Datei ˆffnen
  Reset(inFile);
  Rewrite(outFile);

  GesamtLaenge := 0;
  ProgressBar_inDatei.Position:=0;
  ProgressBar_gesamt.Position:=0;
  GesamtLaenge_Position := 0;
  GesamtZeilen_Position := 0;
  AktuelleZeile_Position := 0;

  SL:= TSTringList.Create;
  SL.LoadFromFile(OpenDialog1.FileName);
  GesamtLaenge := Length(SL.Text);
  GesamtZeilen:= SL.Count;
  SL.Free;
  label5.Caption:=IntToStr(AktuelleZeile_Position)+' von '+IntToStr(AktuelleZeile);
  label6.Caption:=IntToStr(GesamtZeilen_Position)+' von '+IntToStr(GesamtZeilen);
  label7.Caption:=IntToStr(GesamtLaenge_Position)+' von '+IntToStr(GesamtLaenge);
  label5.Refresh;
  label6.Refresh;
  label7.Refresh;
  ProgressBar_inDatei.Max := GesamtZeilen;
  ProgressBar_gesamt.Max := GesamtLaenge;



  // Zeile f¸r Zeile verschl¸sseln
  while not EOF(inFile) do
  begin

  // Zeile auslesen
    ReadLn(inFile, KT);

    ProgressBar_inDatei.Position:=ProgressBar_inDatei.Position+1;
    GesamtZeilen_Position := GesamtZeilen_Position +1;
    label6.Caption:=IntToStr(GesamtZeilen_Position)+' von '+IntToStr(GesamtZeilen);
    label6.Refresh;

    Laenge := Length(KT);

    //Position in Zeile Progressbar

    ProgressBar_inZeile.Position:=0;
    AktuelleZeile_Position := 0;
    ProgressBar_inZeile.Max:=Laenge;
    AktuelleZeile := Laenge;
     label5.Caption:=IntToStr(AktuelleZeile_Position)+' von '+IntToStr(AktuelleZeile);
     label5.Refresh;
    GT := '';
    SchluesselZK := Schluessel1Edit.Text;
    SchluesselLaenge := Length(SchluesselZK);
    Nr := 1;

       // Sicherheitscheck
        IF Laenge > 0 THEN

        // Jedes Byte verschl¸sseln
         FOR i := 1 TO Laenge DO
          BEGIN

          ProgressBar_gesamt.Position:=ProgressBar_gesamt.Position+1;
          GesamtLaenge_Position := Gesamtlaenge_Position +1;
          ProgressBar_inZeile.Position := ProgressBar_inZeile.Position + 1;
          AktuelleZeile_Position :=  AktuelleZeile_Position +1;

          label5.Caption:=IntToStr(AktuelleZeile_Position)+' von '+IntToStr(AktuelleZeile);
          label5.Refresh;
           label7.Caption:=IntToStr(GesamtLaenge_Position)+' von '+IntToStr(GesamtLaenge);
           label7.Refresh;

           label8.Caption := 'Noch ca. ' + FloatToStr(((GesamtLaenge - GesamtLaenge_Position)/100))  + ' sec' ;
           label8.Refresh;





           Z1 := KT[i];
           Code1 := Ord(Z1);

           //Z1Edit.Text := Z1;
           //Edit1.Text := IntToStr(Code1);
           //Application.ProcessMessages;
           Sleep(1);

           c := SchluesselZK[Nr];
           s1 := Ord(c);

           //Edit5.Text := c;
           //Edit3.Text := IntToStr(s1);
           //Application.ProcessMessages;

           // Ver- oder entschl¸sselen
           CASE Radiogroup1.ItemIndex OF
           0: BEGIN
               Code2 := Code1 + s1;
               //Edit2.Text := IntToStr(Code2);
               IF Code2 > 255 THEN
                 Code2 := Code2 - 256 + 32;
              END;
           1: BEGIN
               Code2 := Code1 - s1;
               //Edit2.Text := IntToStr(Code2);
               IF Code2 < 32 THEN
                 Code2 := Code2 + 256 - 32;
              END;
           END;

           Z2 := Chr(Code2);
           //Z2Edit.Text := Z2;
           //Edit4.Text := IntToStr(Code2);
           //Application.ProcessMessages;
           //Sleep(1000);
           GT := GT + Z2;
           //GTEdit.Text := GT;
           //Application.ProcessMessages;
           //Sleep(1000);
           Inc(Nr);
           IF Nr > SchluesselLaenge THEN
             Nr := 1;
          END;

          // In die Ausgabedatei schreiben
          WriteLn(outFile, GT);
    end;

     label8.Caption := 'Fertig!';
     timer1.Enabled := false;

    // Wieder schlieﬂen
    CloseFile(inFile);
    CloseFile(outFile);
end;

end.
