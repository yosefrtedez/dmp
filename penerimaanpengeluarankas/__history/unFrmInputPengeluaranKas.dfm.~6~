inherited frmInputPengeluaranKas: TfrmInputPengeluaranKas
  Caption = 'Input Penerimaan Kas'
  ClientWidth = 1102
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1102
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1102
    ExplicitWidth = 1102
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 186
      Height = 19
      Caption = 'Input Pengeluaran Kas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 1102
    TabOrder = 18
    ExplicitWidth = 1102
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 63
    Caption = 'No. Bukti'
  end
  object cxtNoBukti: TcxTextEdit
    Left = 104
    Top = 62
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 90
    Caption = 'Tanggal'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 257
    Width = 1082
    Height = 216
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 17
    object cxtbPK: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#0.00'
          Kind = skSum
          Column = cxColJumlah
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnAfterPost = cxtbPKDataControllerAfterPost
      DataController.OnBeforePost = cxtbPKDataControllerBeforePost
      DataController.OnRecordChanged = cxtbPKDataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxColNoAkun: TcxGridColumn
        Caption = 'Akun'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'No. Akun'
            FieldName = 'noakun'
          end
          item
            Caption = 'Nama Akun'
            FieldName = 'nama'
          end>
        Properties.ListSource = dsAkunDet
        Width = 117
      end
      object cxColNamaAkun: TcxGridColumn
        Caption = 'Nama Akun'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Nama Akun'
            FieldName = 'nama'
          end
          item
            Caption = 'No. Akun'
            FieldName = 'noakun'
          end>
        Properties.ListSource = dsAkunDet
        Width = 338
      end
      object cxColJumlah: TcxGridColumn
        Caption = 'Jumlah'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 144
      end
      object cxColMemo: TcxGridColumn
        Caption = 'Memo'
        Width = 333
      end
      object cxColNoAkun2: TcxGridColumn
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbPK
    end
  end
  object cxdTanggal: TcxDateEdit
    Left = 104
    Top = 89
    TabOrder = 4
    Width = 121
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 117
    Caption = 'Akun Kas'
  end
  object cxlAkunKas: TcxLookupComboBox
    Left = 104
    Top = 116
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Nama Akun'
        FieldName = 'nama'
      end
      item
        Caption = 'No. Akun'
        FieldName = 'noakun'
      end>
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = dsAkunKas
    Properties.OnEditValueChanged = cxlAkunPropertiesEditValueChanged
    TabOrder = 6
    Width = 353
  end
  object cxLabel4: TcxLabel
    Left = 10
    Top = 144
    Caption = 'Penerima'
  end
  object cxLabel5: TcxLabel
    Left = 10
    Top = 171
    Caption = 'Sebesar'
  end
  object cxLabel6: TcxLabel
    Left = 10
    Top = 198
    Caption = 'Terbilang'
  end
  object cxtTerbilang: TcxTextEdit
    Left = 104
    Top = 197
    Properties.ReadOnly = True
    TabOrder = 13
    Width = 521
  end
  object cxsSebesar: TcxSpinEdit
    Left = 104
    Top = 170
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    TabOrder = 11
    Width = 169
  end
  object cxtPenerima: TcxTextEdit
    Left = 104
    Top = 143
    Properties.CharCase = ecUpperCase
    TabOrder = 9
    Width = 353
  end
  object cxtNoAkun: TcxTextEdit
    Left = 463
    Top = 116
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 121
  end
  object cxLabel7: TcxLabel
    Left = 10
    Top = 225
    Caption = 'Memo'
  end
  object cxtMemo: TcxTextEdit
    Left = 104
    Top = 224
    Properties.CharCase = ecUpperCase
    TabOrder = 15
    Width = 521
  end
  object cxChkPosting: TcxCheckBox
    Left = 232
    Top = 63
    Caption = 'Posting'
    Properties.ReadOnly = False
    TabOrder = 3
    Width = 73
  end
  object zqrAkunDet: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, noakun, nama, '
      
        '(SELECT COUNT(noakun) FROM tbl_coa WHERE induk = a.noakun) jml_a' +
        'nak '
      'FROM tbl_coa a'
      
        'WHERE (SELECT COUNT(noakun) FROM tbl_coa WHERE induk = a.noakun)' +
        ' = 0'
      'AND tipe <> 1')
    Params = <>
    Left = 776
    Top = 136
  end
  object dsAkunDet: TDataSource
    DataSet = zqrAkunDet
    Left = 856
    Top = 136
  end
  object zqrAkunKas: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, noakun, nama, '
      
        '(SELECT COUNT(noakun) FROM tbl_coa WHERE induk = a.noakun) jml_a' +
        'nak '
      'FROM tbl_coa a'
      
        'WHERE (SELECT COUNT(noakun) FROM tbl_coa WHERE induk = a.noakun)' +
        ' = 0'
      'AND tipe = 1')
    Params = <>
    Left = 776
    Top = 88
  end
  object dsAkunKas: TDataSource
    DataSet = zqrAkunKas
    Left = 856
    Top = 88
  end
  object rptBKK: TfrxReport
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
    Left = 483
    Top = 67
    Datasets = <
      item
        DataSet = fdbBKK
        DataSetName = 'fdbBKK'
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
        object fdbBKKkepada: TfrxMemoView
          Left = 2.724490000000000000
          Top = 14.779530000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kepada'
          DataSet = fdbBKK
          DataSetName = 'fdbBKK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbBKK."kepada"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 268.346630000000000000
          Top = 7.559060000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'BUKTI KAS KELUAR')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 211.653680000000000000
        Width = 755.906000000000000000
        DataSet = fdbBKK
        DataSetName = 'fdbBKK'
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
        object fdbBKKakun_1: TfrxMemoView
          Left = 34.015770000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'akun_1'
          DataSet = fdbBKK
          DataSetName = 'fdbBKK'
          Memo.UTF8W = (
            '[fdbBKK."akun_1"]')
        end
        object fdbBKKketerangan_1: TfrxMemoView
          Left = 158.740260000000000000
          Width = 374.173470000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'keterangan_1'
          DataSet = fdbBKK
          DataSetName = 'fdbBKK'
          Memo.UTF8W = (
            '[fdbBKK."keterangan_1"]')
        end
        object fdbBKKjumlah_1: TfrxMemoView
          Left = 540.472790000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jumlah_1'
          DataSet = fdbBKK
          DataSetName = 'fdbBKK'
          Memo.UTF8W = (
            '[fdbBKK."jumlah_1"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 26.456710000000000000
        Top = 79.370130000000000000
        Width = 755.906000000000000000
        object Memo2: TfrxMemoView
          Left = 37.795300000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Kode Perkiraan')
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
          Left = 158.740260000000000000
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
            'Urian')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 24.456710000000000000
          Width = 752.126470000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          Left = 540.472790000000000000
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
            'Jumlah')
          ParentFont = False
        end
      end
      object Memo1: TfrxMemoView
        Top = 16.456710000000000000
        Width = 120.944960000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'Dibayarkan kepada :')
        ParentFont = False
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 755.906000000000000000
        Condition = 'fdbBKK."id"'
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 257.008040000000000000
        Width = 755.906000000000000000
        object fdbBKKjumlah_11: TfrxMemoView
          Left = 544.252320000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = fdbBKK
          DataSetName = 'fdbBKK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[SUM(<fdbBKK."jumlah_1">,MasterData1)][fdbBKK."jumlah_1"]')
          ParentFont = False
        end
      end
    end
  end
  object zqrBKK: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.*, b.id_ref, b.akun, b.keterangan, b.jumlah, b.no_bukti' +
        ' '
      'FROM tbl_trskk_head a'
      'LEFT JOIN tbl_trskk_det b ON a.id = b.`id_ref`'
      'WHERE a.no_bukti = :no_bukti;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'no_bukti'
        ParamType = ptUnknown
      end>
    Left = 523
    Top = 67
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'no_bukti'
        ParamType = ptUnknown
      end>
  end
  object dsBKK: TDataSource
    DataSet = zqrBKK
    Left = 568
    Top = 69
  end
  object fdbBKK: TfrxDBDataset
    UserName = 'fdbBKK'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'no_bukti=no_bukti'
      'tanggal=tanggal'
      'kepada=kepada'
      'dari=dari'
      'keterangan=keterangan'
      'jumlah=jumlah'
      'akun=akun'
      'id_ref=id_ref'
      'akun_1=akun_1'
      'keterangan_1=keterangan_1'
      'jumlah_1=jumlah_1'
      'no_bukti_1=no_bukti_1')
    DataSet = zqrBKK
    BCDToCurrency = True
    Left = 614
    Top = 72
  end
end
