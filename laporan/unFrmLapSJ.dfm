object frmLapSJ: TfrmLapSJ
  Left = 0
  Top = 0
  Caption = 'frmLapSJ'
  ClientHeight = 358
  ClientWidth = 799
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
    EngineOptions.DoublePass = True
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
    Left = 16
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 138.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 21.921259842519690000
        Top = 249.448980000000000000
        Width = 755.906000000000000000
        DataSet = fdbSJ01
        DataSetName = 'fdbSJ01'
        KeepFooter = True
        KeepTogether = True
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
          Visible = False
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
        object fdbSJ01ket_detail: TfrxMemoView
          Left = 540.472790000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ket_detail'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."ket_detail"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 160.629921259842500000
        Top = 64.252010000000000000
        Width = 755.906000000000000000
        Condition = 'fdbSJ01."id"'
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
          Height = 90.708720000000000000
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
          Left = 467.795610000000000000
          Top = 18.897650000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSJ01."nama"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 373.307360000000000000
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
          Left = 373.307360000000000000
          Top = 18.897650000000000000
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
          Left = 467.795610000000000000
          Width = 287.244280000000000000
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
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSJ01."tanggal"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 134.960730000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Top = 136.519790000000000000
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
          Top = 136.519790000000000000
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
          Top = 136.519790000000000000
          Width = 98.267780000000000000
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
            'Jml. Ikat / Bal')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 438.425480000000000000
          Top = 136.519790000000000000
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
          Top = 136.519790000000000000
          Width = 215.433210000000000000
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
          Top = 158.196970000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          Top = 112.283550000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'No. Surat Jalan :')
        end
        object fdbSJ01no_sj: TfrxMemoView
          Left = 109.606370000000000000
          Top = 112.283550000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_bukti'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."no_bukti"]')
        end
        object fdbSJ01alamat: TfrxMemoView
          Left = 467.795610000000000000
          Top = 37.795300000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'alamat'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."alamat"]')
        end
        object fdbSJ01kota_1: TfrxMemoView
          Left = 467.795610000000000000
          Top = 56.692950000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kota_1'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."kota_1"]')
        end
        object Memo22: TfrxMemoView
          Left = 374.173470000000000000
          Top = 112.283550000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'NOPOL : ')
        end
        object fdbSJ01nopol: TfrxMemoView
          Left = 439.984540000000000000
          Top = 112.283550000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nopol'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."nopol"]')
        end
        object Memo23: TfrxMemoView
          Left = 542.929500000000000000
          Top = 112.283550000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Sopir : ')
        end
        object Memo24: TfrxMemoView
          Left = 590.063390000000000000
          Top = 112.283550000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'sopir'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."sopir"]')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 136.062987240000000000
        Top = 294.803340000000000000
        Width = 755.906000000000000000
        object Line3: TfrxLineView
          Top = 1.559060000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Top = 0.779530000000000000
          Width = 238.110390000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Barang yang diterima dalam '
            'keadaan Baik dan Benar')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 11.338590000000000000
          Top = 37.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
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
          Top = 90.724490000000000000
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
          Top = 37.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Sopir')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 374.173470000000000000
          Top = 90.724490000000000000
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
          Top = 37.811070000000000000
          Width = 94.488250000000000000
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
        object Memo17: TfrxMemoView
          Left = 472.441250000000000000
          Top = 90.724490000000000000
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
          Top = 37.811070000000000000
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
          Top = 90.724490000000000000
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
          Top = 113.401670000000000000
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
      object Header1: TfrxHeader
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Top = 1.000000000000000000
          Width = 755.905487400000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Surat Jalan')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 559.370440000000000000
          Top = 1.291280000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Hal : [<Page#>] / [<TotalPages#>]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 1.133858267716535000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date], [Time]')
          ParentFont = False
        end
      end
    end
  end
  object zqrSJ01: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.*, b.qty, b.harga, b.hrgikat,'
      'c.nama, c.alamat, c.kota,'
      'd.deskripsi, b.keterangan ket_detail,'
      'e.jml_ikat_per_karung,'
      'IF(a.jenis_sj=0,b.hrgikat,b.hrgikat) hargaikat'
      'FROM tbl_sj_head a'
      'INNER JOIN tbl_sj_det b ON a.id = b.id_ref'
      'LEFT JOIN tbl_customer c ON c.id = a.id_cust'
      'LEFT JOIN tbl_barang d ON d.id = b.id_brg'
      'LEFT JOIN tbl_barang_det_spek e ON e.id_ref = d.id'
      
        'LEFT JOIN tbl_so_det f ON f.id_ref = b.id_so AND f.id_brg = b.id' +
        '_brg'
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
      'kode_supplier=kode_supplier'
      'kode_customer=kode_customer'
      'id_cust=id_cust'
      'no_spmb=no_spmb'
      'no_so=no_so'
      'user=user'
      'user_dept=user_dept'
      'tgl_input=tgl_input'
      'f_cetak=f_cetak'
      'jml_cetak=jml_cetak'
      'f_batal=f_batal'
      'ongkos_kirim=ongkos_kirim'
      'ppn=ppn'
      'nama_cust=nama_cust'
      'alamat_cust=alamat_cust'
      'kota=kota'
      'f_posting=f_posting'
      'f_ppn=f_ppn'
      'jatuh_tempo=jatuh_tempo'
      'diskon=diskon'
      'keterangan=keterangan'
      'no_faktur=no_faktur'
      'sopir=sopir'
      'nopol=nopol'
      'tgl_edit=tgl_edit'
      'f_inv=f_inv'
      'jenis_sj=jenis_sj'
      'qty=qty'
      'harga=harga'
      'hrgikat=hrgikat'
      'nama=nama'
      'alamat=alamat'
      'kota_1=kota_1'
      'deskripsi=deskripsi'
      'ket_detail=ket_detail'
      'jml_ikat_per_karung=jml_ikat_per_karung'
      'hargaikat=hargaikat')
    DataSet = zqrSJ01
    BCDToCurrency = True
    Left = 184
    Top = 16
  end
  object rptFakturPenjualan: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
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
          '((SUM(<fdbSJ01."qty">*<fdbSJ01."harga">)-((<fdbSJ01."diskon">/10' +
          '0)*SUM(<fdbSJ01."qty">*<fdbSJ01."harga">)))/1.1)*(10/100)'
      end
      item
        Name = 'Subtotal'
        Value = 
          '<fdbSJ01."hargaikat">*<fdbSJ01."qty">*<fdbSJ01."jml_ikat_per_kar' +
          'ung">'
      end
      item
        Name = 'DPP'
        Value = '(SUM(<Subtotal>)-((<fdbSJ01."diskon">/100)*SUM(<Subtotal>)))/1.1'
      end
      item
        Name = 'PPN10'
        Value = 
          '((SUM(<Subtotal>)-((<fdbSJ01."diskon">/100)*SUM(<Subtotal>)))/1.' +
          '1)*(10/100)'
      end>
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
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 268.346630000000000000
        Width = 755.906000000000000000
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
          Left = 408.189240000000000000
          Width = 56.692950000000000000
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
          Width = 71.811070000000000000
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
          Left = 468.661720000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'hargaikat'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbSJ01."hargaikat"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 544.252320000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Subtotal]')
          ParentFont = False
        end
        object fdbSJ01ket_detail: TfrxMemoView
          Left = 634.961040000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ket_detail'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSJ01."ket_detail"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 173.858267720000000000
        Top = 71.811070000000000000
        Width = 755.906000000000000000
        Condition = 'fdbSJ01."id"'
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
          Left = 415.370078740000000000
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
          Left = 415.370078740000000000
          Top = 18.897650000000000000
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
          Left = 509.913730000000000000
          Width = 245.669450000000000000
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
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSJ01."tanggal"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 144.960730000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Top = 148.519790000000000000
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
          Top = 148.519790000000000000
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
          Top = 148.519790000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'J. Ikat / Bal')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 408.189240000000000000
          Top = 148.519790000000000000
          Width = 56.692950000000000000
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
          Left = 468.661720000000000000
          Top = 148.519790000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Harga')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 170.196970000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          Left = 544.252320000000000000
          Top = 148.519790000000000000
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
            'Harga Total')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 122.283550000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'No. Faktur : ')
          ParentFont = False
        end
        object fdbSJ01no_faktur: TfrxMemoView
          Left = 86.929190000000000000
          Top = 122.283550000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_faktur'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."no_faktur"]')
        end
        object fdbSJ01nama_cust: TfrxMemoView
          Left = 509.913730000000000000
          Top = 18.897650000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."nama"]')
        end
        object fdbSJ01alamat: TfrxMemoView
          Left = 509.913730000000000000
          Top = 37.795300000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'alamat'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."alamat"]')
        end
        object fdbSJ01kota: TfrxMemoView
          Left = 509.913730000000000000
          Top = 56.692950000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."kota_1"]')
        end
        object Memo30: TfrxMemoView
          Left = 634.961040000000000000
          Top = 148.535433070000000000
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
            'Keterangan')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 137.622140000000000000
        Top = 309.921460000000000000
        Width = 755.906000000000000000
        object Line3: TfrxLineView
          Top = 1.559060000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 411.968770000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Sub Total')
        end
        object SysMemo1: TfrxSysMemoView
          Left = 510.236550000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<Subtotal>,MasterData1)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 411.968770000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Diskon (%)')
        end
        object Memo13: TfrxMemoView
          Left = 411.968770000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Stlh. Diskon')
        end
        object Memo14: TfrxMemoView
          Left = 411.968770000000000000
          Top = 71.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'DPP')
        end
        object Memo15: TfrxMemoView
          Left = 411.968770000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'PPN 10%')
        end
        object Memo16: TfrxMemoView
          Left = 411.968770000000000000
          Top = 117.165430000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Total')
        end
        object fdbSJ01diskon: TfrxMemoView
          Left = 510.236550000000000000
          Top = 26.456710000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Left = 510.236550000000000000
          Top = 49.133890000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<Subtotal>)-((<fdbSJ01."diskon">/100)*SUM(<Subtotal>))]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 510.236550000000000000
          Top = 71.811070000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DPP]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 510.236550000000000000
          Top = 94.488250000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PPN10]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 510.236550000000000000
          Top = 117.165430000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<DPP>+<PPN10>]')
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
          Font.Style = []
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
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Hormat Kami, ')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Top = 96.047310000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '( ...................... )')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 118.724490000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
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
      object Header1: TfrxHeader
        Height = 30.236220470000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Top = 0.291280000000000000
          Width = 755.906000000000000000
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
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 559.370440000000000000
          Top = 1.070810000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Hal : [<Page>] / [<TotalPages>]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 1.070810000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date], [Time]')
          ParentFont = False
        end
      end
    end
  end
  object rptFakturPenjualanNonPPN: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
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
      end
      item
        Name = 'Subtotal'
        Value = '<fdbSJ01."harga">*<fdbSJ01."qty">'
      end>
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
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 21.921259842519690000
        Top = 219.212740000000000000
        Width = 755.906000000000000000
        DataSet = fdbSJ01
        DataSetName = 'fdbSJ01'
        RowCount = 0
        object fdbSJ01deskripsi: TfrxMemoView
          Left = 34.015770000000000000
          Width = 306.141930000000000000
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
          Left = 419.527830000000000000
          Width = 52.913420000000000000
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
          Left = 343.937230000000000000
          Width = 71.811070000000000000
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
          Left = 476.220780000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'hargaikat'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbSJ01."hargaikat"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 566.929500000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Subtotal]')
          ParentFont = False
        end
        object fdbSJ01ket_detail: TfrxMemoView
          Left = 653.858690000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ket_detail'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."ket_detail"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 129.259842520000000000
        Top = 68.031540000000000000
        Width = 755.906000000000000000
        Condition = 'fdbSJ01."id"'
        object fdbSJ01nama: TfrxMemoView
          Left = 509.913730000000000000
          Top = 22.677180000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSJ01."nama"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 415.425480000000000000
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
          Left = 415.425480000000000000
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
          Left = 509.913730000000000000
          Top = 3.779530000000000000
          Width = 245.669450000000000000
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
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSJ01."tanggal"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 101.960730000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Top = 104.519790000000000000
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
          Top = 104.519790000000000000
          Width = 306.141930000000000000
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
          Left = 343.937230000000000000
          Top = 104.519790000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'J. Ikat / Bal')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 419.527830000000000000
          Top = 104.519790000000000000
          Width = 52.913420000000000000
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
          Left = 476.220780000000000000
          Top = 104.519790000000000000
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
            'Harga')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 125.196970000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          Left = 566.929500000000000000
          Top = 104.519790000000000000
          Width = 83.149660000000000000
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
          Top = 79.283550000000000000
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
          Top = 79.283550000000000000
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
        object fdbSJ01alamat: TfrxMemoView
          Left = 509.913730000000000000
          Top = 41.574830000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'alamat'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."alamat"]')
        end
        object fdbSJ01kota: TfrxMemoView
          Left = 510.236550000000000000
          Top = 60.472480000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kota_1'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."kota_1"]')
        end
        object Memo2: TfrxMemoView
          Left = 653.858690000000000000
          Top = 104.519790000000000000
          Width = 102.047310000000000000
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
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 128.622140000000000000
        Top = 264.567100000000000000
        Width = 755.906000000000000000
        object Line3: TfrxLineView
          Top = 0.559060000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 430.866420000000000000
          Top = 4.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Sub Total')
        end
        object SysMemo1: TfrxSysMemoView
          Left = 529.134200000000000000
          Top = 4.559060000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<Subtotal>,MasterData1)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 430.866420000000000000
          Top = 27.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Diskon (%)')
        end
        object Memo13: TfrxMemoView
          Left = 430.866420000000000000
          Top = 49.913420000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Total')
        end
        object fdbSJ01diskon: TfrxMemoView
          Left = 529.134200000000000000
          Top = 27.236240000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
          Left = 529.134200000000000000
          Top = 49.913420000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<Subtotal>)-((<fdbSJ01."diskon">/100)*SUM(<Subtotal>))]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 4.338590000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Jatuh Tempo : ')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Top = 26.574830000000000000
          Width = 124.724490000000000000
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
        object Memo26: TfrxMemoView
          Top = 87.047310000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '( ...................... )')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 109.724490000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Admin PT. DMP')
          ParentFont = False
        end
        object fdbSJ01jatuh_tempo: TfrxMemoView
          Left = 102.047310000000000000
          Top = 4.338590000000000000
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
      object Header1: TfrxHeader
        Height = 26.456692913385830000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Top = 1.000000000000000000
          Width = 752.125984250000000000
          Height = 22.677180000000000000
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
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 555.590910000000000000
          Top = 1.000000000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Hal : [<Page#>] / [<TotalPages#>]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 1.000000000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date], [Time]')
          ParentFont = False
        end
      end
    end
  end
  object rptSJ01NonPPN: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
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
    Left = 344
    Top = 56
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 138.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 21.543307086614170000
        Top = 257.008040000000000000
        Width = 755.906000000000000000
        DataSet = fdbSJ01
        DataSetName = 'fdbSJ01'
        KeepFooter = True
        KeepTogether = True
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
          Visible = False
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
        object fdbSJ01keterangan: TfrxMemoView
          Left = 540.472790000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ket_detail'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."ket_detail"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 160.629921260000000000
        Top = 71.811070000000000000
        Width = 755.906000000000000000
        Condition = 'fdbSJ01."id"'
        object fdbSJ01nama: TfrxMemoView
          Left = 532.913730000000000000
          Top = 22.677180000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSJ01."nama"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 438.425480000000000000
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
          Left = 438.425480000000000000
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
          Left = 532.913730000000000000
          Top = 3.779530000000000000
          Width = 222.992270000000000000
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
          Font.Style = []
          Memo.UTF8W = (
            '[fdbSJ01."tanggal"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 133.960730000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Top = 135.519790000000000000
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
          Top = 135.519790000000000000
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
          Top = 135.519790000000000000
          Width = 98.267780000000000000
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
            'Jml. Ikat / Bal')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 438.425480000000000000
          Top = 135.519790000000000000
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
          Top = 135.519790000000000000
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
          Top = 157.196970000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          Top = 111.283550000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'No. Surat Jalan :')
        end
        object fdbSJ01no_sj: TfrxMemoView
          Left = 109.606370000000000000
          Top = 111.283550000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          ShowHint = False
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
        object fdbSJ01alamat: TfrxMemoView
          Left = 532.913730000000000000
          Top = 41.574830000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'alamat'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."alamat"]')
        end
        object fdbSJ01kota_1: TfrxMemoView
          Left = 532.913730000000000000
          Top = 60.472480000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kota_1'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."kota_1"]')
        end
        object Memo22: TfrxMemoView
          Left = 374.173470000000000000
          Top = 111.283550000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'NOPOL : ')
        end
        object fdbSJ01nopol: TfrxMemoView
          Left = 439.984540000000000000
          Top = 111.283550000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nopol'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."nopol"]')
        end
        object Memo23: TfrxMemoView
          Left = 542.929500000000000000
          Top = 111.283550000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Sopir : ')
        end
        object Memo24: TfrxMemoView
          Left = 590.063390000000000000
          Top = 111.283550000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'sopir'
          DataSet = fdbSJ01
          DataSetName = 'fdbSJ01'
          Memo.UTF8W = (
            '[fdbSJ01."sopir"]')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 143.622047240000000000
        Top = 302.362400000000000000
        Width = 755.906000000000000000
        object Line3: TfrxLineView
          Top = 0.559060000000000000
          Width = 865.512370000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Top = 3.779530000000000000
          Width = 238.110390000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Barang yang diterima dalam '
            'keadaan Baik dan Benar')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 11.338590000000000000
          Top = 37.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
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
          Top = 90.724490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '( .................... )')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 374.173470000000000000
          Top = 37.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Sopir')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 374.173470000000000000
          Top = 90.724490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '( .................... )')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 472.441250000000000000
          Top = 37.811070000000000000
          Width = 94.488250000000000000
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
        object Memo17: TfrxMemoView
          Left = 472.441250000000000000
          Top = 90.724490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '( .................... )')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 574.488560000000000000
          Top = 37.811070000000000000
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
          Top = 90.724490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '( .................... )')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 574.488560000000000000
          Top = 113.401670000000000000
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
            'Admin PT. DMP')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 28.346459130000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Top = 0.779530000000000000
          Width = 755.905514250000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Surat Jalan')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Top = 0.779530000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date], [Time]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 559.370440000000000000
          Top = 0.779530000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Hal : [<Page#>] / [<TotalPages#>]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
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
    Left = 336
    Top = 192
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
    Left = 432
    Top = 192
  end
end
