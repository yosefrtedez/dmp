object frmLapMasterData: TfrmLapMasterData
  Left = 0
  Top = 0
  Caption = 'Laporan Master Data'
  ClientHeight = 299
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
  object rptMstBarang: TfrxReport
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
    Left = 24
    Top = 16
    Datasets = <
      item
        DataSet = fdbMstBarang
        DataSetName = 'fdbMstBarang'
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
            'Master Barang / Persediaan')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 755.906000000000000000
        DataSet = fdbMstBarang
        DataSetName = 'fdbMstBarang'
        RowCount = 0
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
            '[Line#]')
          ParentFont = False
        end
        object fdbMstBarangdeskripsi: TfrxMemoView
          Left = 139.842610000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi'
          DataSet = fdbMstBarang
          DataSetName = 'fdbMstBarang'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbMstBarang."deskripsi"]')
          ParentFont = False
        end
        object fdbMstBarangkode: TfrxMemoView
          Left = 34.015770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kode'
          DataSet = fdbMstBarang
          DataSetName = 'fdbMstBarang'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbMstBarang."kode"]')
          ParentFont = False
        end
        object fdbMstBarangstok: TfrxMemoView
          Left = 457.323130000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'stok'
          DataSet = fdbMstBarang
          DataSetName = 'fdbMstBarang'
          DisplayFormat.FormatStr = '#,#0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbMstBarang."stok"]')
          ParentFont = False
        end
        object fdbMstBarangsatuan: TfrxMemoView
          Left = 529.134200000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'satuan'
          DataSet = fdbMstBarang
          DataSetName = 'fdbMstBarang'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbMstBarang."satuan"]')
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
          Width = 102.047310000000000000
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
          Left = 139.842610000000000000
          Top = 3.779530000000000000
          Width = 313.700990000000000000
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
          Left = 457.323130000000000000
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
            'Stok')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 529.134200000000000000
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
    end
  end
  object zqrMstBarang: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.id, a.kode,  a.deskripsi, a.stok,'
      'b.satuan, '
      'c.kategori'
      ' FROM '
      'tbl_barang a'
      'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id'
      'LEFT JOIN tbl_kategori_brg c ON c.id = a.id_kategori'
      'WHERE a.id_kategori = :id_kategori')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_kategori'
        ParamType = ptUnknown
      end>
    Left = 104
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_kategori'
        ParamType = ptUnknown
      end>
  end
  object dsMstBarang: TDataSource
    DataSet = zqrMstBarang
    Left = 184
    Top = 16
  end
  object fdbMstBarang: TfrxDBDataset
    UserName = 'fdbMstBarang'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'kode=kode'
      'deskripsi=deskripsi'
      'stok=stok'
      'satuan=satuan'
      'kategori=kategori')
    DataSet = zqrMstBarang
    BCDToCurrency = True
    Left = 264
    Top = 16
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
    Left = 352
    Top = 24
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
    Left = 440
    Top = 24
  end
end
