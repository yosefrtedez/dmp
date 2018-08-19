inherited frmLstInvoicePenjualan: TfrmLstInvoicePenjualan
  Caption = 'Invoice Pembelian'
  ClientHeight = 503
  ClientWidth = 1169
  OnCreate = FormCreate
  ExplicitWidth = 1169
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1169
    ExplicitWidth = 1169
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
    Width = 1169
    TabOrder = 4
    ExplicitTop = 454
    ExplicitWidth = 1169
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      Left = 92
      Visible = False
      OnClick = btnEditClick
      ExplicitLeft = 92
    end
    inherited btnHapus: TButton
      Visible = False
      OnClick = btnHapusClick
    end
    inherited btnKeluar: TButton
      Left = 1086
      ExplicitLeft = 1086
    end
    inherited btnRefresh: TButton
      Left = 91
      OnClick = btnRefreshClick
      ExplicitLeft = 91
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 49
    Width = 1169
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
        Width = 80
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
    Width = 1169
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
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cetak Invoice'
      TabOrder = 0
      OnClick = btnCetakPOClick
    end
  end
  object zqrInvPenjualan: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.no_bukti, a.tanggal, b.nama, c.no_bukti AS suratjalan '
      'FROM tbl_invoicepenjualan_head a'
      'LEFT JOIN tbl_customer b ON a.`id_cust` = b.`id`'
      'LEFT JOIN tbl_sj_head c ON a.`no_sj` = c.`no_bukti`;')
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
      
        'SELECT a.no_bukti, a.kode_brg, b.deskripsi, c.satuan, a.qty, a.h' +
        'arga'
      'FROM tbl_invoicepenjualan_det a'
      'LEFT JOIN tbl_barang b ON a.`kode_brg` = b.`id`'
      'LEFT JOIN tbl_satuan c ON a.`id_satuan` = c.id'
      'WHERE a.no_bukti = :no_bukti;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'no_bukti'
        ParamType = ptUnknown
      end>
    Left = 661
    Top = 330
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'no_bukti'
        ParamType = ptUnknown
      end>
  end
  object dsInvPenjualanDet: TDataSource
    DataSet = zqrInvPenjualanDet
    Left = 793
    Top = 322
  end
  object zqrRptInvoicePenjualan: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.no_bukti, a.tanggal, a.no_sj, b.nama, b.`alamat`, b.`al' +
        'amat2`, b.`kota`, b.hp, e.satuan,'
      'c.kode_brg, d.deskripsi, c.qty, c.harga, c.ppn, c.discount,'
      
        'CASE WHEN c.ppn = '#39'PPN'#39' THEN c.qty * c.harga * 1.1 ELSE c.qty * ' +
        'c.harga END AS total'
      'FROM tbl_invoicepenjualan_head a'
      'LEFT JOIN tbl_customer b ON a.`id_cust` = b.`id`'
      
        'LEFT JOIN tbl_invoicepenjualan_det c ON a.`no_bukti` = c.`no_buk' +
        'ti`'
      'LEFT JOIN tbl_barang d ON c.`kode_brg` = d.`id`'
      'LEFT JOIN tbl_satuan e ON e.id = c.id_satuan'
      'WHERE a.no_bukti = :no_bukti;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'no_bukti'
        ParamType = ptUnknown
      end>
    Left = 561
    Top = 441
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'no_bukti'
        ParamType = ptUnknown
      end>
  end
  object dsRptInvoicePenjualan: TDataSource
    DataSet = zqrRptInvoicePenjualan
    Left = 595
    Top = 442
  end
  object fdbInvoicePenjualan: TfrxDBDataset
    UserName = 'fdbInvoicePenjualan'
    CloseDataSource = False
    FieldAliases.Strings = (
      'no_bukti=no_bukti'
      'tanggal=tanggal'
      'no_sj=no_sj'
      'nama=nama'
      'alamat=alamat'
      'alamat2=alamat2'
      'kota=kota'
      'hp=hp'
      'satuan=satuan'
      'kode_brg=kode_brg'
      'deskripsi=deskripsi'
      'qty=qty'
      'harga=harga'
      'ppn=ppn'
      'discount=discount'
      'total=total')
    DataSource = dsRptInvoicePenjualan
    BCDToCurrency = False
    Left = 660
    Top = 439
  end
  object rptInvoicePenjualan: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43314.475617500000000000
    ReportOptions.LastChange = 43331.507893194440000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin                                '
      'end.')
    Left = 530
    Top = 441
    Datasets = <
      item
        DataSet = fdbInvoicePenjualan
        DataSetName = 'fdbInvoicePenjualan'
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
        DataSet = fdbInvoicePenjualan
        DataSetName = 'fdbInvoicePenjualan'
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
        object fdbInvoicePenjualandeskripsi: TfrxMemoView
          Left = 34.015770000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."deskripsi"]')
        end
        object fdbInvoicePenjualanqty: TfrxMemoView
          Left = 309.921460000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."qty"]')
          ParentFont = False
        end
        object fdbInvoicePenjualansatuan: TfrxMemoView
          Left = 370.393940000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'satuan'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."satuan"]')
        end
        object fdbInvoicePenjualanharga: TfrxMemoView
          Left = 434.645950000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'harga'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."harga"]')
          ParentFont = False
        end
        object fdbInvoicePenjualantotal: TfrxMemoView
          Left = 616.063390000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'total'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."total"]')
          ParentFont = False
        end
        object fdbInvoicePenjualanppn: TfrxMemoView
          Left = 506.457020000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ppn'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."ppn"]')
          ParentFont = False
        end
        object fdbInvoicePenjualandiscount: TfrxMemoView
          Left = 566.929500000000000000
          Top = -0.000000000000000028
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'discount'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."discount"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Top = 1.338590000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Faktur Penjualan')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 188.976500000000000000
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        Condition = '<fdbInvoicePenjualan."no_bukti">'
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
          Left = 319.260050000000000000
          Top = 162.519790000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Qty')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 370.393940000000000000
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
          Left = 436.086890000000000000
          Top = 162.519790000000000000
          Width = 64.252010000000000000
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
          Width = 83.149660000000000000
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
        object fdbInvoicePenjualantanggal: TfrxMemoView
          Left = 544.252320000000000000
          Top = 3.779530000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."tanggal"]')
        end
        object fdbInvoicePenjualannama: TfrxMemoView
          Left = 543.252320000000000000
          Top = 22.677180000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."nama"]')
        end
        object fdbInvoicePenjualankota: TfrxMemoView
          Left = 544.252320000000000000
          Top = 37.795300000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kota'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."kota"]')
        end
        object fdbInvoicePenjualanhp: TfrxMemoView
          Left = 544.252320000000000000
          Top = 56.692950000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'hp'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."hp"]')
        end
        object Memo7: TfrxMemoView
          Left = 442.205010000000000000
          Top = 79.370130000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nomer Invoice')
          ParentFont = False
        end
        object fdbInvoicePenjualanno_bukti: TfrxMemoView
          Left = 544.252320000000000000
          Top = 79.370130000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_bukti'
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbInvoicePenjualan."no_bukti"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 502.677490000000000000
          Top = 162.519790000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'PPN')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 566.929500000000000000
          Top = 162.519790000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Disc'
            '')
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
        object fdbInvoicePenjualantotal1: TfrxMemoView
          Left = 616.063390000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbInvoicePenjualan
          DataSetName = 'fdbInvoicePenjualan'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<fdbInvoicePenjualan."total">,MasterData1,2)]')
          ParentFont = False
        end
      end
    end
  end
end
