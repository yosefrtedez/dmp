object frmLapSPK: TfrmLapSPK
  Left = 0
  Top = 0
  Caption = 'Laporan SPK'
  ClientHeight = 421
  ClientWidth = 888
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rptSPK_OLD: TfrxReport
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
      'begin'
      ''
      'end.')
    Left = 16
    Top = 16
    Datasets = <
      item
        DataSet = fdbSPK
        DataSetName = 'fdbSPK'
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
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 623.622450000000000000
        Width = 755.906000000000000000
        DataSet = fdbSPK
        DataSetName = 'fdbSPK'
        KeepFooter = True
        KeepTogether = True
        RowCount = 0
        object fdbSPKdeskripsi_bom: TfrxMemoView
          Left = 37.795300000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi_bom'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."deskripsi_bom"]')
          ParentFont = False
        end
        object Line: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Line#].')
          ParentFont = False
        end
        object fdbSPKqty_bom: TfrxMemoView
          Left = 347.716760000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty_bom'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          DisplayFormat.FormatStr = '#,#0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbSPK."qty_bom"]')
          ParentFont = False
        end
        object fdbSPKsatuan_bom: TfrxMemoView
          Left = 449.764070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'satuan_bom'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbSPK."satuan_bom"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 582.047620000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        Condition = 'fdbSPK."id"'
        KeepTogether = True
        object Memo2: TfrxMemoView
          Top = 25.677180000000000000
          Width = 755.905511810000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbSPK."no_spk"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Top = 2.220470000000000000
          Width = 755.905511810000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Surat Perintah Kerja')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Width = 755.906000000000000000
          Height = 49.133890000000000000
          ShowHint = False
        end
        object Line1: TfrxLineView
          Top = 49.354360000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          Top = 52.913420000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No. Sales Order')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 128.504020000000000000
          Top = 52.913420000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbSPKno_so: TfrxMemoView
          Left = 143.622140000000000000
          Top = 52.913420000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_so'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."no_so"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 71.811070000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Customer')
          ParentFont = False
        end
        object fdbSPKnama_customer: TfrxMemoView
          Left = 143.622140000000000000
          Top = 71.811070000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_customer'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."nama_customer"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 128.504020000000000000
          Top = 71.811070000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 102.047310000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nama Barang')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 128.504020000000000000
          Top = 102.047310000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbSPKdeskripsi: TfrxMemoView
          Left = 143.622140000000000000
          Top = 102.047310000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."deskripsi"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Top = 139.842610000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'QTY. SPK')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 128.504020000000000000
          Top = 139.842610000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbSPKqty_spk: TfrxMemoView
          Left = 143.622140000000000000
          Top = 139.842610000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty_spk'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          DisplayFormat.FormatStr = '#,#0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbSPK."qty_spk"]')
          ParentFont = False
        end
        object fdbSPKsatuan: TfrxMemoView
          Left = 238.110390000000000000
          Top = 139.842610000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'satuan'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdbSPK."satuan"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Top = 120.944960000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Mesin')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 128.504020000000000000
          Top = 120.944960000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbSPKnama_mesin: TfrxMemoView
          Left = 143.622140000000000000
          Top = 120.944960000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_mesin'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."nama_mesin"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Top = 158.740260000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Toleransi')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 128.504020000000000000
          Top = 158.740260000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbSPKtoleransi: TfrxMemoView
          Left = 143.622140000000000000
          Top = 158.740260000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."toleransi"] %')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 212.976500000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          Top = 216.756030000000000000
          Width = 26.456710000000000000
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
        object Memo12: TfrxMemoView
          Left = 30.236240000000000000
          Top = 216.756030000000000000
          Width = 60.472480000000000000
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
        object Memo13: TfrxMemoView
          Left = 158.740260000000000000
          Top = 216.756030000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Jam Mulai')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 241.889920000000000000
          Top = 216.756030000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Jam Selesai')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Top = 239.433210000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          Left = 94.488250000000000000
          Top = 216.756030000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Shift')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 325.039580000000000000
          Top = 216.756030000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Hasil Produksi')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 427.086890000000000000
          Top = 216.756030000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Operator')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Top = 250.212740000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '1.')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 30.236240000000000000
          Top = 250.212740000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 158.740260000000000000
          Top = 250.212740000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 241.889920000000000000
          Top = 250.212740000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 94.488250000000000000
          Top = 250.212740000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 325.039580000000000000
          Top = 250.212740000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 427.086890000000000000
          Top = 250.212740000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Top = 277.228510000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '2.')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 30.236240000000000000
          Top = 277.228510000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 158.740260000000000000
          Top = 277.228510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 241.889920000000000000
          Top = 277.228510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 94.488250000000000000
          Top = 277.228510000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 325.039580000000000000
          Top = 277.228510000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 427.086890000000000000
          Top = 277.228510000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Top = 303.685220000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '3.')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 30.236240000000000000
          Top = 303.685220000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 158.740260000000000000
          Top = 303.685220000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 241.889920000000000000
          Top = 303.685220000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 94.488250000000000000
          Top = 303.685220000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 325.039580000000000000
          Top = 303.685220000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 427.086890000000000000
          Top = 303.685220000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Top = 330.700990000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '4.')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 30.236240000000000000
          Top = 330.700990000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 158.740260000000000000
          Top = 330.700990000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 241.889920000000000000
          Top = 330.700990000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 94.488250000000000000
          Top = 330.700990000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 325.039580000000000000
          Top = 330.700990000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 427.086890000000000000
          Top = 330.700990000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Top = 356.598640000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '5.')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 30.236240000000000000
          Top = 356.598640000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 158.740260000000000000
          Top = 356.598640000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 241.889920000000000000
          Top = 356.598640000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 94.488250000000000000
          Top = 356.598640000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 325.039580000000000000
          Top = 356.598640000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 427.086890000000000000
          Top = 356.598640000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Top = 383.614410000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '6.')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 30.236240000000000000
          Top = 383.614410000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 158.740260000000000000
          Top = 383.614410000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 241.889920000000000000
          Top = 383.614410000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 94.488250000000000000
          Top = 383.614410000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 325.039580000000000000
          Top = 383.614410000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 427.086890000000000000
          Top = 383.614410000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Top = 409.512060000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '7.')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 30.236240000000000000
          Top = 409.512060000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 158.740260000000000000
          Top = 409.512060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 241.889920000000000000
          Top = 409.512060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 94.488250000000000000
          Top = 409.512060000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 325.039580000000000000
          Top = 409.512060000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 427.086890000000000000
          Top = 409.512060000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Top = 435.968770000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '8.')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 30.236240000000000000
          Top = 435.968770000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 158.740260000000000000
          Top = 435.968770000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 241.889920000000000000
          Top = 435.968770000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 94.488250000000000000
          Top = 435.968770000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 325.039580000000000000
          Top = 435.968770000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 427.086890000000000000
          Top = 435.968770000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Top = 462.425480000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '9.')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 30.236240000000000000
          Top = 462.425480000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 158.740260000000000000
          Top = 462.425480000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 241.889920000000000000
          Top = 462.425480000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 94.488250000000000000
          Top = 462.425480000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 325.039580000000000000
          Top = 462.425480000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 427.086890000000000000
          Top = 462.425480000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Top = 488.882190000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '10.')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 30.236240000000000000
          Top = 488.882190000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 158.740260000000000000
          Top = 488.882190000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 241.889920000000000000
          Top = 488.882190000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Left = 94.488250000000000000
          Top = 488.882190000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 325.039580000000000000
          Top = 488.882190000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 427.086890000000000000
          Top = 488.882190000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Top = 542.677490000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Line6: TfrxLineView
          Top = 577.252320000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo92: TfrxMemoView
          Left = 37.795300000000000000
          Top = 550.236550000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nama Barang')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Top = 518.338900000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bill Of Material / Bahan Baku :')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 351.496290000000000000
          Top = 550.236550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Qty.')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 449.764070000000000000
          Top = 550.236550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Satuan')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Top = 550.236550000000000000
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
        object Memo97: TfrxMemoView
          Left = 668.976810000000000000
          Top = 216.756030000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Paraf')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 668.976810000000000000
          Top = 250.212740000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Left = 668.976810000000000000
          Top = 277.228510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo177: TfrxMemoView
          Left = 668.976810000000000000
          Top = 303.685220000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo178: TfrxMemoView
          Left = 668.976810000000000000
          Top = 330.141930000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo179: TfrxMemoView
          Left = 668.976810000000000000
          Top = 356.598640000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo180: TfrxMemoView
          Left = 668.976810000000000000
          Top = 383.055350000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo181: TfrxMemoView
          Left = 668.976810000000000000
          Top = 409.512060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo182: TfrxMemoView
          Left = 668.976810000000000000
          Top = 435.968770000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo183: TfrxMemoView
          Left = 668.976810000000000000
          Top = 462.425480000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo184: TfrxMemoView
          Left = 668.976810000000000000
          Top = 488.882190000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo185: TfrxMemoView
          Top = 188.976500000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hasil Produksi :')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 370.393940000000000000
        Top = 668.976810000000000000
        Width = 755.906000000000000000
        object Line3: TfrxLineView
          Top = 34.559060000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Top = 34.795300000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo100: TfrxMemoView
          Top = 38.574830000000000000
          Width = 26.456710000000000000
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
        object Memo101: TfrxMemoView
          Left = 30.236240000000000000
          Top = 38.574830000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Tgl / Jam')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 173.858380000000000000
          Top = 38.574830000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Gudang')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 257.008040000000000000
          Top = 38.574830000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Jumlah')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Top = 61.252010000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo104: TfrxMemoView
          Left = 94.488250000000000000
          Top = 38.574830000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No. Bahan')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 342.205010000000000000
          Top = 38.574830000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Operator')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Top = 72.031540000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '1.')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 30.236240000000000000
          Top = 72.031540000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 173.858380000000000000
          Top = 72.031540000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 257.008040000000000000
          Top = 72.031540000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 94.488250000000000000
          Top = 72.031540000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 585.047620000000000000
          Top = 72.031540000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 342.205010000000000000
          Top = 72.031540000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Top = 99.047310000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '2.')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 30.236240000000000000
          Top = 99.047310000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 173.858380000000000000
          Top = 99.047310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 257.008040000000000000
          Top = 99.047310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 94.488250000000000000
          Top = 99.047310000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 585.047620000000000000
          Top = 99.047310000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 342.205010000000000000
          Top = 99.047310000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Top = 125.504020000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '3.')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 30.236240000000000000
          Top = 125.504020000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 173.858380000000000000
          Top = 125.504020000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 257.008040000000000000
          Top = 125.504020000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          Left = 94.488250000000000000
          Top = 125.504020000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          Left = 585.047620000000000000
          Top = 125.504020000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          Left = 342.205010000000000000
          Top = 125.504020000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          Top = 152.519790000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '4.')
          ParentFont = False
        end
        object Memo129: TfrxMemoView
          Left = 30.236240000000000000
          Top = 152.519790000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 173.858380000000000000
          Top = 152.519790000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          Left = 257.008040000000000000
          Top = 152.519790000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo132: TfrxMemoView
          Left = 94.488250000000000000
          Top = 152.519790000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo133: TfrxMemoView
          Left = 585.047620000000000000
          Top = 152.519790000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo134: TfrxMemoView
          Left = 342.205010000000000000
          Top = 152.519790000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo135: TfrxMemoView
          Top = 178.417440000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '5.')
          ParentFont = False
        end
        object Memo136: TfrxMemoView
          Left = 30.236240000000000000
          Top = 178.417440000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo137: TfrxMemoView
          Left = 173.858380000000000000
          Top = 178.417440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo138: TfrxMemoView
          Left = 257.008040000000000000
          Top = 178.417440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo139: TfrxMemoView
          Left = 94.488250000000000000
          Top = 178.417440000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo140: TfrxMemoView
          Left = 585.047620000000000000
          Top = 178.417440000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo141: TfrxMemoView
          Left = 342.205010000000000000
          Top = 178.417440000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo142: TfrxMemoView
          Top = 205.433210000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '6.')
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          Left = 30.236240000000000000
          Top = 205.433210000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo144: TfrxMemoView
          Left = 173.858380000000000000
          Top = 205.433210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          Left = 257.008040000000000000
          Top = 205.433210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo146: TfrxMemoView
          Left = 94.488250000000000000
          Top = 205.433210000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          Left = 585.047620000000000000
          Top = 205.433210000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo148: TfrxMemoView
          Left = 342.205010000000000000
          Top = 205.433210000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo149: TfrxMemoView
          Top = 231.330860000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '7.')
          ParentFont = False
        end
        object Memo150: TfrxMemoView
          Left = 30.236240000000000000
          Top = 231.330860000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo151: TfrxMemoView
          Left = 173.858380000000000000
          Top = 231.330860000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo152: TfrxMemoView
          Left = 257.008040000000000000
          Top = 231.330860000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo153: TfrxMemoView
          Left = 94.488250000000000000
          Top = 231.330860000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo154: TfrxMemoView
          Left = 585.047620000000000000
          Top = 231.330860000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo155: TfrxMemoView
          Left = 342.205010000000000000
          Top = 231.330860000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo156: TfrxMemoView
          Top = 257.787570000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '8.')
          ParentFont = False
        end
        object Memo157: TfrxMemoView
          Left = 30.236240000000000000
          Top = 257.787570000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo158: TfrxMemoView
          Left = 173.858380000000000000
          Top = 257.787570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo159: TfrxMemoView
          Left = 257.008040000000000000
          Top = 257.787570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo160: TfrxMemoView
          Left = 94.488250000000000000
          Top = 257.787570000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo161: TfrxMemoView
          Left = 585.047620000000000000
          Top = 257.787570000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          Left = 342.205010000000000000
          Top = 257.787570000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          Top = 284.244280000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '9.')
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 30.236240000000000000
          Top = 284.244280000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 173.858380000000000000
          Top = 284.244280000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          Left = 257.008040000000000000
          Top = 284.244280000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo167: TfrxMemoView
          Left = 94.488250000000000000
          Top = 284.244280000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 585.047620000000000000
          Top = 284.244280000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo169: TfrxMemoView
          Left = 342.205010000000000000
          Top = 284.244280000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo170: TfrxMemoView
          Top = 310.700990000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '10.')
          ParentFont = False
        end
        object Memo171: TfrxMemoView
          Left = 30.236240000000000000
          Top = 310.700990000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo172: TfrxMemoView
          Left = 173.858380000000000000
          Top = 310.700990000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo173: TfrxMemoView
          Left = 257.008040000000000000
          Top = 310.700990000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo174: TfrxMemoView
          Left = 94.488250000000000000
          Top = 310.700990000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo175: TfrxMemoView
          Left = 585.047620000000000000
          Top = 310.700990000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo176: TfrxMemoView
          Left = 342.205010000000000000
          Top = 310.700990000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 585.047620000000000000
          Top = 38.574830000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Paraf')
          ParentFont = False
        end
        object Memo186: TfrxMemoView
          Top = 10.236240000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pengambilan Bill Of Material :')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Top = 1.779530000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
      end
    end
  end
  object zqrSPK: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT i.no_bukti no_so, k.nama nama_customer, a.id, a.no_spk, a' +
        '.tanggal tgl_spk, c.id_brg, d.deskripsi, a.qty qty_spk, h.satuan' +
        ', e.nama nama_mesin, a.toleransi,'
      
        'b.id_brg id_brg_bom, f.deskripsi deskripsi_bom, b.qty qty_bom, g' +
        '.satuan satuan_bom'
      'FROM tbl_spk a '
      'LEFT JOIN tbl_bom b ON a.id = b.id_spk'
      'LEFT JOIN tbl_mo c ON c.id = a.id_mo'
      'LEFT JOIN tbl_barang d on d.id = c.id_brg'
      'LEFT JOIN tbl_mesin e on e.id = a.id_mesin'
      'LEFT JOIN tbl_barang f on f.id = b.id_brg'
      'LEFT JOIN tbl_satuan g on g.id = b.id_satuan'
      'LEFT JOIN tbl_so_head i on i.id = c.id_so '
      'LEFT JOIN tbl_so_det j on j.id_ref = i.id'
      'LEFT JOIN tbl_satuan h on h.id = j.id_satuan'
      'LEFT JOIN tbl_customer k on k.id = i.id_cust'
      'WHERE a.id = :id_spk')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_spk'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_spk'
        ParamType = ptUnknown
      end>
  end
  object dsSPK: TDataSource
    DataSet = zqrSPK
    Left = 136
    Top = 16
  end
  object fdbSPK: TfrxDBDataset
    UserName = 'fdbSPK'
    CloseDataSource = False
    FieldAliases.Strings = (
      'no_so=no_so'
      'nama_customer=nama_customer'
      'id=id'
      'no_spk=no_spk'
      'tgl_spk=tgl_spk'
      'id_brg=id_brg'
      'deskripsi=deskripsi'
      'qty_spk=qty_spk'
      'satuan=satuan'
      'nama_mesin=nama_mesin'
      'toleransi=toleransi'
      'id_brg_bom=id_brg_bom'
      'deskripsi_bom=deskripsi_bom'
      'qty_bom=qty_bom'
      'satuan_bom=satuan_bom')
    DataSet = zqrSPK
    BCDToCurrency = True
    Left = 184
    Top = 16
  end
  object rptSPK: TfrxReport
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
      'begin'
      ''
      'end.')
    Left = 240
    Top = 24
    Datasets = <
      item
        DataSet = fdbSPK
        DataSetName = 'fdbSPK'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 138.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 3.000000000000000000
      BottomMargin = 3.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 253.228510000000000000
        Width = 755.906000000000000000
        DataSet = fdbSPK
        DataSetName = 'fdbSPK'
        KeepFooter = True
        KeepHeader = True
        KeepTogether = True
        RowCount = 0
        object fdbSPKdeskripsi_bom: TfrxMemoView
          Left = 37.795300000000000000
          Top = 2.000000000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi_bom'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."deskripsi_bom"]')
          ParentFont = False
        end
        object Line: TfrxMemoView
          Top = 2.000000000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Line#].')
          ParentFont = False
        end
        object fdbSPKqty_bom: TfrxMemoView
          Left = 347.716760000000000000
          Top = 2.000000000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty_bom'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          DisplayFormat.FormatStr = '#,#0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbSPK."qty_bom"]')
          ParentFont = False
        end
        object fdbSPKsatuan_bom: TfrxMemoView
          Left = 449.764070000000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'satuan_bom'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbSPK."satuan_bom"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 210.016080000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        Condition = 'fdbSPK."id"'
        KeepTogether = True
        object Shape1: TfrxShapeView
          Width = 755.906000000000000000
          Height = 45.354360000000000000
          ShowHint = False
        end
        object Memo2: TfrxMemoView
          Top = 20.677180000000000000
          Width = 755.905511810000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbSPK."no_spk"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Top = 0.220470000000000000
          Width = 755.905511810000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Surat Perintah Kerja')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 46.913420000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No. Sales Order')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 128.504020000000000000
          Top = 46.913420000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbSPKno_so: TfrxMemoView
          Left = 143.622140000000000000
          Top = 46.913420000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_so'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."no_so"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 65.811070000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Customer')
          ParentFont = False
        end
        object fdbSPKnama_customer: TfrxMemoView
          Left = 143.622140000000000000
          Top = 65.811070000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_customer'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."nama_customer"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 128.504020000000000000
          Top = 65.811070000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 85.047310000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nama Barang')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 128.504020000000000000
          Top = 85.047310000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbSPKdeskripsi: TfrxMemoView
          Left = 143.622140000000000000
          Top = 85.047310000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."deskripsi"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Top = 122.842610000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'QTY. SPK')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 128.504020000000000000
          Top = 122.842610000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbSPKqty_spk: TfrxMemoView
          Left = 143.622140000000000000
          Top = 122.842610000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty_spk'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          DisplayFormat.FormatStr = '#,#0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbSPK."qty_spk"]')
          ParentFont = False
        end
        object fdbSPKsatuan: TfrxMemoView
          Left = 238.110390000000000000
          Top = 122.842610000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'satuan'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdbSPK."satuan"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Top = 103.944960000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Mesin')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 128.504020000000000000
          Top = 103.944960000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbSPKnama_mesin: TfrxMemoView
          Left = 143.622140000000000000
          Top = 103.944960000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_mesin'
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."nama_mesin"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Top = 141.740260000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Toleransi')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 128.504020000000000000
          Top = 141.740260000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ':')
          ParentFont = False
        end
        object fdbSPKtoleransi: TfrxMemoView
          Left = 143.622140000000000000
          Top = 141.740260000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbSPK
          DataSetName = 'fdbSPK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSPK."toleransi"] %')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Top = 182.677490000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Line6: TfrxLineView
          Top = 207.252320000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo92: TfrxMemoView
          Left = 37.795300000000000000
          Top = 185.236550000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nama Barang')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Top = 164.338900000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bill Of Material / Bahan Baku :')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 351.496290000000000000
          Top = 185.236550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Qty.')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 449.764070000000000000
          Top = 185.236550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Satuan')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Top = 185.236550000000000000
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
        object Memo11: TfrxMemoView
          Left = 511.149970000000000000
          Top = 152.960730000000000000
          Width = 71.811070000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 589.520100000000000000
          Top = 155.960730000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Gram / Meter')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 370.393940000000000000
        Top = 298.582870000000000000
        Width = 755.906000000000000000
        KeepChild = True
        object Line3: TfrxLineView
          Top = 20.559060000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Top = 20.795300000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo100: TfrxMemoView
          Top = 22.574830000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No.')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Left = 30.236240000000000000
          Top = 22.574830000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Tgl / Jam')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 173.858380000000000000
          Top = 22.574830000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Gudang')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 257.008040000000000000
          Top = 22.574830000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Jumlah')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Top = 43.252010000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo104: TfrxMemoView
          Left = 94.488250000000000000
          Top = 22.574830000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No. Bahan')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 342.205010000000000000
          Top = 22.574830000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Operator')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Top = 44.031540000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '1.')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 30.236240000000000000
          Top = 44.031540000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 173.858380000000000000
          Top = 44.031540000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 257.008040000000000000
          Top = 44.031540000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 94.488250000000000000
          Top = 44.031540000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 585.047620000000000000
          Top = 44.031540000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 342.205010000000000000
          Top = 44.031540000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Top = 63.047310000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '2.')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 30.236240000000000000
          Top = 63.047310000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 173.858380000000000000
          Top = 63.047310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 257.008040000000000000
          Top = 63.047310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 94.488250000000000000
          Top = 63.047310000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 585.047620000000000000
          Top = 63.047310000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 342.205010000000000000
          Top = 63.047310000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Top = 82.504020000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '3.')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 30.236240000000000000
          Top = 82.504020000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 173.858380000000000000
          Top = 82.504020000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 257.008040000000000000
          Top = 82.504020000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          Left = 94.488250000000000000
          Top = 82.504020000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          Left = 585.047620000000000000
          Top = 82.504020000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          Left = 342.205010000000000000
          Top = 82.504020000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          Top = 101.519790000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '4.')
          ParentFont = False
        end
        object Memo129: TfrxMemoView
          Left = 30.236240000000000000
          Top = 101.519790000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 173.858380000000000000
          Top = 101.519790000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          Left = 257.008040000000000000
          Top = 101.519790000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo132: TfrxMemoView
          Left = 94.488250000000000000
          Top = 101.519790000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo133: TfrxMemoView
          Left = 585.047620000000000000
          Top = 101.519790000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo134: TfrxMemoView
          Left = 342.205010000000000000
          Top = 101.519790000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo135: TfrxMemoView
          Top = 120.417440000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '5.')
          ParentFont = False
        end
        object Memo136: TfrxMemoView
          Left = 30.236240000000000000
          Top = 120.417440000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo137: TfrxMemoView
          Left = 173.858380000000000000
          Top = 120.417440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '......................')
          ParentFont = False
        end
        object Memo138: TfrxMemoView
          Left = 257.008040000000000000
          Top = 120.417440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.....................')
          ParentFont = False
        end
        object Memo139: TfrxMemoView
          Left = 94.488250000000000000
          Top = 120.417440000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '................')
          ParentFont = False
        end
        object Memo140: TfrxMemoView
          Left = 585.047620000000000000
          Top = 120.417440000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '.........................')
          ParentFont = False
        end
        object Memo141: TfrxMemoView
          Left = 342.205010000000000000
          Top = 120.417440000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '................................................................' +
              '....................................')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 585.047620000000000000
          Top = 22.574830000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Paraf')
          ParentFont = False
        end
        object Memo186: TfrxMemoView
          Top = 0.677180000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Perincian Pengambilan Bahan :')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Top = 0.779530000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
      end
    end
  end
end
