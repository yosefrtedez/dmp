inherited frmLstPembayaranPembelian: TfrmLstPembayaranPembelian
  Caption = 'Purchase Order'
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
      Width = 193
      Height = 19
      Caption = 'Pembayaran Pembelian'
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
    object cxtbPOHead: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbPOHeadFocusedRecordChanged
      DataController.DataSource = dsPembayaranPembelian
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
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
      DataController.DataSource = dsPembayaranPembelianDet
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
      DataController.DataSource = dsPembayaranPembelianDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#0.00'
          Kind = skSum
          Column = cxtbPODetColumn2
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.Footer = True
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
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbPODetColumn3: TcxGridDBColumn
        Caption = 'Qty. Terima'
        DataBinding.FieldName = 'qty_terima'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 71
      end
      object cxtbPODetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 54
      end
      object cxtbPODetharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbPODetmata_uang: TcxGridDBColumn
        DataBinding.FieldName = 'mata_uang'
        Visible = False
      end
      object cxtbPODetColumn1: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 370
      end
      object cxtbPODetColumn2: TcxGridDBColumn
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
    DesignSize = (
      1169
      41)
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Purchase Order'
    end
    object btnCetakPO: TButton
      Left = 1086
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cetak PO'
      TabOrder = 0
      OnClick = btnCetakPOClick
    end
  end
  object zqrPembayaranPembelian: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.no_bukti, a.tgl_required, jenis_po, a.user, a.use' +
        'r_dept, a.pembayaran, a.f_app, a.f_completed,'
      'b.nama, b.kontak, c.no_bukti no_pp, d.nama nama_supplier'
      'FROM tbl_po_head a '
      'LEFT JOIN tbl_supplier b ON a.kode_supp = b.kode'
      'LEFT JOIN tbl_pp_head c ON c.id = a.id_pp'
      'LEFT JOIN tbl_supplier d ON d.id = a.id_supplier')
    Params = <>
    Left = 647
    Top = 156
  end
  object dsPembayaranPembelian: TDataSource
    DataSet = zqrPembayaranPembelian
    Left = 811
    Top = 157
  end
  object zqrPembayaranPembelianDet: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      
        'SELECT a.*, b.deskripsi, a.qty, c.satuan, a.harga, a.mata_uang, ' +
        'a.qty * a.harga subtotal,'
      
        '(SELECT SUM(qty) FROM tbl_pb_det WHERE id_brg = a.id_brg AND id_' +
        'po = a.id_ref) qty_terima'
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
    Left = 412
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsPembayaranPembelianDet: TDataSource
    DataSet = zqrPembayaranPembelianDet
    Left = 577
    Top = 356
  end
  object zqrRptPO: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.no_bukti, a.tanggal, a.pembayaran,  e.nama, e.ala' +
        'mat, e.hp, a.pembayaran, b.qty, c.deskripsi, b.harga, d.satuan'
      'FROM tbl_po_head a '
      'INNER JOIN tbl_po_det b ON a.id = b.id_ref'
      'LEFT JOIN tbl_barang c ON c.id = b.id_brg'
      'LEFT JOIN tbl_supplier e ON a.id_supplier = e.id'
      'LEFT JOIN tbl_satuan d ON d.id = b.id_satuan '
      'WHERE a.no_bukti = :no_bukti;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'no_bukti'
        ParamType = ptUnknown
      end>
    Left = 571
    Top = 444
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'no_bukti'
        ParamType = ptUnknown
      end>
  end
  object dsRptPO: TDataSource
    DataSet = zqrRptPO
    Left = 638
    Top = 455
  end
  object fdbPO: TfrxDBDataset
    UserName = 'fdbPO'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'no_bukti=no_bukti'
      'tanggal=tanggal'
      'pembayaran=pembayaran'
      'nama=nama'
      'alamat=alamat'
      'hp=hp'
      'pembayaran_1=pembayaran_1'
      'qty=qty'
      'deskripsi=deskripsi'
      'harga=harga'
      'satuan=satuan')
    DataSource = dsRptPO
    BCDToCurrency = False
    Left = 676
    Top = 454
  end
  object rptPO: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43314.475617500000000000
    ReportOptions.LastChange = 43314.475617500000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 536
    Top = 446
    Datasets = <
      item
        DataSet = fdbPO
        DataSetName = 'fdbPO'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
        DataSet = fdbPO
        DataSetName = 'fdbPO'
        KeepFooter = True
        KeepTogether = True
        RowCount = 0
        object Line: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object fdbPOdeskripsi: TfrxMemoView
          Left = 34.015770000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi'
          DataSet = fdbPO
          DataSetName = 'fdbPO'
          Memo.UTF8W = (
            '[fdbPO."deskripsi"]')
        end
        object fdbPOqty: TfrxMemoView
          Left = 404.409710000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty'
          DataSet = fdbPO
          DataSetName = 'fdbPO'
          Memo.UTF8W = (
            '[fdbPO."qty"]')
        end
        object fdbPOsatuan: TfrxMemoView
          Left = 468.661720000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'satuan'
          DataSet = fdbPO
          DataSetName = 'fdbPO'
          Memo.UTF8W = (
            '[fdbPO."satuan"]')
        end
        object fdbPOharga: TfrxMemoView
          Left = 521.575140000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'harga'
          DataSet = fdbPO
          DataSetName = 'fdbPO'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbPO."harga"]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 604.724800000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[(<fdbPO."qty">*<fdbPO."harga">)]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 188.976500000000000000
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        Condition = '<fdbPO."id">'
        KeepTogether = True
        object Memo2: TfrxMemoView
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'PT. Damai Mulia Perkasa')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 18.897650000000000000
          Width = 238.110390000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          LineSpacing = 5.000000000000000000
          Memo.UTF8W = (
            'Jl. Ds. Luwung Km. 02'
            'Balongbendo, Sidoarjo'
            'Tel. +62-31-99894381'
            'Tel. +62-31-99894472'
            'Fax. +62-31-99890860')
          ParentFont = False
        end
        object fdbSJ01nama: TfrxMemoView
          Left = 535.827150000000000000
          Top = 22.677180000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbPO."nama"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 441.338900000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Tanggal')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 441.338900000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Kepada Yth.')
          ParentFont = False
        end
        object fdbSJ01tanggal: TfrxMemoView
          Left = 535.827150000000000000
          Top = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbPO."tanggal"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 154.960730000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Top = 162.519790000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No.')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 185.196970000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object fdbPOalamat: TfrxMemoView
          Left = 536.693260000000000000
          Top = 41.574830000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'alamat'
          DataSet = fdbPO
          DataSetName = 'fdbPO'
          Memo.UTF8W = (
            '[fdbPO."alamat"]')
        end
        object Memo7: TfrxMemoView
          Left = 536.693260000000000000
          Top = 60.472480000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'hp'
          DataSet = fdbPO
          DataSetName = 'fdbPO'
          Memo.UTF8W = (
            '[fdbPO."hp"]')
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 128.504020000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Payment Term')
        end
        object fdbPOpembayaran: TfrxMemoView
          Left = 109.606370000000000000
          Top = 128.504020000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'pembayaran'
          DataSet = fdbPO
          DataSetName = 'fdbPO'
          Memo.UTF8W = (
            '[fdbPO."pembayaran"]')
        end
        object Memo9: TfrxMemoView
          Left = 37.795300000000000000
          Top = 162.519790000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Deskripsi')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 406.189240000000000000
          Top = 162.519790000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Qty')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 472.441250000000000000
          Top = 162.519790000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Satuan')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 538.134200000000000000
          Top = 162.519790000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Harga')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 623.724800000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Sub Total')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 158.740260000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          Top = 4.559060000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          Left = 11.338590000000000000
          Top = 53.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Visible = False
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Penerima')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 11.338590000000000000
          Top = 106.724490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Visible = False
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '( .................... )')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 574.488560000000000000
          Top = 53.811070000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Hormat Kami, ')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 608.504330000000000000
          Top = 106.724490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '( .................... )')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 574.488560000000000000
          Top = 129.401670000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Admin PT. DMP')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 604.724800000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<fdbPO."qty">*<fdbPO."harga">,MasterData1)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 525.354670000000000000
          Top = 18.897650000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Total ')
          ParentFont = False
        end
      end
      object Memo1: TfrxMemoView
        Top = 17.338590000000000000
        Width = 718.110700000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          'Purchase Order')
        ParentFont = False
      end
    end
  end
end
