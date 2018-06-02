inherited frmInputSO: TfrmInputSO
  Caption = 'frmInputSO'
  ClientWidth = 968
  ExplicitWidth = 968
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 968
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 143
      Height = 19
      Caption = 'Input Sales Order'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 968
  end
  object cxtNoSO: TcxTextEdit
    Left = 72
    Top = 63
    TabOrder = 2
    Width = 177
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 64
    Caption = 'No. SO'
  end
  object cxTextEdit1: TcxTextEdit
    Left = 72
    Top = 90
    TabOrder = 4
    Width = 177
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 91
    Caption = 'No. SO'
  end
  object cxGrid1: TcxGrid
    Left = 10
    Top = 240
    Width = 950
    Height = 200
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    ExplicitWidth = 876
    object cxTblSO: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxColKodeBrg: TcxGridDBColumn
        Width = 94
      end
      object cxTblSOColumn2: TcxGridDBColumn
      end
      object cxTblSOColumn3: TcxGridDBColumn
      end
      object cxTblSOColumn4: TcxGridDBColumn
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxTblSO
    end
  end
end
