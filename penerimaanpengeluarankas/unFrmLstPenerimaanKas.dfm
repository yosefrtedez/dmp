inherited frmLstPenerimaanKas: TfrmLstPenerimaanKas
  Caption = 'Penerimaan Kas'
  OnCreate = FormCreate
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
    TabOrder = 4
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 169
    Align = alClient
    TabOrder = 1
    object cxtbPK: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbPKFocusedRecordChanged
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
  object Panel3: TPanel
    Left = 0
    Top = 218
    Width = 1016
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnPosting: TButton
      Left = 933
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Posting'
      TabOrder = 0
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 12
      Caption = 'Detail Penerimaan Kas'
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 259
    Width = 1016
    Height = 200
    Align = alBottom
    TabOrder = 3
    object cxtbPKDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPKDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbPKDetnoakun: TcxGridDBColumn
        Caption = 'No. Akun'
        DataBinding.FieldName = 'noakun'
        Width = 78
      end
      object cxtbPKDetColumn1: TcxGridDBColumn
        Caption = 'Nama Akun'
        DataBinding.FieldName = 'namaakun'
        Width = 163
      end
      object cxtbPKDetmemo: TcxGridDBColumn
        Caption = 'Memo'
        DataBinding.FieldName = 'memo'
        Width = 334
      end
      object cxtbPKDetjumlah: TcxGridDBColumn
        Caption = 'Jumlah'
        DataBinding.FieldName = 'jumlah'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.AssignedValues.EditFormat = True
        Properties.DisplayFormat = '#,#0.00'
        Width = 87
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxtbPKDet
    end
  end
  object zqrPK: TZReadOnlyQuery
    Connection = DM.zConn
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
  object zqrPKDet: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.noakun, a.memo, a.jumlah, b.nama namaakun'
      'FROM tbl_penerimaankas_det a'
      'LEFT JOIN tbl_coa b ON b.id = a.id_akun'
      'WHERE a.id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 544
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsPKDet: TDataSource
    DataSet = zqrPKDet
    Left = 648
    Top = 344
  end
end
