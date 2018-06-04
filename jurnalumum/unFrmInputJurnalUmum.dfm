inherited frmInputJurnalUmum: TfrmInputJurnalUmum
  Caption = 'Input Jurnal Umum'
  ClientWidth = 995
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 995
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 995
  end
  inherited Panel2: TPanel
    Width = 995
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 69
    Caption = 'Tanggal'
  end
  object cxdTgl: TcxDateEdit
    Left = 101
    Top = 67
    TabOrder = 3
    Width = 121
  end
  object cxChkPosting: TcxCheckBox
    Left = 224
    Top = 68
    Caption = 'Posting'
    TabOrder = 4
    Width = 121
  end
  object cxtNoBukti: TcxTextEdit
    Left = 101
    Top = 94
    Properties.ReadOnly = True
    Style.Color = clWindow
    TabOrder = 5
    Width = 121
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 96
    Caption = 'No. Bukti'
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 122
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 101
    Top = 121
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = False
    Style.Color = clWindow
    TabOrder = 8
    Width = 410
  end
  object cxGrd: TcxGrid
    Left = 8
    Top = 162
    Width = 953
    Height = 249
    TabOrder = 9
    object cxtbJurnalUmum: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      OnFocusedItemChanged = cxtbJurnalUmumFocusedItemChanged
      OnFocusedRecordChanged = cxtbJurnalUmumFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '#,#0.00'
          Column = cxColDebet
        end
        item
          Format = '#,#0.00'
          Column = cxColKredit
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#0.00'
          Kind = skSum
          Column = cxColDebet
        end
        item
          Format = '#,#0.00'
          Kind = skSum
          Column = cxColKredit
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnNewRecord = cxtbJurnalUmumDataControllerNewRecord
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxColNoAkun: TcxGridColumn
        Caption = 'No. Akun'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'noakun'
        Properties.ListColumns = <
          item
            Caption = 'No. Akun'
            FieldName = 'noakun'
          end
          item
            Caption = 'Nama Akun'
            FieldName = 'nama'
          end>
        Properties.ListSource = dsAkun
        Properties.OnChange = cxColNoAkunPropertiesChange
        Properties.OnEditValueChanged = cxColNoAkunPropertiesEditValueChanged
        Width = 79
      end
      object cxColNamaAkun: TcxGridColumn
        Caption = 'Nama Akun'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'noakun'
        Properties.ListColumns = <
          item
            Caption = 'Nama Akun'
            FieldName = 'nama'
          end
          item
            Caption = 'No. Akun'
            FieldName = 'noakun'
          end>
        Properties.ListSource = dsAkun
        Width = 255
      end
      object cxColDebet: TcxGridColumn
        Caption = 'Debet'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 101
      end
      object cxColKredit: TcxGridColumn
        Caption = 'Kredit'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 94
      end
      object cxColKeterangan: TcxGridColumn
        Caption = 'Keterangan'
        Width = 269
      end
    end
    object cxGrdLevel1: TcxGridLevel
      GridView = cxtbJurnalUmum
    end
  end
  object zqrAkun: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT noakun, nama, '
      
        '(SELECT COUNT(noakun) FROM tbl_coa WHERE induk = a.noakun) jml_a' +
        'nak '
      'FROM tbl_coa a'
      '-- WHERE tipe = 1 AND induk <> '#39'0'#39';'
      
        'WHERE (SELECT COUNT(noakun) FROM tbl_coa WHERE induk = a.noakun)' +
        ' = 0'
      '-- AND a.noakun <> '#39'1010101'#39)
    Params = <>
    Left = 665
    Top = 79
  end
  object dsAkun: TDataSource
    DataSet = zqrAkun
    Left = 727
    Top = 79
  end
end
