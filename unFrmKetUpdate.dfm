object frmKetUpdate: TfrmKetUpdate
  Left = 415
  Top = 280
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Harap Tunggu...'
  ClientHeight = 127
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 41
    Width = 356
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'HARAP TUNGGU...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 17
    Top = 59
    Width = 356
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'UPDATE PROGRAM DAN KONEKSI KE DATABASE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object prgBar: TProgressBar
    Left = 15
    Top = 80
    Width = 360
    Height = 17
    TabOrder = 0
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Timer1Timer
    Left = 305
    Top = 20
  end
end
