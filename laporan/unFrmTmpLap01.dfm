object frmTmpLap01: TfrmTmpLap01
  Left = 0
  Top = 0
  Caption = 'TmpLap01'
  ClientHeight = 371
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rptSJ01: TfrxReport
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
    Left = 8
    Top = 16
    Datasets = <
      item
        DataSet = fdbSJ01
        DataSetName = 'fdbSJ01'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 240.000000000000000000
      PaperHeight = 138.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 869.291900000000000000
        DataSet = fdbSJ01
        DataSetName = 'fdbSJ01'
        RowCount = 0
        object fdbSJ01deskripsi: TfrxMemoView
          Left = 34.015770000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."deskripsi"]')
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
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object fdbSJ01qty: TfrxMemoView
          Left = 438.425480000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbSJ01."qty"]')
          ParentFont = False
        end
        object fdbSJ01jml_ikat_per_karung: TfrxMemoView
          Left = 336.378170000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jml_ikat_per_karung'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbSJ01."jml_ikat_per_karung"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 30.236240000000000000
        Top = 18.897650000000000000
        Width = 869.291900000000000000
        object Memo1: TfrxMemoView
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Surat Jalan')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 188.976500000000000000
        Top = 109.606370000000000000
        Width = 869.291900000000000000
        Condition = 'fdbSJ01."id"'
        object Memo2: TfrxMemoView
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
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
          Font.Style = [fsBold]
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
          Left = 438.425480000000000000
          Top = 18.897650000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdbSJ01."nama"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 343.937230000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tanggal')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 343.937230000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Kepada Yth.')
          ParentFont = False
        end
        object fdbSJ01tanggal: TfrxMemoView
          Left = 438.425480000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdbSJ01."tanggal"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 154.960730000000000000
          Width = 759.685530000000000000
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
        object Memo7: TfrxMemoView
          Left = 34.015770000000000000
          Top = 162.519790000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Nama Barang')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 336.378170000000000000
          Top = 162.519790000000000000
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
            'Jml. Ikat / Bal')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 438.425480000000000000
          Top = 162.519790000000000000
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
            'Jml. Bal')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 540.472790000000000000
          Top = 162.519790000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Keterangan')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 185.196970000000000000
          Width = 759.685530000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 207.874150000000000000
        Top = 366.614410000000000000
        Width = 869.291900000000000000
        object Line3: TfrxLineView
          Top = 4.559060000000000000
          Width = 759.685530000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Top = 3.779530000000000000
          Width = 238.110390000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Barang yang diterima dalam '
            'keadaan Baik dan Benar')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 11.338590000000000000
          Top = 71.811070000000000000
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
            'Penerima')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 11.338590000000000000
          Top = 124.724490000000000000
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
        object Memo14: TfrxMemoView
          Left = 374.173470000000000000
          Top = 71.811070000000000000
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
            'Sopir')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 374.173470000000000000
          Top = 124.724490000000000000
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
        object Memo16: TfrxMemoView
          Left = 472.441250000000000000
          Top = 71.811070000000000000
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
            'Gudang')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 472.441250000000000000
          Top = 124.724490000000000000
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
        object Memo18: TfrxMemoView
          Left = 574.488560000000000000
          Top = 71.811070000000000000
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
            'Hormat Kami, ')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 608.504330000000000000
          Top = 124.724490000000000000
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
          Top = 147.401670000000000000
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
      end
    end
  end
  object zqrSJ01: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.*, b.qty, b.hrgjual, '
      'c.nama, c.alamat, '
      'd.deskripsi, '
      'e.jml_ikat_per_karung'
      'FROM tbl_trskeluar_head a'
      'INNER JOIN tbl_trskeluar_det b ON a.id = b.id_ref'
      'LEFT JOIN tbl_customer c ON c.id = a.id_customer'
      'LEFT JOIN tbl_barang d ON d.id = b.id_brg'
      'LEFT JOIN tbl_barang_det_spek e ON e.id_ref = d.id'
      'WHERE a.id = :id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object dsSJ01: TDataSource
    DataSet = zqrSJ01
    Left = 136
    Top = 16
  end
  object fdbSJ01: TfrxDBDataset
    UserName = 'fdbSJ01'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'no_bukti=no_bukti'
      'tanggal=tanggal'
      'jam=jam'
      'user=user'
      'user_dept=user_dept'
      'tgl_input=tgl_input'
      'f_approval=f_approval'
      'user_approval=user_approval'
      'sopir=sopir'
      'keterangan=keterangan'
      'id_customer=id_customer'
      'diskon=diskon'
      'f_ppn=f_ppn'
      'jatuh_tempo=jatuh_tempo'
      'qty=qty'
      'hrgjual=hrgjual'
      'nama=nama'
      'alamat=alamat'
      'deskripsi=deskripsi'
      'jml_ikat_per_karung=jml_ikat_per_karung')
    DataSet = zqrSJ01
    BCDToCurrency = True
    Left = 184
    Top = 16
  end
  object rptFakturPenjualan: TfrxReport
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
    Left = 64
    Top = 72
    Datasets = <
      item
        DataSet = fdbSJ01
        DataSetName = 'fdbSJ01'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'PPN'
        Value = 
          '((SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)-((<fdbSJ01."diskon">/' +
          '100)*SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)))/1.1)*(10/100)'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 240.000000000000000000
      PaperHeight = 138.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 869.291900000000000000
        DataSet = fdbSJ01
        DataSetName = 'fdbSJ01'
        RowCount = 0
        object fdbSJ01deskripsi: TfrxMemoView
          Left = 34.015770000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."deskripsi"]')
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
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object fdbSJ01qty: TfrxMemoView
          Left = 438.425480000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbSJ01."qty"]')
          ParentFont = False
        end
        object fdbSJ01jml_ikat_per_karung: TfrxMemoView
          Left = 336.378170000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jml_ikat_per_karung'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbSJ01."jml_ikat_per_karung"]')
          ParentFont = False
        end
        object fdbSJ01hrgjual: TfrxMemoView
          Left = 540.472790000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'hrgjual'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbSJ01."hrgjual"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 631.181510000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<fdbSJ01."hrgjual">*<fdbSJ01."qty">]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 30.236240000000000000
        Top = 18.897650000000000000
        Width = 869.291900000000000000
        object Memo1: TfrxMemoView
          Width = 869.291900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Faktur Penjualan')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 188.976500000000000000
        Top = 109.606370000000000000
        Width = 869.291900000000000000
        Condition = 'fdbSJ01."id"'
        object Memo2: TfrxMemoView
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
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
          Font.Style = [fsBold]
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
          Left = 438.425480000000000000
          Top = 18.897650000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdbSJ01."nama"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 343.937230000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tanggal')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 343.937230000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Kepada Yth.')
          ParentFont = False
        end
        object fdbSJ01tanggal: TfrxMemoView
          Left = 438.425480000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdbSJ01."tanggal"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 154.960730000000000000
          Width = 759.685530000000000000
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
        object Memo7: TfrxMemoView
          Left = 34.015770000000000000
          Top = 162.519790000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Nama Barang')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 336.378170000000000000
          Top = 162.519790000000000000
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
            'Jml. Ikat / Bal')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 438.425480000000000000
          Top = 162.519790000000000000
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
            'Jml. Bal')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 540.472790000000000000
          Top = 162.519790000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Harga / Bal')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 185.196970000000000000
          Width = 759.685530000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          Left = 631.181510000000000000
          Top = 162.519790000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Harga Total')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 132.283550000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'No. Faktur : ')
          ParentFont = False
        end
        object fdbSJ01no_bukti: TfrxMemoView
          Left = 90.708720000000000000
          Top = 132.283550000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_bukti'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSJ01."no_bukti"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 162.519790000000000000
        Top = 366.614410000000000000
        Width = 869.291900000000000000
        object Line3: TfrxLineView
          Top = 4.559060000000000000
          Width = 759.685530000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 532.913730000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Sub Total')
        end
        object SysMemo1: TfrxSysMemoView
          Left = 631.181510000000000000
          Top = 11.338590000000000000
          Width = 120.944960000000000000
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
            '[SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 532.913730000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Diskon (%)')
        end
        object Memo13: TfrxMemoView
          Left = 532.913730000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Stlh. Diskon')
        end
        object Memo14: TfrxMemoView
          Left = 532.913730000000000000
          Top = 79.370130000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'DPP')
        end
        object Memo15: TfrxMemoView
          Left = 532.913730000000000000
          Top = 102.047310000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'PPN 10%')
        end
        object Memo16: TfrxMemoView
          Left = 532.913730000000000000
          Top = 124.724490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Harga Total')
        end
        object fdbSJ01diskon: TfrxMemoView
          Left = 631.181510000000000000
          Top = 34.015770000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'diskon'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbSJ01."diskon"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 631.181510000000000000
          Top = 56.692950000000000000
          Width = 120.944960000000000000
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
            
              '[SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)-((<fdbSJ01."diskon">/1' +
              '00)*SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">))]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 631.181510000000000000
          Top = 79.370130000000000000
          Width = 120.944960000000000000
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
            
              '[(SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)-((<fdbSJ01."diskon">/' +
              '100)*SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)))/1.1]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 631.181510000000000000
          Top = 102.047310000000000000
          Width = 120.944960000000000000
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
            
              '[((SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)-((<fdbSJ01."diskon">' +
              '/100)*SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)))/1.1)*(10/100)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 631.181510000000000000
          Top = 124.724490000000000000
          Width = 120.944960000000000000
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
            
              '[((SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)-((<fdbSJ01."diskon">' +
              '/100)*SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)))/1.1)+<PPN>]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 11.338590000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Jatuh Tempo : ')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Top = 41.574830000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Hormat Kami, ')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Top = 102.047310000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '( ...................... )')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 124.724490000000000000
          Width = 124.724490000000000000
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
        object fdbSJ01jatuh_tempo: TfrxMemoView
          Left = 102.047310000000000000
          Top = 11.338590000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jatuh_tempo'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[fdbSJ01."jatuh_tempo"]')
        end
      end
    end
  end
  object rptFakturPenjualanNonPPN: TfrxReport
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
    Left = 184
    Top = 72
    Datasets = <
      item
        DataSet = fdbSJ01
        DataSetName = 'fdbSJ01'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'PPN'
        Value = 
          '((SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)-((<fdbSJ01."diskon">/' +
          '100)*SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)))/1.1)*(10/100)'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 240.000000000000000000
      PaperHeight = 138.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 869.291900000000000000
        DataSet = fdbSJ01
        DataSetName = 'fdbSJ01'
        RowCount = 0
        object fdbSJ01deskripsi: TfrxMemoView
          Left = 34.015770000000000000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'deskripsi'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."deskripsi"]')
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
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object fdbSJ01qty: TfrxMemoView
          Left = 548.031850000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbSJ01."qty"]')
          ParentFont = False
        end
        object fdbSJ01jml_ikat_per_karung: TfrxMemoView
          Left = 445.984540000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jml_ikat_per_karung'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbSJ01."jml_ikat_per_karung"]')
          ParentFont = False
        end
        object fdbSJ01hrgjual: TfrxMemoView
          Left = 650.079160000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'hrgjual'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[fdbSJ01."hrgjual"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 740.787880000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<fdbSJ01."hrgjual">*<fdbSJ01."qty">]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 30.236240000000000000
        Top = 18.897650000000000000
        Width = 869.291900000000000000
        object Memo1: TfrxMemoView
          Width = 869.291900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Faktur Penjualan')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 188.976500000000000000
        Top = 109.606370000000000000
        Width = 869.291900000000000000
        Condition = 'fdbSJ01."id"'
        object fdbSJ01nama: TfrxMemoView
          Left = 650.079160000000000000
          Top = 18.897650000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdbSJ01."nama"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 555.590910000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tanggal')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 555.590910000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Kepada Yth.')
          ParentFont = False
        end
        object fdbSJ01tanggal: TfrxMemoView
          Left = 650.079160000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdbSJ01."tanggal"]')
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
        object Memo7: TfrxMemoView
          Left = 34.015770000000000000
          Top = 162.519790000000000000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Nama Barang')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 445.984540000000000000
          Top = 162.519790000000000000
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
            'Jml. Ikat / Bal')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 548.031850000000000000
          Top = 162.519790000000000000
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
            'Jml. Bal')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 650.079160000000000000
          Top = 162.519790000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Harga / Bal')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 185.196970000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          Left = 740.787880000000000000
          Top = 162.519790000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Harga Total')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 132.283550000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'No. Faktur : ')
          ParentFont = False
        end
        object fdbSJ01no_bukti: TfrxMemoView
          Left = 90.708720000000000000
          Top = 132.283550000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_bukti'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSJ01."no_bukti"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 162.519790000000000000
        Top = 366.614410000000000000
        Width = 869.291900000000000000
        object Line3: TfrxLineView
          Top = 4.559060000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 646.299630000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Sub Total')
        end
        object SysMemo1: TfrxSysMemoView
          Left = 744.567410000000000000
          Top = 7.559060000000000000
          Width = 120.944960000000000000
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
            '[SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 646.299630000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Diskon (%)')
        end
        object Memo13: TfrxMemoView
          Left = 646.299630000000000000
          Top = 52.913420000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Stlh. Diskon')
        end
        object Memo14: TfrxMemoView
          Left = 646.299630000000000000
          Top = 75.590600000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'DPP')
        end
        object Memo15: TfrxMemoView
          Left = 646.299630000000000000
          Top = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'PPN 10%')
        end
        object Memo16: TfrxMemoView
          Left = 532.913730000000000000
          Top = 124.724490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Harga Total')
        end
        object fdbSJ01diskon: TfrxMemoView
          Left = 744.567410000000000000
          Top = 30.236240000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'diskon'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbSJ01."diskon"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 744.567410000000000000
          Top = 52.913420000000000000
          Width = 120.944960000000000000
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
            
              '[SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)-((<fdbSJ01."diskon">/1' +
              '00)*SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">))]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 744.567410000000000000
          Top = 75.590600000000000000
          Width = 120.944960000000000000
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
            
              '[(SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)-((<fdbSJ01."diskon">/' +
              '100)*SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)))/1.1]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 744.567410000000000000
          Top = 98.267780000000000000
          Width = 120.944960000000000000
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
            
              '[((SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)-((<fdbSJ01."diskon">' +
              '/100)*SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)))/1.1)*(10/100)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 631.181510000000000000
          Top = 124.724490000000000000
          Width = 120.944960000000000000
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
            
              '[((SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)-((<fdbSJ01."diskon">' +
              '/100)*SUM(<fdbSJ01."qty">*<fdbSJ01."hrgjual">)))/1.1)+<PPN>]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 11.338590000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Jatuh Tempo : ')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Top = 41.574830000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Hormat Kami, ')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Top = 102.047310000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '( ...................... )')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 124.724490000000000000
          Width = 124.724490000000000000
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
        object fdbSJ01jatuh_tempo: TfrxMemoView
          Left = 102.047310000000000000
          Top = 11.338590000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jatuh_tempo'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[fdbSJ01."jatuh_tempo"]')
        end
      end
    end
  end
end
