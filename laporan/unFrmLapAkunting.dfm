inherited frmLapAkunting: TfrmLapAkunting
  Caption = 'frmLapMaster'
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Left = 440
    Top = 184
    Align = alNone
    TabOrder = 2
    Visible = False
    ExplicitLeft = 440
    ExplicitTop = 184
  end
  inherited Panel2: TPanel
    Left = 440
    Top = 256
    Align = alNone
    TabOrder = 3
    Visible = False
    ExplicitLeft = 440
    ExplicitTop = 256
  end
  object lstBox: TListBox
    Left = 11
    Top = 11
    Width = 361
    Height = 345
    ItemHeight = 13
    TabOrder = 0
    OnClick = lstBoxClick
  end
  object pgParam: TcxPageControl
    Left = 378
    Top = 11
    Width = 463
    Height = 345
    ActivePage = ts01
    LookAndFeel.NativeStyle = True
    Style = 7
    TabOrder = 1
    ClientRectBottom = 344
    ClientRectLeft = 1
    ClientRectRight = 462
    ClientRectTop = 1
    object ts01: TcxTabSheet
      Caption = '01'
      ImageIndex = 0
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      object cxLabel2: TcxLabel
        Left = 19
        Top = 12
        Caption = 'Tanggal'
      end
      object cxdTgl1: TcxDateEdit
        Left = 79
        Top = 11
        TabOrder = 0
        Width = 121
      end
      object cxLabel3: TcxLabel
        Left = 206
        Top = 12
        Caption = 'S/D'
      end
      object cxdTgl2: TcxDateEdit
        Left = 233
        Top = 11
        TabOrder = 1
        Width = 121
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      TabVisible = False
      ExplicitTop = 21
      ExplicitHeight = 323
    end
  end
  object btnCetak: TButton
    Left = 11
    Top = 362
    Width = 75
    Height = 25
    Caption = 'Cetak'
    TabOrder = 4
    OnClick = btnCetakClick
  end
end
