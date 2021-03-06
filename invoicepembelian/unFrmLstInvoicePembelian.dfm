inherited frmLstInvoicePembelian: TfrmLstInvoicePembelian
  Caption = 'Invoice Pembelian'
  ClientHeight = 507
  ClientWidth = 1169
  OnCreate = FormCreate
  ExplicitWidth = 1169
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1169
    ExplicitWidth = 1169
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 150
      Height = 19
      Caption = 'Invoice Pembelian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 458
    Width = 1169
    TabOrder = 4
    ExplicitTop = 458
    ExplicitWidth = 1169
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
      Left = 1086
      ExplicitLeft = 1086
    end
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 49
    Width = 1169
    Height = 168
    Align = alClient
    TabOrder = 1
    object cxtbInvPemb: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbInvPembFocusedRecordChanged
      DataController.DataSource = dsInvoicePembelian
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.CellTextMaxLineCount = 10
      Preview.MaxLineCount = 10
      object cxColNoBukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
        Width = 90
      end
      object cxColTblHeadnama: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'nama_supplier'
        Options.Editing = False
        Width = 209
      end
      object cxColTblHeadkontak: TcxGridDBColumn
        DataBinding.FieldName = 'kontak'
        Visible = False
        Options.Editing = False
        Width = 120
      end
      object cxColTblHeadtgl_required: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Options.Editing = False
        Width = 90
      end
      object cxtbInvPembColumn2: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Width = 103
      end
      object cxtbInvPembColumn1: TcxGridDBColumn
        Caption = 'Jml. Pembayaran'
        DataBinding.FieldName = 'jml_pembayaran'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 110
      end
      object cxColTblHeaduser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
        Options.Editing = False
        Width = 100
      end
      object cxColTblHeaduser_dept: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'user_dept'
        Options.Editing = False
        Width = 100
      end
      object cxColTblHeadf_approval: TcxGridDBColumn
        Caption = 'Approval'
        DataBinding.FieldName = 'f_app'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Editing = False
        Width = 67
      end
    end
    object cxTblDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsInvoicePembelianDet
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
      GridView = cxtbInvPemb
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 258
    Width = 1169
    Height = 200
    Align = alBottom
    TabOrder = 3
    object cxtbInvPembDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsInvoicePembelianDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#0.00'
          Kind = skSum
          Column = cxtbInvPembDetColumn2
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.Footer = True
      object cxtbInvPembDetColumn5: TcxGridDBColumn
        Caption = 'No. PO'
        DataBinding.FieldName = 'nomor_po'
        Width = 97
      end
      object cxtbInvPembDetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg2'
        Width = 103
      end
      object cxtbInvPembDetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 263
      end
      object cxtbInvPembDetqty: TcxGridDBColumn
        Caption = 'Qty.'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbInvPembDetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 62
      end
      object cxtbInvPembDetColumn4: TcxGridDBColumn
        Caption = 'PPN'
        DataBinding.FieldName = 'ppn'
      end
      object cxtbInvPembDetharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbInvPembDetmata_uang: TcxGridDBColumn
        DataBinding.FieldName = 'mata_uang'
        Visible = False
      end
      object cxtbInvPembDetColumn3: TcxGridDBColumn
        Caption = 'Disc (%)'
        DataBinding.FieldName = 'disc_persen'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
      end
      object cxtbInvPembDetColumn1: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 185
      end
      object cxtbInvPembDetColumn2: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 97
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbInvPembDet
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 217
    Width = 1169
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1169
      41)
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Invoice Pembelian'
    end
    object btnCetakPO: TButton
      Left = 1024
      Top = 9
      Width = 137
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cetak Faktur Pembelian'
      TabOrder = 0
      OnClick = btnCetakPOClick
    end
  end
  object zqrInvoicePembelian: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.no_bukti, a.tanggal, a.user, a.user_dept, a.f_app' +
        ','
      'b.nama, b.kontak, b.nama nama_supplier, a.total,'
      
        'IFNULL((SELECT SUM(jml_pembayaran) FROM tbl_pembayaranpembelian_' +
        'det WHERE id_invoice = a.id),0) jml_pembayaran'
      'FROM tbl_invoicepembelian_head a '
      'LEFT JOIN tbl_supplier b ON a.id_supp = b.id')
    Params = <>
    Left = 647
    Top = 156
  end
  object dsInvoicePembelian: TDataSource
    DataSet = zqrInvoicePembelian
    Left = 811
    Top = 157
  end
  object zqrInvoicePembelianDet: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      
        'SELECT a.*, b.kode kode_brg2,  b.deskripsi, a.qty, c.satuan, a.h' +
        'arga, a.mata_uang, e.no_bukti nomor_po,'
      
        '(a.qty * a.harga) - ((a.qty * a.harga) * a.disc_persen / 100)  +' +
        ' if(a.ppn = '#39'PPN'#39',((a.qty * a.harga) - ((a.qty * a.harga) * a.di' +
        'sc_persen / 100)) * 0.1,0) subtotal'
      'FROM tbl_invoicepembelian_det a'
      'LEFT JOIN tbl_barang b ON a.id_brg = b.id '
      'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan'
      
        'LEFT JOIN tbl_po_det d ON d.id_ref = a.id_po AND d.id_brg = a.id' +
        '_brg'
      'LEFT JOIN tbl_po_head e ON e.id = d.id_ref'
      'WHERE a.id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 660
    Top = 332
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsInvoicePembelianDet: TDataSource
    DataSet = zqrInvoicePembelianDet
    Left = 777
    Top = 356
  end
end
