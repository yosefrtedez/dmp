inherited frmLaporan: TfrmLaporan
  Caption = 'frmLaporan'
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
    TabOrder = 2
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
    Width = 177
    Height = 504
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 455
    object BitBtn1: TBitBtn
      Left = 5
      Top = 5
      Width = 156
      Height = 67
      Caption = 'BitBtn1'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
end
