object frmRptTransaksi: TfrmRptTransaksi
  Left = 0
  Top = 0
  Caption = 'Laporan Transaksi'
  ClientHeight = 441
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rptLapRekapTrsKeluar: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43290.646343148200000000
    ReportOptions.LastChange = 43290.646343148200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 60
    Top = 16
    Datasets = <
      item
        DataSet = fdbLapRekapTrsKeluar
        DataSetName = 'fdbLapRekapTrsKeluar'
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
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Top = 7.559060000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Rekapitulasi Transaksi Barang Keluar')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 238.110390000000000000
        Width = 755.906000000000000000
        DataSet = fdbLapRekapTrsKeluar
        DataSetName = 'fdbLapRekapTrsKeluar'
        RowCount = 0
        object fdbLapRekapTrsKeluarkode_brg: TfrxMemoView
          Left = 34.015770000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kode_brg'
          DataSet = fdbLapRekapTrsKeluar
          DataSetName = 'fdbLapRekapTrsKeluar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbLapRekapTrsKeluar."kode_brg"]')
          ParentFont = False
        end
        object fdbLapRekapTrsKeluardeskripsi: TfrxMemoView
          Left = 105.826840000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi'
          DataSet = fdbLapRekapTrsKeluar
          DataSetName = 'fdbLapRekapTrsKeluar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbLapRekapTrsKeluar."deskripsi"]')
          ParentFont = False
        end
        object fdbLapRekapTrsKeluarqty: TfrxMemoView
          Left = 411.968770000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty'
          DataSet = fdbLapRekapTrsKeluar
          DataSetName = 'fdbLapRekapTrsKeluar'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbLapRekapTrsKeluar."qty"]')
          ParentFont = False
        end
        object fdbLapRekapTrsKeluarsatuan: TfrxMemoView
          Left = 483.779840000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'satuan'
          DataSet = fdbLapRekapTrsKeluar
          DataSetName = 'fdbLapRekapTrsKeluar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbLapRekapTrsKeluar."satuan"]')
          ParentFont = False
        end
        object Line: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 26.456710000000000000
        Top = 79.370130000000000000
        Width = 755.906000000000000000
        object Memo2: TfrxMemoView
          Left = 34.015770000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Kode')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Width = 752.126470000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo3: TfrxMemoView
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No.')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 105.826840000000000000
          Top = 3.779530000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Deskripsi')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 24.456710000000000000
          Width = 752.126470000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          Left = 411.968770000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Qty.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 483.779840000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Satuan')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 49.133890000000000000
        Top = 166.299320000000000000
        Width = 755.906000000000000000
        Condition = 'fdbLapRekapTrsKeluar."no_bukti"'
        object fdbLapRekapTrsKeluarno_bukti: TfrxMemoView
          Left = 71.811070000000000000
          Top = 3.779530000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_bukti'
          DataSet = fdbLapRekapTrsKeluar
          DataSetName = 'fdbLapRekapTrsKeluar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbLapRekapTrsKeluar."no_bukti"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No. Bukti')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 56.692950000000000000
          Top = 3.779530000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Top = 22.677180000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Tanggal')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 56.692950000000000000
          Top = 22.677180000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbLapRekapTrsKeluartanggal: TfrxMemoView
          Left = 71.811070000000000000
          Top = 22.677180000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = fdbLapRekapTrsKeluar
          DataSetName = 'fdbLapRekapTrsKeluar'
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbLapRekapTrsKeluar."tanggal"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Top = 44.354360000000000000
          Width = 759.685530000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          Left = 298.582870000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Customer ')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 355.275820000000000000
          Top = 3.779530000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbLapRekapTrsKeluarnama_customer: TfrxMemoView
          Left = 370.393940000000000000
          Top = 3.779530000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_customer'
          DataSet = fdbLapRekapTrsKeluar
          DataSetName = 'fdbLapRekapTrsKeluar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbLapRekapTrsKeluar."nama_customer"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 34.015770000000000000
        Top = 283.464750000000000000
        Width = 755.906000000000000000
        object Line4: TfrxLineView
          Width = 759.685530000000000000
          ShowHint = False
          Diagonal = True
        end
      end
    end
  end
  object zqrLapRekapTrsKeluar: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.no_bukti, a.tanggal, b.kode_brg, '
      'c.deskripsi, b.qty, d.satuan, e.nama nama_customer'
      'FROM tbl_trskeluar_head a '
      'INNER JOIN tbl_trskeluar_det b ON a.id = b.id_ref'
      'LEFT JOIN tbl_barang c ON c.id = b.id_brg'
      'LEFT JOIN tbl_satuan d ON d.id = b.id_satuan'
      'LEFT JOIN tbl_customer e ON e.id = a.id_customer'
      'WHERE a.tanggal BETWEEN :tgl1 AND :tgl2 ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tgl1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tgl2'
        ParamType = ptUnknown
      end>
    Left = 178
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tgl1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tgl2'
        ParamType = ptUnknown
      end>
  end
  object dsLapRekapTrsKeluar: TDataSource
    DataSet = zqrLapRekapTrsKeluar
    Left = 300
    Top = 16
  end
  object fdbLapRekapTrsKeluar: TfrxDBDataset
    UserName = 'fdbLapRekapTrsKeluar'
    CloseDataSource = False
    FieldAliases.Strings = (
      'no_bukti=no_bukti'
      'tanggal=tanggal'
      'kode_brg=kode_brg'
      'deskripsi=deskripsi'
      'qty=qty'
      'satuan=satuan'
      'nama_customer=nama_customer')
    DataSet = zqrLapRekapTrsKeluar
    BCDToCurrency = True
    Left = 421
    Top = 16
  end
  object rptLapRekapTrsMasuk: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43290.646343148200000000
    ReportOptions.LastChange = 43290.646343148200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 60
    Top = 80
    Datasets = <
      item
        DataSet = fdbLapRekapTrsMasuk
        DataSetName = 'fdbLapRekapTrsMasuk'
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
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Top = 7.559060000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Rekapitulasi Transaksi Barang Masuk')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 238.110390000000000000
        Width = 755.906000000000000000
        DataSet = fdbLapRekapTrsMasuk
        DataSetName = 'fdbLapRekapTrsMasuk'
        RowCount = 0
        object fdbLapRekapTrsKeluarkode_brg: TfrxMemoView
          Left = 34.015770000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kode_brg'
          DataSet = fdbLapRekapTrsMasuk
          DataSetName = 'fdbLapRekapTrsMasuk'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbLapRekapTrsMasuk."kode_brg"]')
          ParentFont = False
        end
        object fdbLapRekapTrsKeluardeskripsi: TfrxMemoView
          Left = 105.826840000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi'
          DataSet = fdbLapRekapTrsMasuk
          DataSetName = 'fdbLapRekapTrsMasuk'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbLapRekapTrsMasuk."deskripsi"]')
          ParentFont = False
        end
        object fdbLapRekapTrsKeluarqty: TfrxMemoView
          Left = 411.968770000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty'
          DataSet = fdbLapRekapTrsMasuk
          DataSetName = 'fdbLapRekapTrsMasuk'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbLapRekapTrsMasuk."qty"]')
          ParentFont = False
        end
        object fdbLapRekapTrsKeluarsatuan: TfrxMemoView
          Left = 483.779840000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'satuan'
          DataSet = fdbLapRekapTrsMasuk
          DataSetName = 'fdbLapRekapTrsMasuk'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbLapRekapTrsMasuk."satuan"]')
          ParentFont = False
        end
        object Line: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
        end
        object fdbLapRekapTrsMasukgudang: TfrxMemoView
          Left = 555.590910000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'gudang'
          DataSet = fdbLapRekapTrsMasuk
          DataSetName = 'fdbLapRekapTrsMasuk'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbLapRekapTrsMasuk."gudang"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 26.456710000000000000
        Top = 79.370130000000000000
        Width = 755.906000000000000000
        object Memo2: TfrxMemoView
          Left = 34.015770000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Kode')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Width = 752.126470000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo3: TfrxMemoView
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No.')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 105.826840000000000000
          Top = 3.779530000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Deskripsi')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 24.456710000000000000
          Width = 752.126470000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          Left = 411.968770000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Qty.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 483.779840000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Satuan')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 555.590910000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Gudang')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 49.133890000000000000
        Top = 166.299320000000000000
        Width = 755.906000000000000000
        Condition = '<fdbLapRekapTrsMasuk."no_bukti">'
        object fdbLapRekapTrsKeluarno_bukti: TfrxMemoView
          Left = 71.811070000000000000
          Top = 3.779530000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_bukti'
          DataSet = fdbLapRekapTrsMasuk
          DataSetName = 'fdbLapRekapTrsMasuk'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbLapRekapTrsMasuk."no_bukti"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No. Bukti')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 56.692950000000000000
          Top = 3.779530000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Top = 22.677180000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Tanggal')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 56.692950000000000000
          Top = 22.677180000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbLapRekapTrsKeluartanggal: TfrxMemoView
          Left = 71.811070000000000000
          Top = 22.677180000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = fdbLapRekapTrsMasuk
          DataSetName = 'fdbLapRekapTrsMasuk'
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbLapRekapTrsMasuk."tanggal"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Top = 44.354360000000000000
          Width = 759.685530000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 34.015770000000000000
        Top = 283.464750000000000000
        Width = 755.906000000000000000
        object Line4: TfrxLineView
          Width = 759.685530000000000000
          ShowHint = False
          Diagonal = True
        end
      end
    end
  end
  object zqrLapRekapTrsMasuk: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.no_bukti, a.tanggal, b.kode_brg, '
      'c.deskripsi, b.qty, d.satuan, e.kode gudang'
      'FROM tbl_trsmasuk_head a '
      'INNER JOIN tbl_trsmasuk_det b ON a.id = b.id_ref'
      'LEFT JOIN tbl_barang c ON c.id = b.id_brg'
      'LEFT JOIN tbl_satuan d ON d.id = b.id_satuan'
      'LEFT JOIN tbl_gudang e ON e.id = b.id_gdg'
      'WHERE a.tanggal BETWEEN :tgl1 AND :tgl2')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tgl1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tgl2'
        ParamType = ptUnknown
      end>
    Left = 178
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tgl1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tgl2'
        ParamType = ptUnknown
      end>
  end
  object dsLapRekapTrsMasuk: TDataSource
    DataSet = zqrLapRekapTrsMasuk
    Left = 300
    Top = 80
  end
  object fdbLapRekapTrsMasuk: TfrxDBDataset
    UserName = 'fdbLapRekapTrsMasuk'
    CloseDataSource = False
    FieldAliases.Strings = (
      'no_bukti=no_bukti'
      'tanggal=tanggal'
      'kode_brg=kode_brg'
      'deskripsi=deskripsi'
      'qty=qty'
      'satuan=satuan'
      'gudang=gudang')
    DataSet = zqrLapRekapTrsMasuk
    BCDToCurrency = True
    Left = 421
    Top = 80
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 416
    Top = 200
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 512
    Top = 200
  end
end
