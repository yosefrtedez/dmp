object frmLapAkunting_RPT: TfrmLapAkunting_RPT
  Left = 0
  Top = 0
  Caption = 'frmLapAkunting_RPT'
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
  object zqrPengeluaranKas: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      
        'select a.tanggal, a.no_jurnal, a.no_trans, b.noakun, a.debet, a.' +
        'kredit, a.keterangan'
      'from tbl_jurnal a'
      'left join tbl_coa b on a.id_akun = b.id'
      'where a.jenis_trs in ('#39'BKM'#39','#39'BKK'#39') order by a.id;')
    Params = <>
    Left = 88
    Top = 16
  end
  object dsPengeluaranKas: TDataSource
    DataSet = zqrPengeluaranKas
    Left = 192
    Top = 8
  end
  object fdbPengeluaranKas: TfrxDBDataset
    UserName = 'fdbPengeluaranKas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'tanggal=tanggal'
      'no_jurnal=no_jurnal'
      'no_trans=no_trans'
      'noakun=noakun'
      'debet=debet'
      'kredit=kredit'
      'keterangan=keterangan')
    DataSet = zqrPengeluaranKas
    BCDToCurrency = True
    Left = 296
    Top = 32
  end
  object rptPengeluaranKas: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43290.646343148200000000
    ReportOptions.LastChange = 43318.578788831000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  sa: real;                            '
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  sa := sa + <fdbKasHarian."debet"> - <fdbKasHarian."kredit">;'
      
        '  Memo1.text := FormatFloat('#39'#,#0.00'#39',sa);                      ' +
        '                                                                ' +
        '        '
      'end;'
      ''
      'begin'
      '  sa := 5000;                                       '
      'end.')
    Left = 424
    Top = 48
    Datasets = <
      item
        DataSet = fdbPengeluaranKas
        DataSetName = 'fdbPengeluaranKas'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'saldo_awal'
        Value = ''
      end>
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
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Width = 755.906000000000000000
        DataSet = fdbPengeluaranKas
        DataSetName = 'fdbPengeluaranKas'
        RowCount = 0
        object Line: TfrxMemoView
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[Line]')
        end
        object fdbKasHariantanggal: TfrxMemoView
          Left = 136.063080000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = fdbPengeluaranKas
          DataSetName = 'fdbPengeluaranKas'
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[fdbKasHarian."tanggal"]')
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo2: TfrxMemoView
          Width = 755.906000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Laporan Penerimaan Kas')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Top = 22.677180000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Periode : ')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 30.236240000000000000
        Top = 105.826840000000000000
        Width = 755.906000000000000000
        object Line1: TfrxLineView
          Top = 0.559060000000000000
          Width = 755.906000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          Top = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'No.')
        end
        object Line2: TfrxLineView
          Left = -3.779530000000000000
          Top = 26.677180000000000000
          Width = 755.906000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Left = 136.063080000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Tanggal')
        end
      end
    end
  end
end
