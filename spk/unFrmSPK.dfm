inherited frmSPK: TfrmSPK
  Caption = 'Surat Perintah Kerja (SPK)'
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 219
      Height = 19
      Caption = 'Surat Perintah Kerja (SPK)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 17
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 65
    Caption = 'No. SO'
  end
  object cxtNoSO: TcxTextEdit
    Left = 101
    Top = 64
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 177
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 146
    Caption = 'No. SPK'
  end
  object cxTextEdit1: TcxTextEdit
    Left = 101
    Top = 145
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 177
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 199
    Caption = 'Tgl. Produksi'
  end
  object cxTextEdit2: TcxTextEdit
    Left = 101
    Top = 198
    Properties.ReadOnly = True
    TabOrder = 11
    Width = 177
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 226
    Caption = 'Mesin'
  end
  object cxTextEdit3: TcxTextEdit
    Left = 101
    Top = 225
    Properties.ReadOnly = True
    TabOrder = 13
    Width = 177
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 253
    Caption = 'Bill Of Material'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 276
    Width = 875
    Height = 198
    TabOrder = 16
    object cxtbBOM: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbBOM
    end
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 92
    Caption = 'Kode Barang'
  end
  object cxTextEdit4: TcxTextEdit
    Left = 101
    Top = 91
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 177
  end
  object cxLabel7: TcxLabel
    Left = 8
    Top = 119
    Caption = 'Nama Barang'
  end
  object cxTextEdit5: TcxTextEdit
    Left = 101
    Top = 118
    Properties.ReadOnly = True
    TabOrder = 5
    Width = 588
  end
  object cxLabel8: TcxLabel
    Left = 8
    Top = 172
    Caption = 'Qty. SPK'
  end
  object cxTextEdit6: TcxTextEdit
    Left = 101
    Top = 171
    Properties.ReadOnly = True
    TabOrder = 9
    Width = 177
  end
end
