inherited frmLstPB: TfrmLstPB
  Caption = 'Penerimaan Barang'
  ClientHeight = 613
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
    Top = 564
    TabOrder = 4
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnKeluar: TButton
      TabOrder = 4
    end
    inherited btnRefresh: TButton
      TabOrder = 3
      OnClick = btnRefreshClick
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 274
    Align = alClient
    TabOrder = 1
    ExplicitTop = 43
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
        DataBinding.FieldName = 'no_po'
      end
      object cxtbPBHeadnama_supplier: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'nama_supplier'
        Width = 264
      end
      object cxtbPBHeadtanggal: TcxGridDBColumn
        DataBinding.FieldName = 'tanggal'
      end
      object cxtbPBHeaduser: TcxGridDBColumn
        DataBinding.FieldName = 'user'
      end
      object cxtbPBHeaduser_dept: TcxGridDBColumn
        DataBinding.FieldName = 'user_dept'
      end
      object cxtbPBHeadnopol: TcxGridDBColumn
        DataBinding.FieldName = 'nopol'
      end
      object cxtbPBHeaddriver: TcxGridDBColumn
        DataBinding.FieldName = 'driver'
      end
      object cxtbPBHeadno_sj: TcxGridDBColumn
        DataBinding.FieldName = 'no_sj'
      end
      object cxtbPBHeadno_po_1: TcxGridDBColumn
        DataBinding.FieldName = 'no_po_1'
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
    Top = 323
    Width = 1016
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -153
    ExplicitTop = 217
    ExplicitWidth = 1169
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Penerimaan Barang'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 364
    Width = 1016
    Height = 200
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = -153
    ExplicitTop = 258
    ExplicitWidth = 1169
    object cxtbPBDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPBDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbPBDetno_bukti: TcxGridDBColumn
        DataBinding.FieldName = 'no_bukti'
      end
      object cxtbPBDetkode_brg: TcxGridDBColumn
        DataBinding.FieldName = 'kode_brg'
      end
      object cxtbPBDetdeskripsi: TcxGridDBColumn
        DataBinding.FieldName = 'deskripsi'
      end
      object cxtbPBDetsatuan2: TcxGridDBColumn
        DataBinding.FieldName = 'satuan2'
      end
      object cxtbPBDetqty_retur: TcxGridDBColumn
        DataBinding.FieldName = 'qty_retur'
      end
      object cxtbPBDetqty_so: TcxGridDBColumn
        DataBinding.FieldName = 'qty_so'
      end
      object cxtbPBDetqty: TcxGridDBColumn
        DataBinding.FieldName = 'qty'
      end
      object cxtbPBDetsatuan: TcxGridDBColumn
        DataBinding.FieldName = 'satuan'
      end
      object cxtbPBDetid_satuan: TcxGridDBColumn
        DataBinding.FieldName = 'id_satuan'
      end
      object cxtbPBDetharga: TcxGridDBColumn
        DataBinding.FieldName = 'harga'
      end
      object cxtbPBDetketerangan: TcxGridDBColumn
        DataBinding.FieldName = 'keterangan'
      end
      object cxtbPBDetf_posted: TcxGridDBColumn
        DataBinding.FieldName = 'f_posted'
      end
      object cxtbPBDetmata_uang: TcxGridDBColumn
        DataBinding.FieldName = 'mata_uang'
      end
      object cxtbPBDetlokasi: TcxGridDBColumn
        DataBinding.FieldName = 'lokasi'
      end
      object cxtbPBDetkondisi: TcxGridDBColumn
        DataBinding.FieldName = 'kondisi'
      end
      object cxtbPBDetgudang: TcxGridDBColumn
        DataBinding.FieldName = 'gudang'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbPBDet
    end
  end
  object zqrPBHead: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT a.*,  b.no_bukti no_po, c.nama nama_supplier'
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
    Active = True
    SQL.Strings = (
      'SELECT a.*, b.deskripsi, c.satuan satuan2'
      'FROM tbl_pb_det a'
      'LEFT JOIN tbl_barang b ON a.id_brg = b.id'
      'LEFT JOIN tbl_satuan c ON a.id_satuan = c.id'
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
