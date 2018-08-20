object FormConnection: TFormConnection
  Left = 0
  Top = 0
  Caption = 'FormConnection'
  ClientHeight = 231
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
  object Memo1: TMemo
    Left = 64
    Top = 24
    Width = 385
    Height = 153
    Ctl3D = True
    Enabled = False
    ParentCtl3D = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object ButtonOK: TButton
    Left = 374
    Top = 183
    Width = 75
    Height = 25
    Caption = 'OK'
    Enabled = False
    TabOrder = 1
    OnClick = ButtonOKClick
  end
end
