inherited frmInputPenerimaanKas: TfrmInputPenerimaanKas
  Caption = 'Penerimaan Kas'
  ClientWidth = 1102
  ExplicitWidth = 1102
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1102
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 181
      Height = 19
      Caption = 'Input Penerimaan Kas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 1102
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 63
    Caption = 'No. Bukti'
  end
  object cxTextEdit1: TcxTextEdit
    Left = 104
    Top = 62
    TabOrder = 3
    Text = 'cxTextEdit1'
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 90
    Caption = 'Tanggal'
  end
  object cxGrid1: TcxGrid
    Left = 10
    Top = 185
    Width = 1082
    Height = 200
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
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
  object cxDateEdit1: TcxDateEdit
    Left = 104
    Top = 89
    TabOrder = 6
    Width = 121
  end
end
