inherited frmLstPB: TfrmLstPB
  Caption = 'Penerimaan Barang'
  ClientHeight = 572
  ClientWidth = 1019
  OnCreate = FormCreate
  ExplicitWidth = 1019
  ExplicitHeight = 572
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1019
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 161
      Height = 19
      Caption = 'Penerimaan Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 523
    Width = 1019
    TabOrder = 4
    ExplicitTop = 523
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
      Left = 936
    end
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 49
    Width = 1019
    Height = 233
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1016
    object cxtbPBHead: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbPBHeadFocusedRecordChanged
      DataController.DataSource = dsPBHead
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsView.CellTextMaxLineCount = 10
      Preview.MaxLineCount = 10
      object cxtbPBHeadno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Width = 86
      end
      object cxtbPBHeadno_po: TcxGridDBColumn
        Caption = 'No. PO'
        DataBinding.FieldName = 'no_po2'
        Visible = False
        Width = 122
      end
      object cxtbPBHeadnama_supplier: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'nama_supplier'
        Width = 264
      end
      object cxtbPBHeadtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
      end
      object cxtbPBHeaduser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
      end
      object cxtbPBHeaduser_dept: TcxGridDBColumn
        Caption = 'User Dept'
        DataBinding.FieldName = 'user_dept'
      end
      object cxtbPBHeadColumn2: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 247
      end
      object cxtbPBHeadColumn1: TcxGridDBColumn
        Caption = 'Posting'
        DataBinding.FieldName = 'f_posted'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 50
      end
      object cxtbPBHeadColumn3: TcxGridDBColumn
        Caption = 'Tanpa PO'
        DataBinding.FieldName = 'jenis_pb'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
      end
    end
    object cxTblDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DetailKeyFieldNames = 'id_ref'
      DataController.MasterKeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ScrollBars = ssVertical
      OptionsView.CellAutoHeight = True
      OptionsView.CellTextMaxLineCount = 10
      OptionsView.GroupFooters = gfAlwaysVisible
      Preview.MaxLineCount = 10
      object cxColTblDetid: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'id'
      end
      object cxColTblDetid_ref: TcxGridDBColumn
        Caption = 'Id_Ref'
        DataBinding.FieldName = 'id_ref'
      end
      object cxColTblDetno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
      end
      object cxColTblDetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode_brg'
      end
      object cxColTblDetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
      end
      object cxColTblDetqty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
      end
      object cxColTblDetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
      end
      object cxColTblDetharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
      end
      object cxColTblDetmata_uang: TcxGridDBColumn
        Caption = 'Mata Uang'
        DataBinding.FieldName = 'mata_uang'
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbPBHead
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 282
    Width = 1019
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitWidth = 1016
    DesignSize = (
      1019
      41)
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Penerimaan Barang'
    end
    object btnInputHarga: TButton
      Left = 936
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Input Harga'
      TabOrder = 0
      OnClick = btnInputHargaClick
      ExplicitLeft = 933
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 323
    Width = 1019
    Height = 200
    Align = alBottom
    TabOrder = 3
    ExplicitWidth = 1016
    object cxtbPBDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPBDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbPBDetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg'
        Width = 92
      end
      object cxtbPBDetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 359
      end
      object cxtbPBDetColumn2: TcxGridDBColumn
        Caption = 'No. PO'
        DataBinding.FieldName = 'no_po_1'
        Width = 91
      end
      object cxtbPBDetColumn1: TcxGridDBColumn
        Caption = 'Qty. PO'
        DataBinding.FieldName = 'qty_po'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbPBDetqty: TcxGridDBColumn
        Caption = 'Qty.'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbPBDetsatuan2: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan2'
        Width = 78
      end
      object cxtbPBDetharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Visible = False
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbPBDetketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 211
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbPBDet
    end
  end
  object zqrPBHead: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.*,  b.no_bukti no_po2, c.nama nama_supplier, a.jenis_pb'
      'FROM tbl_pb_head a'
      'LEFT JOIN tbl_po_head b ON a.id_po = b.id'
      'LEFT JOIN tbl_supplier c ON c.id = a.id_supplier'
      'ORDER BY a.tanggal')
    Params = <>
    Left = 784
    Top = 112
  end
  object dsPBHead: TDataSource
    DataSet = zqrPBHead
    Left = 872
    Top = 112
  end
  object zqrPBDet: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.*, b.deskripsi, c.satuan satuan2, d.no_bukti no_po,'
      
        '(SELECT x.qty FROM tbl_po_det x WHERE x.id_ref = a.id_po AND x.i' +
        'd_brg = a.id_brg) qty_po '
      'FROM tbl_pb_det a'
      'INNER JOIN tbl_pb_head aa ON aa.id = a.id_ref'
      'LEFT JOIN tbl_barang b ON a.id_brg = b.id'
      'LEFT JOIN tbl_satuan c ON a.id_satuan = c.id'
      'LEFT JOIN tbl_po_head d ON d.id = a.id_po'
      'WHERE a.id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 784
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsPBDet: TDataSource
    DataSet = zqrPBDet
    Left = 872
    Top = 176
  end
end
