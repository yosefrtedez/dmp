inherited frmLstBarangMasuk: TfrmLstBarangMasuk
  Caption = 'Barang Masuk'
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 115
      Height = 19
      Caption = 'Barang Masuk'
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
    inherited btnHapus: TButton
      OnClick = btnHapusClick
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
    Height = 169
    Align = alClient
    TabOrder = 1
    object cxTblReturPembHead: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxTblReturPembHeadFocusedRecordChanged
      DataController.DataSource = dsBarangMasuk
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsView.CellTextMaxLineCount = 10
      Preview.MaxLineCount = 10
      object cxColPOHeadno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Width = 80
      end
      object cxColPOHeadid_invoice: TcxGridDBColumn
        DataBinding.FieldName = 'id_invoice'
        Visible = False
        Width = 90
      end
      object cxColPOHeadketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 200
      end
      object cxColPOHeadtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
      end
      object cxColPOHeaduser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
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
      GridView = cxTblReturPembHead
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 218
    Width = 1016
    Height = 41
    Align = alBottom
    TabOrder = 2
    object cxLabel1: TcxLabel
      Left = 10
      Top = 12
      Caption = 'Detail Barang Masuk'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 259
    Width = 1016
    Height = 200
    Align = alBottom
    TabOrder = 3
    object cxTblReturPembDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsBarangMasukDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxColPODetno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Width = 80
      end
      object cxColPODetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode_brg'
        Width = 90
      end
      object cxColPODetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 200
      end
      object cxColPODetqty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
      end
      object cxColPODetsatuan: TcxGridDBColumn
        DataBinding.FieldName = 'satuan'
        Width = 60
      end
      object cxColPODetketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 200
      end
      object cxColPODetid_gdg: TcxGridDBColumn
        Caption = 'Gudang'
        DataBinding.FieldName = 'kode'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxTblReturPembDet
    end
  end
  object zqrBarangMasuk: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.no_bukti, a.id_invoice, b.nama, b.kontak, a.keter' +
        'angan, a.tanggal, a.user, a.user_dept, a.f_app'
      'FROM tbl_trsreturpemb_head a'
      'LEFT JOIN tbl_supplier b ON a.`id_supplier` = b.id')
    Params = <>
    Left = 647
    Top = 350
  end
  object dsBarangMasuk: TDataSource
    DataSet = zqrBarangMasuk
    Left = 747
    Top = 319
  end
  object zqrBarangMasukDet: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      
        'SELECT a.id_ref, a.no_bukti, a.kode_brg, b.deskripsi, a.qty, a.k' +
        'eterangan, d.kode, c.`satuan`, a.`harga`, a.`mata_uang`, a.`nila' +
        'i_tukar`, a.`ppn`'
      'FROM tbl_trsreturpemb_det a'
      'LEFT JOIN tbl_barang b ON a.`id_brg` = b.`id`'
      'LEFT JOIN tbl_satuan c ON a.`id_satuan` = c.`id`'
      'left join tbl_gudang d on a.id_gdg = d.id'
      'where a.id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 428
    Top = 150
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsBarangMasukDet: TDataSource
    DataSet = zqrBarangMasukDet
    Left = 553
    Top = 157
  end
end
