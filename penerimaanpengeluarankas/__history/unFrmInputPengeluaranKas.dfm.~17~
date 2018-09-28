inherited frmInputPengeluaranKas: TfrmInputPengeluaranKas
  Caption = 'Input Penerimaan Kas'
  ClientWidth = 1102
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
      OptionsBehavior.FocusCellOnTab = True
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
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
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
end
