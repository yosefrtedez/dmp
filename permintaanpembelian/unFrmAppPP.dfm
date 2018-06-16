inherited frmAppPP: TfrmAppPP
  Caption = 'Approval Permintaan Pembelian'
  ClientWidth = 896
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 896
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 896
    ExplicitWidth = 896
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 264
      Height = 19
      Caption = 'Approval Permintaan Pembelian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 896
    TabOrder = 4
    ExplicitWidth = 896
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxgrd1PP: TcxGrid
    Left = 0
    Top = 49
    Width = 896
    Height = 214
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -214
    ExplicitWidth = 1110
    ExplicitHeight = 169
    object cxtbPP: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbPPFocusedRecordChanged
      DataController.DataSource = dsPPHead
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      object cxColPPno_bukti: TcxGridDBColumn
        Caption = 'No Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
      end
      object cxColPPtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Options.Editing = False
        Width = 92
      end
      object cxColPPtgl_diperlukan: TcxGridDBColumn
        Caption = 'Tgl Diperlukan'
        DataBinding.FieldName = 'tgl_diperlukan'
        Options.Editing = False
        Width = 94
      end
      object cxColPPdiajukan_oleh: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
        Options.Editing = False
      end
      object cxColPPdiajukan_dept: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'user_dept'
        Options.Editing = False
        Width = 230
      end
      object cxColPPlevel_kebutuhan: TcxGridDBColumn
        Caption = 'Level'
        DataBinding.FieldName = 'level_kebutuhan'
        Options.Editing = False
        Width = 164
      end
      object cxColPPLevel1_f_app: TcxGridDBColumn
        Caption = 'Approval'
        DataBinding.FieldName = 'f_app'
        Options.Editing = False
      end
    end
    object cxgtblPP1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPPDet
      DataController.DetailKeyFieldNames = 'kode_brg'
      DataController.KeyFieldNames = 'kode_brg'
      DataController.MasterKeyFieldNames = 'no_bukti'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CellAutoHeight = True
      object cxColPP1no_bukti: TcxGridDBColumn
        Caption = 'No Bukti'
        DataBinding.FieldName = 'no_bukti'
        Width = 100
      end
      object cxColPP1kode_brg: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode_brg'
        Width = 100
      end
      object cxColPP1deskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 150
      end
      object cxColPP1qty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
        Width = 80
      end
      object cxColPP1satuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 80
      end
      object cxColPP1harga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        Width = 90
      end
      object cxColPP1keterangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 200
      end
      object cxColPP1mata_uang: TcxGridDBColumn
        Caption = 'Valuta'
        DataBinding.FieldName = 'mata_uang'
        Width = 100
      end
    end
    object cxgrdlvl1TblPP: TcxGridLevel
      GridView = cxtbPP
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 263
    Width = 896
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -214
    ExplicitTop = 218
    ExplicitWidth = 1110
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Permintaan Pembelian'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 304
    Width = 896
    Height = 200
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = -214
    ExplicitTop = 259
    ExplicitWidth = 1110
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPPDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1kode_brg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg'
        Width = 91
      end
      object cxGrid1DBTableView1deskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 377
      end
      object cxGrid1DBTableView1qty: TcxGridDBColumn
        Caption = 'Qty.'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 86
      end
      object cxGrid1DBTableView1satuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 77
      end
      object cxGrid1DBTableView1keterangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 396
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object zqrPPHead: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'select * from tbl_pp_head '
      'WHERE f_app = 0'
      'order by tanggal')
    Params = <>
    Left = 594
    Top = 145
  end
  object dsPPHead: TDataSource
    DataSet = zqrPPHead
    Left = 664
    Top = 139
  end
  object zqrPPDet: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.id_ref, a.no_bukti, a.kode_brg, b.deskripsi, a.qt' +
        'y, c.satuan, a.harga, a.keterangan, a.mata_uang'
      'FROM tbl_pp_det a'
      'LEFT JOIN tbl_barang b ON a.kode_brg = b.kode'
      'LEFT JOIN tbl_satuan c ON a.id_satuan = c.id'
      'WHERE a.id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 611
    Top = 218
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsPPDet: TDataSource
    AutoEdit = False
    DataSet = zqrPPDet
    Left = 674
    Top = 219
  end
end
