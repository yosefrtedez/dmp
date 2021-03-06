inherited frmInputJurnalUmum: TfrmInputJurnalUmum
  Caption = 'Input Jurnal Umum'
  ClientWidth = 1025
  OnShow = FormShow
  ExplicitWidth = 1025
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1025
    ExplicitWidth = 1025
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 156
      Height = 19
      Caption = 'Input Jurnal Umum'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 1025
    TabOrder = 9
    ExplicitWidth = 1025
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 97
    Caption = 'Tanggal'
  end
  object cxdTgl: TcxDateEdit
    Left = 101
    Top = 95
    TabOrder = 4
    Width = 121
  end
  object cxChkPosting: TcxCheckBox
    Left = 224
    Top = 68
    Caption = 'Posting'
    TabOrder = 2
    Visible = False
    Width = 121
  end
  object cxtNoBukti: TcxTextEdit
    Left = 101
    Top = 68
    Properties.ReadOnly = True
    Style.Color = clWindow
    TabOrder = 1
    Width = 121
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 70
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
    TabOrder = 6
    Width = 410
  end
  object cxGrd: TcxGrid
    Left = 8
    Top = 152
    Width = 1009
    Height = 249
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 8
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
      DataController.OnBeforePost = cxtbJurnalUmumDataControllerBeforePost
      DataController.OnNewRecord = cxtbJurnalUmumDataControllerNewRecord
      DataController.OnRecordChanged = cxtbJurnalUmumDataControllerRecordChanged
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxColNoAkun: TcxGridColumn
        Caption = 'No. Akun'
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
        Properties.ListSource = dsAkun
        Width = 98
      end
      object cxColNamaAkun: TcxGridColumn
        Caption = 'Nama Akun'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
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
        Width = 125
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
        Width = 110
      end
      object cxColKeterangan: TcxGridColumn
        Caption = 'Keterangan'
        Width = 388
      end
    end
    object cxGrdLevel1: TcxGridLevel
      GridView = cxtbJurnalUmum
    end
  end
  object zqrAkun: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, noakun, nama, '
      
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
