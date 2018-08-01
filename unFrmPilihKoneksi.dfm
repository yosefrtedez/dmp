object frmPilihKoneksi: TfrmPilihKoneksi
  Left = 529
  Top = 277
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pilih Koneksi'
  ClientHeight = 167
  ClientWidth = 223
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 7
    Width = 129
    Height = 13
    Caption = 'Pilih Koneksi (Double Klik) :'
  end
  object lstBoxKoneksi: TListBox
    Left = 10
    Top = 25
    Width = 201
    Height = 97
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = lstBoxKoneksiDblClick
  end
  object btnOK: TButton
    Left = 10
    Top = 132
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnBatal: TButton
    Left = 90
    Top = 132
    Width = 76
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = btnBatalClick
  end
  object lstBoxSection: TListBox
    Left = 184
    Top = 128
    Width = 201
    Height = 97
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
end
