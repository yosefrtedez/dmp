inherited frmLstFormula: TfrmLstFormula
  Caption = 'Formula'
  ClientHeight = 543
  ExplicitWidth = 1016
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 494
    TabOrder = 4
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnKeluar: TButton
      TabOrder = 4
    end
    inherited btnRefresh: TButton
      TabOrder = 3
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 226
    Align = alClient
    TabOrder = 1
    ExplicitTop = 262
    ExplicitHeight = 191
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
  object Panel3: TPanel
    Left = 0
    Top = 275
    Width = 1016
    Height = 56
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -24
    ExplicitTop = 265
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 331
    Width = 1016
    Height = 163
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 296
    object cxGrid2DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
end
