inherited frmLaporan: TfrmLaporan
  Caption = 'Laporan'
  ClientHeight = 552
  ClientWidth = 952
  OnCreate = FormCreate
  ExplicitWidth = 952
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 952
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 66
      Height = 19
      Caption = 'Laporan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Left = 752
    Top = 416
    Align = alNone
    TabOrder = 3
    Visible = False
    ExplicitLeft = 752
    ExplicitTop = 416
    inherited btnSimpan: TButton
      Visible = False
    end
    inherited btnBatal: TButton
      Visible = False
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 49
    Width = 209
    Height = 455
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 1
    object btnMasterData: TButton
      Left = 10
      Top = 6
      Width = 196
      Height = 43
      Caption = 'Master Data'
      TabOrder = 0
    end
    object btnTransaksi: TButton
      Left = 10
      Top = 55
      Width = 196
      Height = 43
      Caption = 'Transaksi'
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 504
    Width = 952
    Height = 48
    Align = alBottom
    TabOrder = 5
    ExplicitWidth = 894
    object btnKeluar: TButton
      Left = 10
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Keluar'
      TabOrder = 0
      OnClick = btnKeluarClick
    end
  end
  object Panel4: TPanel
    Left = 222
    Top = 60
    Width = 379
    Height = 365
    Caption = 'Panel4'
    TabOrder = 2
    object lstBox01: TListBox
      Left = 8
      Top = 8
      Width = 361
      Height = 345
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object btnCetak: TButton
    Left = 222
    Top = 431
    Width = 75
    Height = 25
    Caption = 'Cetak'
    TabOrder = 4
    OnClick = btnCetakClick
  end
end
