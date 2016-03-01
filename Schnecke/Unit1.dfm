object Form1: TForm1
  Left = 300
  Top = 151
  Width = 694
  Height = 672
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    678
    634)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 30
    Height = 13
    Caption = 'L'#228'nge'
  end
  object Label2: TLabel
    Left = 8
    Top = 88
    Width = 32
    Height = 13
    Caption = 'Anzahl'
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 39
    Height = 13
    Caption = 'Winkel1'
  end
  object Label4: TLabel
    Left = 8
    Top = 168
    Width = 31
    Height = 13
    Caption = 'Speed'
  end
  object Label5: TLabel
    Left = 8
    Top = 208
    Width = 39
    Height = 13
    Caption = 'Winkel2'
  end
  object Label6: TLabel
    Left = 8
    Top = 248
    Width = 28
    Height = 13
    Caption = 'Dicke'
  end
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'SCHNECK!'
    TabOrder = 0
    OnClick = Button1Click
    OnKeyDown = FormKeyDown
  end
  object Edit1: TEdit
    Left = 8
    Top = 64
    Width = 73
    Height = 21
    TabOrder = 1
    OnEnter = Edit1Enter
    OnKeyDown = FormKeyDown
  end
  object Edit2: TEdit
    Left = 8
    Top = 104
    Width = 73
    Height = 21
    TabOrder = 2
    OnEnter = Edit2Enter
    OnKeyDown = FormKeyDown
  end
  object Edit3: TEdit
    Left = 8
    Top = 144
    Width = 73
    Height = 21
    TabOrder = 3
    OnEnter = Edit3Enter
    OnKeyDown = FormKeyDown
  end
  object Edit4: TEdit
    Left = 8
    Top = 184
    Width = 73
    Height = 21
    TabOrder = 4
    OnEnter = Edit4Enter
    OnKeyDown = FormKeyDown
  end
  object Button2: TButton
    Left = 632
    Top = 0
    Width = 43
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'X'
    TabOrder = 5
    OnClick = Button2Click
    OnKeyDown = FormKeyDown
  end
  object Edit5: TEdit
    Left = 8
    Top = 224
    Width = 73
    Height = 21
    TabOrder = 6
    OnEnter = Edit5Enter
    OnKeyDown = FormKeyDown
  end
  object Button3: TButton
    Left = 8
    Top = 296
    Width = 75
    Height = 25
    Caption = 'FARBE!'
    TabOrder = 7
    OnClick = Button3Click
    OnKeyDown = FormKeyDown
  end
  object Button4: TButton
    Left = 8
    Top = 328
    Width = 75
    Height = 25
    Caption = '<!-!NYAN!-!>'
    TabOrder = 8
    OnClick = Button4Click
    OnKeyDown = FormKeyDown
  end
  object Edit6: TEdit
    Left = 8
    Top = 264
    Width = 73
    Height = 21
    TabOrder = 9
    OnKeyDown = FormKeyDown
  end
  object Button5: TButton
    Left = 544
    Top = 312
    Width = 131
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'SaveThatZneck!'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Edit7: TEdit
    Left = 544
    Top = 280
    Width = 129
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 11
    Text = 'Namen eingeben'
    OnClick = Edit7Click
  end
  object Button6: TButton
    Left = 544
    Top = 592
    Width = 129
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Load'
    TabOrder = 12
    OnClick = Button6Click
  end
  object ListBox1: TListBox
    Left = 544
    Top = 352
    Width = 129
    Height = 225
    Anchors = [akRight, akBottom]
    ItemHeight = 13
    TabOrder = 13
  end
  object ColorDialog1: TColorDialog
    Left = 592
  end
  object OpenDialog1: TOpenDialog
    Left = 560
  end
  object SaveDialog1: TSaveDialog
    Left = 528
  end
end
