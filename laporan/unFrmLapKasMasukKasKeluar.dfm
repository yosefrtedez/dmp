object frmLapKasMasukKasKeluar: TfrmLapKasMasukKasKeluar
  Left = 0
  Top = 0
  Caption = 'Laporan Kas Masuk + Kas Keluar'
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
  object zqrKasMasuk: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.*, b.noakun, b.nama nama_head,  c.jumlah, d.noakun noak' +
        'un_det, d.nama nama_det, c.memo memo_det'
      'FROM tbl_penerimaankas_head a'
      'LEFT JOIN tbl_coa b ON b.id = a.id_akun'
      'LEFT JOIN tbl_penerimaankas_det c on c.id_ref = a.id'
      'LEFT JOIN tbl_coa d ON d.id = c.id_akun'
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
  object dsKasMasuk: TDataSource
    DataSet = zqrKasMasuk
    Left = 176
    Top = 16
  end
  object fdbKasMasuk: TfrxDBDataset
    UserName = 'fdbKasMasuk'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'no_bukti=no_bukti'
      'tanggal=tanggal'
      'id_akun=id_akun'
      'dari=dari'
      'sebesar=sebesar'
      'memo=memo'
      'user=user'
      'user_dept=user_dept'
      'tglinput=tglinput'
      'tgledit=tgledit'
      'f_posting=f_posting'
      'noakun=noakun'
      'nama_head=nama_head'
      'jumlah=jumlah'
      'noakun_det=noakun_det'
      'nama_det=nama_det'
      'memo_det=memo_det')
    DataSet = zqrKasMasuk
    BCDToCurrency = True
    Left = 256
    Top = 16
  end
  object rptKasMasuk: TfrxReport
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
    Left = 336
    Top = 24
    Datasets = <
      item
        DataSet = fdbKasMasuk
        DataSetName = 'fdbKasMasuk'
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
        Height = 22.677180000000000000
        Top = 230.551330000000000000
        Width = 755.906000000000000000
        DataSet = fdbKasMasuk
        DataSetName = 'fdbKasMasuk'
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
          Memo.UTF8W = (
            '[Line#].')
          ParentFont = False
        end
        object fdbKasMasukmemo_det: TfrxMemoView
          Left = 230.551330000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'memo_det'
          DataSet = fdbKasMasuk
          DataSetName = 'fdbKasMasuk'
          Memo.UTF8W = (
            '[fdbKasMasuk."memo_det"]')
        end
        object fdbKasMasukjumlah: TfrxMemoView
          Left = 578.268090000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jumlah'
          DataSet = fdbKasMasuk
          DataSetName = 'fdbKasMasuk'
          DisplayFormat.FormatStr = '#,#0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbKasMasuk."jumlah"]')
          ParentFont = False
        end
        object fdbKasMasuknoakun_det: TfrxMemoView
          Left = 34.015770000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbKasMasuk
          DataSetName = 'fdbKasMasuk'
          Memo.UTF8W = (
            '[<fdbKasMasuk."nama_det">] ([<fdbKasMasuk."noakun_det">])')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 187.338900000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        Condition = 'fdbKasMasuk."id"'
        KeepTogether = True
        object Shape1: TfrxShapeView
          Width = 755.906000000000000000
          Height = 49.133890000000000000
          ShowHint = False
        end
        object Memo1: TfrxMemoView
          Top = 13.220470000000000000
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
            'Bukti Kas / Bank Masuk')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 49.354360000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          Top = 109.606370000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Terima Dari')
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
        object Memo5: TfrxMemoView
          Top = 90.708720000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Untuk Pembayaran')
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
        object Memo10: TfrxMemoView
          Left = 128.504020000000000000
          Top = 109.606370000000000000
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
        object Memo22: TfrxMemoView
          Left = 128.504020000000000000
          Top = 90.708720000000000000
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
        object Memo24: TfrxMemoView
          Left = 128.504020000000000000
          Top = 128.504020000000000000
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
        object Line5: TfrxLineView
          Top = 154.677490000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Line6: TfrxLineView
          Top = 185.252320000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo92: TfrxMemoView
          Left = 30.236240000000000000
          Top = 161.236550000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nama Akun')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Top = 161.236550000000000000
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
        object fdbKasMasukdari: TfrxMemoView
          Left = 143.622140000000000000
          Top = 109.606370000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'dari'
          DataSet = fdbKasMasuk
          DataSetName = 'fdbKasMasuk'
          Memo.UTF8W = (
            '[fdbKasMasuk."dari"]')
        end
        object fdbKasMasukmemo: TfrxMemoView
          Left = 143.622140000000000000
          Top = 90.708720000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'memo'
          DataSet = fdbKasMasuk
          DataSetName = 'fdbKasMasuk'
          Memo.UTF8W = (
            '[fdbKasMasuk."memo"]')
        end
        object Memo2: TfrxMemoView
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
            'Nomor')
          ParentFont = False
        end
        object fdbKasMasukno_bukti: TfrxMemoView
          Left = 143.622140000000000000
          Top = 52.913420000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_bukti'
          DataSet = fdbKasMasuk
          DataSetName = 'fdbKasMasuk'
          Memo.UTF8W = (
            '[fdbKasMasuk."no_bukti"]')
        end
        object Memo7: TfrxMemoView
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
            'Tanggal')
          ParentFont = False
        end
        object fdbKasMasuktanggal: TfrxMemoView
          Left = 143.622140000000000000
          Top = 71.811070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = fdbKasMasuk
          DataSetName = 'fdbKasMasuk'
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[fdbKasMasuk."tanggal"]')
        end
        object Memo9: TfrxMemoView
          Top = 128.504020000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Kas / Bank')
          ParentFont = False
        end
        object fdbKasMasuknama_head: TfrxMemoView
          Left = 143.622140000000000000
          Top = 128.504020000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_head'
          DataSet = fdbKasMasuk
          DataSetName = 'fdbKasMasuk'
          Memo.UTF8W = (
            '[fdbKasMasuk."nama_head"]')
        end
        object Memo8: TfrxMemoView
          Left = 230.551330000000000000
          Top = 161.236550000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Keterangan')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 578.268090000000000000
          Top = 161.236550000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Jumlah')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 120.944960000000000000
        Top = 275.905690000000000000
        Width = 755.906000000000000000
        object Memo12: TfrxMemoView
          Left = 181.417440000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Diterima Oleh,')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 160.740260000000000000
          Top = 117.165430000000000000
          Width = 128.504020000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo1: TfrxSysMemoView
          Left = 578.268090000000000000
          Top = 3.779530000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '#,#0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<fdbKasMasuk."jumlah">,MasterData1)]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 480.000310000000000000
          Top = 3.779530000000000000
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
            'Total Rp.')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo14: TfrxMemoView
          Left = 28.236240000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Diperiksa Oleh,')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 7.559060000000000000
          Top = 117.165430000000000000
          Width = 128.504020000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          Left = 341.937230000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Disetujui Oleh,')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Left = 321.260050000000000000
          Top = 117.165430000000000000
          Width = 128.504020000000000000
          ShowHint = False
          Diagonal = True
        end
        object mmTerbilang: TfrxMemoView
          Width = 449.764070000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Terbilang : ')
          ParentFont = False
        end
      end
    end
  end
  object zqrKasKeluar: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.*, b.noakun, b.nama nama_head,  c.jumlah, d.noakun noak' +
        'un_det, d.nama nama_det, c.memo memo_det'
      'FROM tbl_pengeluarankas_head a'
      'LEFT JOIN tbl_coa b ON b.id = a.id_akun'
      'LEFT JOIN tbl_pengeluarankas_det c on c.id_ref = a.id'
      'LEFT JOIN tbl_coa d ON d.id = c.id_akun'
      'WHERE a.id = :id')
    Params = <
      item
        DataType = ftString
        Name = 'id'
        ParamType = ptUnknown
        Value = '1'
      end>
    Left = 88
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'id'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object dsKasKeluar: TDataSource
    DataSet = zqrKasKeluar
    Left = 176
    Top = 96
  end
  object fdbKasKeluar: TfrxDBDataset
    UserName = 'fdbKasKeluar'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'no_bukti=no_bukti'
      'tanggal=tanggal'
      'akunkas=akunkas'
      'penerima=penerima'
      'jumlah=jumlah'
      'memo=memo'
      'user=user'
      'user_dept=user_dept'
      'tglinput=tglinput'
      'tgledit=tgledit'
      'f_posting=f_posting'
      'id_akun=id_akun'
      'noakun=noakun'
      'nama_head=nama_head'
      'jumlah_1=jumlah_1'
      'noakun_det=noakun_det'
      'nama_det=nama_det'
      'memo_det=memo_det')
    DataSet = zqrKasKeluar
    BCDToCurrency = True
    Left = 256
    Top = 96
  end
  object rptKasKeluar: TfrxReport
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
    Left = 336
    Top = 96
    Datasets = <
      item
        DataSet = fdbKasKeluar
        DataSetName = 'fdbKasKeluar'
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
        Height = 22.677180000000000000
        Top = 230.551330000000000000
        Width = 755.906000000000000000
        DataSet = fdbKasKeluar
        DataSetName = 'fdbKasKeluar'
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
          Memo.UTF8W = (
            '[Line#].')
          ParentFont = False
        end
        object fdbKasMasukmemo_det: TfrxMemoView
          Left = 230.551330000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'memo_det'
          DataSet = fdbKasKeluar
          DataSetName = 'fdbKasKeluar'
          Memo.UTF8W = (
            '[fdbKasKeluar."memo_det"]')
        end
        object fdbKasMasukjumlah: TfrxMemoView
          Left = 578.268090000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jumlah'
          DataSet = fdbKasKeluar
          DataSetName = 'fdbKasKeluar'
          DisplayFormat.FormatStr = '#,#0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[fdbKasKeluar."jumlah"]')
          ParentFont = False
        end
        object fdbKasMasuknoakun_det: TfrxMemoView
          Left = 34.015770000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbKasKeluar
          DataSetName = 'fdbKasKeluar'
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 187.338900000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        Condition = 'fdbKasKeluar."id"'
        KeepTogether = True
        object Shape1: TfrxShapeView
          Width = 755.906000000000000000
          Height = 49.133890000000000000
          ShowHint = False
        end
        object Memo1: TfrxMemoView
          Top = 13.220470000000000000
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
            'Bukti Kas / Bank Keluar')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 49.354360000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          Top = 109.606370000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Terima Dari')
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
        object Memo5: TfrxMemoView
          Top = 90.708720000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Untuk Pembayaran')
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
        object Memo10: TfrxMemoView
          Left = 128.504020000000000000
          Top = 109.606370000000000000
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
        object Memo22: TfrxMemoView
          Left = 128.504020000000000000
          Top = 90.708720000000000000
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
        object Memo24: TfrxMemoView
          Left = 128.504020000000000000
          Top = 128.504020000000000000
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
        object Line5: TfrxLineView
          Top = 154.677490000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Line6: TfrxLineView
          Top = 185.252320000000000000
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo92: TfrxMemoView
          Left = 30.236240000000000000
          Top = 161.236550000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nama Akun')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Top = 161.236550000000000000
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
        object fdbKasMasukdari: TfrxMemoView
          Left = 143.622140000000000000
          Top = 109.606370000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'penerima'
          DataSet = fdbKasKeluar
          DataSetName = 'fdbKasKeluar'
          Memo.UTF8W = (
            '[fdbKasKeluar."penerima"]')
        end
        object fdbKasMasukmemo: TfrxMemoView
          Left = 143.622140000000000000
          Top = 90.708720000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'memo'
          DataSet = fdbKasKeluar
          DataSetName = 'fdbKasKeluar'
          Memo.UTF8W = (
            '[fdbKasKeluar."memo"]')
        end
        object Memo2: TfrxMemoView
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
            'Nomor')
          ParentFont = False
        end
        object fdbKasMasukno_bukti: TfrxMemoView
          Left = 143.622140000000000000
          Top = 52.913420000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_bukti'
          DataSet = fdbKasKeluar
          DataSetName = 'fdbKasKeluar'
          Memo.UTF8W = (
            '[fdbKasKeluar."no_bukti"]')
        end
        object Memo7: TfrxMemoView
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
            'Tanggal')
          ParentFont = False
        end
        object fdbKasMasuktanggal: TfrxMemoView
          Left = 143.622140000000000000
          Top = 71.811070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = fdbKasKeluar
          DataSetName = 'fdbKasKeluar'
          DisplayFormat.FormatStr = 'dd-MM-yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[fdbKasKeluar."tanggal"]')
        end
        object Memo9: TfrxMemoView
          Top = 128.504020000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Kas / Bank')
          ParentFont = False
        end
        object fdbKasMasuknama_head: TfrxMemoView
          Left = 143.622140000000000000
          Top = 128.504020000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_head'
          DataSet = fdbKasKeluar
          DataSetName = 'fdbKasKeluar'
          Memo.UTF8W = (
            '[fdbKasKeluar."nama_head"]')
        end
        object Memo8: TfrxMemoView
          Left = 230.551330000000000000
          Top = 161.236550000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Keterangan')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 578.268090000000000000
          Top = 161.236550000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Jumlah')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 120.944960000000000000
        Top = 275.905690000000000000
        Width = 755.906000000000000000
        object Memo12: TfrxMemoView
          Left = 181.417440000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Diterima Oleh,')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 160.740260000000000000
          Top = 117.165430000000000000
          Width = 128.504020000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo1: TfrxSysMemoView
          Left = 578.268090000000000000
          Top = 3.779530000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '#,#0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<fdbKasKeluar."jumlah">,MasterData1)]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 480.000310000000000000
          Top = 3.779530000000000000
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
            'Total Rp.')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Width = 755.905511810000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo14: TfrxMemoView
          Left = 28.236240000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Diperiksa Oleh,')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 7.559060000000000000
          Top = 117.165430000000000000
          Width = 128.504020000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          Left = 341.937230000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Disetujui Oleh,')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Left = 321.260050000000000000
          Top = 117.165430000000000000
          Width = 128.504020000000000000
          ShowHint = False
          Diagonal = True
        end
        object mmTerbilang: TfrxMemoView
          Width = 438.425480000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Terbilang : ')
          ParentFont = False
        end
      end
    end
  end
end
