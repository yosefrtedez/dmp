inherited frmLstPP: TfrmLstPP
  Caption = 'Permintaan Pembelian'
  ClientWidth = 1110
  OnCreate = FormCreate
  ExplicitWidth = 1110
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1110
    ExplicitWidth = 1110
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 186
      Height = 19
      Caption = 'Permintaan Pembelian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 1110
    TabOrder = 4
    ExplicitWidth = 1110
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
    inherited btnHapus: TButton
      OnClick = btnHapusClick
    end
    inherited btnKeluar: TButton
      Left = 1027
      TabOrder = 4
      ExplicitLeft = 1027
    end
    inherited btnRefresh: TButton
      TabOrder = 3
      OnClick = btnRefreshClick
    end
  end
  object cxgrd1PP: TcxGrid
    Left = 0
    Top = 49
    Width = 1110
    Height = 169
    Align = alClient
    TabOrder = 1
    ExplicitTop = 43
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
    Top = 218
    Width = 1110
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 472
    ExplicitTop = 418
    ExplicitWidth = 185
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Permintaan Pembelian'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 259
    Width = 1110
    Height = 200
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 253
    object cxtbPPDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPPDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbPPDetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg'
        Width = 91
      end
      object cxtbPPDetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 377
      end
      object cxtbPPDetqty: TcxGridDBColumn
        Caption = 'Qty.'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 86
      end
      object cxtbPPDetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 77
      end
      object cxtbPPDetketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 396
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbPPDet
    end
  end
  object zqrPPHead: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'select * from tbl_pp_head order by no_bukti;')
    Params = <>
    Left = 810
    Top = 153
  end
  object dsPPHead: TDataSource
    DataSet = zqrPPHead
    Left = 840
    Top = 155
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
    Left = 795
    Top = 202
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
    Left = 842
    Top = 203
  end
end
