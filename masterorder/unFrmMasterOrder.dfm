inherited frmMasterOrder: TfrmMasterOrder
  Caption = 'frmMasterOrder'
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 107
      Height = 19
      Caption = 'Master Order'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Align = alNone
    Visible = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 894
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 112
    ExplicitTop = 80
    ExplicitWidth = 185
    object cxdTgl1: TcxDateEdit
      Left = 62
      Top = 9
      TabOrder = 0
      Width = 121
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Tanggal'
    end
    object cxLabel2: TcxLabel
      Left = 186
      Top = 10
      Caption = 'S/D'
    end
    object cxdTgl2: TcxDateEdit
      Left = 211
      Top = 9
      TabOrder = 3
      Width = 121
    end
    object Button4: TButton
      Left = 338
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Proses'
      TabOrder = 4
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 90
    Width = 894
    Height = 295
    Align = alClient
    TabOrder = 3
    ExplicitLeft = 136
    ExplicitTop = 168
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 385
    Width = 894
    Height = 168
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 336
    object Button1: TButton
      Left = 10
      Top = 6
      Width = 75
      Height = 25
      Caption = 'SPK'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 91
      Top = 6
      Width = 92
      Height = 25
      Caption = 'Mutasi Gudang'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 10
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Keluar'
      TabOrder = 2
    end
  end
end
