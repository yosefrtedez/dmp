inherited frmMenuLaporan: TfrmMenuLaporan
  Caption = 'frmMenuLaporan'
  ClientHeight = 698
  ClientWidth = 1085
  OnCreate = FormCreate
  ExplicitWidth = 1085
  ExplicitHeight = 698
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1085
  end
  inherited Panel2: TPanel
    Top = 649
    Width = 1085
    TabOrder = 3
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 49
    Width = 215
    Height = 600
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
      OnClick = btnMasterDataClick
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
  object pg: TcxPageControl
    Left = 215
    Top = 49
    Width = 870
    Height = 600
    Align = alClient
    Style = 6
    TabOrder = 2
    ExplicitLeft = 212
    ExplicitTop = 43
    ClientRectBottom = 600
    ClientRectRight = 870
    ClientRectTop = 0
  end
end
