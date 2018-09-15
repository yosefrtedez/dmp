inherited frmLstInvoicePenjualan: TfrmLstInvoicePenjualan
  Caption = 'Invoice Pembelian'
  ClientHeight = 503
  ClientWidth = 1085
  OnCreate = FormCreate
  ExplicitWidth = 1085
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1085
    ExplicitWidth = 1085
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 146
      Height = 19
      Caption = 'Invoice Penjualan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 454
    Width = 1085
    TabOrder = 4
    ExplicitTop = 454
    ExplicitWidth = 1085
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      Left = 92
      TabOrder = 2
      Visible = False
      OnClick = btnEditClick
      ExplicitLeft = 92
    end
    inherited btnHapus: TButton
      TabOrder = 3
      Visible = False
      OnClick = btnHapusClick
    end
    inherited btnKeluar: TButton
      Left = 1002
      ExplicitLeft = 1002
    end
    inherited btnRefresh: TButton
      Left = 91
      TabOrder = 1
      OnClick = btnRefreshClick
      ExplicitLeft = 91
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 49
    Width = 1085
    Height = 164
    Align = alClient
    TabOrder = 1
    object cxTblInvHead: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxTblInvHeadFocusedRecordChanged
      DataController.DataSource = dsInvPenjualan
      DataController.KeyFieldNames = 'no_bukti'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.CellTextMaxLineCount = 10
      Preview.MaxLineCount = 10
      object cxColNo_bukti: TcxGridDBColumn
        Caption = 'No Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
        Width = 100
      end
      object cxColTanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Options.Editing = False
        Width = 100
      end
      object cxColCustomer: TcxGridDBColumn
        Caption = 'Nama Customer'
        DataBinding.FieldName = 'nama'
        Options.Editing = False
        Width = 200
      end
      object cxColSuratJalan: TcxGridDBColumn
        Caption = 'No. Surat Jalan'
        DataBinding.FieldName = 'suratjalan'
        Options.Editing = False
        Width = 94
      end
      object cxTblInvHeadColumn3: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Width = 92
      end
      object cxTblInvHeadColumn4: TcxGridDBColumn
        Caption = 'Jml. Pembayaran'
        DataBinding.FieldName = 'jml_pembayaran'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taRightJustify
        Width = 116
      end
      object cxTblInvHeadColumn2: TcxGridDBColumn
        Caption = 'PPN'
        DataBinding.FieldName = 'f_ppn'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 41
      end
      object cxTblInvHeadColumn1: TcxGridDBColumn
        Caption = 'Komplit'
        DataBinding.FieldName = 'f_completed'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 63
      end
    end
    object cxTblDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsInvPenjualanDet
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
      GridView = cxTblInvHead
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 254
    Width = 1085
    Height = 200
    Align = alBottom
    TabOrder = 3
    object cxTblInvDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsInvPenjualanDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#0.00'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.Footer = True
      object cxColNobukti: TcxGridDBColumn
        Caption = 'No Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
        Width = 80
      end
      object cxColKodeBrg: TcxGridDBColumn
        Caption = 'Kode Barang'
        DataBinding.FieldName = 'kode_brg'
        Options.Editing = False
        Width = 100
      end
      object cxColNama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'deskripsi'
        Width = 200
      end
      object cxColQty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Options.Editing = False
        Width = 80
      end
      object cxColSatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Options.Editing = False
        Width = 60
      end
      object cxColHarga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Options.Editing = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxTblInvDet
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 213
    Width = 1085
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1085
      41)
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Invoice Penjualan'
    end
    object btnCetakPO: TButton
      Left = 980
      Top = 8
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cetak Invoice'
      TabOrder = 1
      OnClick = btnCetakPOClick
    end
    object btnPosting: TButton
      Left = 899
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Posting'
      TabOrder = 0
      Visible = False
    end
  end
  object zqrInvPenjualan: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.no_bukti, a.tanggal, b.nama, c.no_bukti AS suratj' +
        'alan, a.f_completed, a.f_ppn, a.total,'
      
        'IFNULL((SELECT SUM(jml_pembayaran) FROM tbl_pembayaranpenjualan_' +
        'det WHERE id_invoice = a.id),0) jml_pembayaran'
      'FROM tbl_invoicepenjualan_head a'
      'LEFT JOIN tbl_customer b ON a.id_cust = b.id'
      'LEFT JOIN tbl_sj_head c ON c.id = a.id_sj')
    Params = <>
    Left = 728
    Top = 146
  end
  object dsInvPenjualan: TDataSource
    DataSet = zqrInvPenjualan
    Left = 811
    Top = 148
  end
  object zqrInvPenjualanDet: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      
        'SELECT a.no_bukti, b.kode kode_brg, b.deskripsi, c.satuan, a.qty' +
        ', a.harga'
      'FROM tbl_invoicepenjualan_det a'
      'LEFT JOIN tbl_barang b ON a.id_brg = b.`id`'
      'LEFT JOIN tbl_satuan c ON a.`id_satuan` = c.id'
      'WHERE a.id_ref = :id_ref;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 661
    Top = 330
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsInvPenjualanDet: TDataSource
    DataSet = zqrInvPenjualanDet
    Left = 793
    Top = 322
  end
end
