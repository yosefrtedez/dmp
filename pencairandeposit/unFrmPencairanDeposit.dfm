inherited frmPencairanDeposit: TfrmPencairanDeposit
  Caption = 'frmPencairanDeposit'
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 148
      Height = 19
      Caption = 'Pencairan Deposit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 3
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 894
    Height = 48
    Align = alTop
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 10
      Top = 16
      Caption = 'Tanggal'
    end
    object cxDateEdit1: TcxDateEdit
      Left = 60
      Top = 15
      TabOrder = 1
      Width = 121
    end
    object cxDateEdit2: TcxDateEdit
      Left = 211
      Top = 15
      TabOrder = 2
      Width = 121
    end
    object cxLabel2: TcxLabel
      Left = 186
      Top = 16
      Caption = 'S/D'
    end
    object Button1: TButton
      Left = 339
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Proses'
      TabOrder = 0
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 97
    Width = 894
    Height = 407
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 232
    ExplicitTop = 216
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
end
