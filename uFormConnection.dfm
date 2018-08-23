object FormConnection: TFormConnection
  Left = 0
  Top = 0
  Caption = 'FormConnection'
  ClientHeight = 266
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 18
    Width = 339
    Height = 39
    Caption = 
      'REMARQUE : en cas d'#39'erreur, toute connexion ou configuration d'#39'a' +
      'ppareil peut '#234'tre refaite plus tard. De m'#234'me pour le chargement ' +
      'du fichier.'
    WordWrap = True
  end
  object Memo1: TMemo
    Left = 64
    Top = 63
    Width = 385
    Height = 153
    Ctl3D = True
    ParentCtl3D = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object ButtonOK: TButton
    Left = 374
    Top = 233
    Width = 75
    Height = 25
    Caption = 'OK'
    Enabled = False
    TabOrder = 1
    OnClick = ButtonOKClick
  end
end
