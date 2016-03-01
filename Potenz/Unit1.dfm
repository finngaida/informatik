object Form1: TForm1
  Left = 192
  Top = 124
  Width = 1305
  Height = 675
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 264
    Top = 64
    Width = 15
    Height = 25
    Caption = '^'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 200
    Top = 112
    Width = 153
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 200
    Top = 88
    Width = 153
    Height = 21
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 1
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 200
    Top = 64
    Width = 57
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    OnEnter = Edit2Enter
  end
  object Edit3: TEdit
    Left = 296
    Top = 64
    Width = 57
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
    OnEnter = Edit3Enter
  end
end
