inherited frmLstPenerimaanKas: TfrmLstPenerimaanKas
  Caption = 'Penerimaan Kas'
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 132
      Height = 19
      Caption = 'Penerimaan Kas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 2
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
    inherited btnKeluar: TButton
      TabOrder = 4
    end
    inherited btnRefresh: TButton
      TabOrder = 3
      OnClick = btnRefreshClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 1
    object cxtbPK: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPK
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbPKno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Width = 113
      end
      object cxtbPKtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
      end
      object cxtbPKdari: TcxGridDBColumn
        Caption = 'Terima Dari'
        DataBinding.FieldName = 'dari'
      end
      object cxtbPKsebesar: TcxGridDBColumn
        Caption = 'Jumlah'
        DataBinding.FieldName = 'sebesar'
      end
      object cxtbPKmemo: TcxGridDBColumn
        Caption = 'Memo'
        DataBinding.FieldName = 'memo'
        Width = 299
      end
      object cxtbPKuser: TcxGridDBColumn
        Caption = 'User Input'
        DataBinding.FieldName = 'user'
      end
      object cxtbPKf_posting: TcxGridDBColumn
        Caption = 'Posting'
        DataBinding.FieldName = 'f_posting'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbPK
    end
  end
  object zqrPK: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT *'
      'FROM tbl_penerimaankas_head'
      'ORDER BY tanggal')
    Params = <>
    Left = 696
    Top = 128
  end
  object dsPK: TDataSource
    DataSet = zqrPK
    Left = 800
    Top = 152
  end
end
