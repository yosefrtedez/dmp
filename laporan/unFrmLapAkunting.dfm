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
    ActivePage = ts02
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
    object ts02: TcxTabSheet
      Caption = 'ts02'
      ImageIndex = 0
      TabVisible = False
      object cxLookupComboBox1: TcxLookupComboBox
        Left = 70
        Top = 11
        Properties.ListColumns = <>
        TabOrder = 0
        Width = 275
      end
      object cxLabel1: TcxLabel
        Left = 22
        Top = 12
        Caption = 'Akun'
      end
      object cxLabel4: TcxLabel
        Left = 22
        Top = 39
        Caption = 'Tanggal'
      end
      object cxDateEdit1: TcxDateEdit
        Left = 70
        Top = 38
        TabOrder = 2
        Width = 121
      end
      object cxLabel5: TcxLabel
        Left = 197
        Top = 39
        Caption = 'S/D'
      end
      object cxDateEdit2: TcxDateEdit
        Left = 224
        Top = 38
        TabOrder = 3
        Width = 121
      end
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
