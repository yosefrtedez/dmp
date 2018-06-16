inherited frmLstPO: TfrmLstPO
  Caption = 'Purchase Order'
  ClientHeight = 507
  ClientWidth = 1169
  OnCreate = FormCreate
  ExplicitLeft = -24
  ExplicitWidth = 1169
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1169
    ExplicitWidth = 1169
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 125
      Height = 19
      Caption = 'Purchase Order'
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
      TabOrder = 4
      ExplicitLeft = 1086
    end
    inherited btnRefresh: TButton
      TabOrder = 3
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
    object cxtbPOHead: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbPOHeadFocusedRecordChanged
      DataController.DataSource = dsPO
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsView.CellTextMaxLineCount = 10
      Preview.MaxLineCount = 10
      object cxColTblHeadno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
        Width = 90
      end
      object cxColTblHeadno_fobj: TcxGridDBColumn
        Caption = 'No PP'
        DataBinding.FieldName = 'no_pp'
        Options.Filtering = False
        Width = 90
      end
      object cxColTblHeadnama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama_supplier'
        Options.Editing = False
        Width = 150
      end
      object cxColTblHeadkontak: TcxGridDBColumn
        DataBinding.FieldName = 'kontak'
        Options.Editing = False
        Width = 120
      end
      object cxColTblHeadtgl_required: TcxGridDBColumn
        Caption = 'Tgl Kedatangan'
        DataBinding.FieldName = 'tgl_required'
        Options.Editing = False
        Width = 90
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
      object cxColTblHeadpembayaran: TcxGridDBColumn
        Caption = 'Pembayaran'
        DataBinding.FieldName = 'pembayaran'
        Options.Editing = False
        Width = 100
      end
      object cxColTblHeadnopol: TcxGridDBColumn
        Caption = 'Nopol'
        DataBinding.FieldName = 'nopol'
        Options.Editing = False
        Width = 90
      end
      object cxColTblHeaddriver: TcxGridDBColumn
        Caption = 'Driver'
        DataBinding.FieldName = 'driver'
        Options.Editing = False
        Width = 120
      end
      object cxColTblHeadf_approval: TcxGridDBColumn
        Caption = 'Approval'
        DataBinding.FieldName = 'f_app'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Editing = False
        Width = 50
      end
      object cxColTblHeadf_completed: TcxGridDBColumn
        Caption = 'Komplit'
        DataBinding.FieldName = 'f_completed'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Editing = False
      end
    end
    object cxTblDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPoDet
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
      GridView = cxtbPOHead
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 258
    Width = 1169
    Height = 200
    Align = alBottom
    TabOrder = 3
    object cxtbPODet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPoDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbPODetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg'
        Width = 103
      end
      object cxtbPODetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 374
      end
      object cxtbPODetqty: TcxGridDBColumn
        Caption = 'Qty.'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbPODetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 54
      end
      object cxtbPODetharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbPODetmata_uang: TcxGridDBColumn
        DataBinding.FieldName = 'mata_uang'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbPODet
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 217
    Width = 1169
    Height = 41
    Align = alBottom
    TabOrder = 2
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Purchase Order'
    end
  end
  object zqrPO: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.no_bukti, a.tgl_required, jenis_po, a.user, a.use' +
        'r_dept, a.pembayaran, a.f_app, a.nopol, a.driver, a.f_completed,'
      'b.nama, b.kontak, c.no_bukti no_pp, d.nama nama_supplier'
      'FROM tbl_po_head a '
      'LEFT JOIN tbl_supplier b ON a.kode_supp = b.kode'
      'LEFT JOIN tbl_pp_head c ON c.id = a.id_pp'
      'LEFT JOIN tbl_supplier d ON d.id = a.id_supplier')
    Params = <>
    Left = 759
    Top = 196
  end
  object dsPO: TDataSource
    DataSet = zqrPO
    Left = 803
    Top = 197
  end
  object zqrPoDet: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      
        'SELECT a.id,  a.id_ref, a.no_bukti, a.kode_brg, b.deskripsi, a.q' +
        'ty, c.satuan, a.harga, a.mata_uang'
      'FROM tbl_po_det a'
      'LEFT JOIN tbl_barang b ON a.kode_brg = b.kode '
      'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan'
      'WHERE a.id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 764
    Top = 252
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsPoDet: TDataSource
    DataSet = zqrPoDet
    Left = 801
    Top = 252
  end
end
