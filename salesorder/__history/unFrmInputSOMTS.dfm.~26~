inherited frmInputSOMTS: TfrmInputSOMTS
  Caption = 'Input Sales Order - MTS'
  ClientHeight = 726
  ClientWidth = 1048
  OnShow = FormShow
  ExplicitWidth = 1048
  ExplicitHeight = 726
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1048
    ExplicitWidth = 1048
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 195
      Height = 19
      Caption = 'Input Sales Order - MTS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 677
    Width = 1048
    TabOrder = 8
    ExplicitTop = 677
    ExplicitWidth = 1048
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxtNoSO: TcxTextEdit
    Left = 101
    Top = 64
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 147
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 64
    Caption = 'No. SO MTS'
  end
  object cxlbl2: TcxLabel
    Left = 10
    Top = 92
    Caption = 'Tanggal'
  end
  object cxdTanggal: TcxDateEdit
    Left = 101
    Top = 91
    TabOrder = 3
    Width = 147
  end
  object cxGrid2: TcxGrid
    Left = 10
    Top = 149
    Width = 1032
    Height = 200
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
    object cxtbMTS: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Position = spFooter
        end
        item
          Kind = skSum
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,###'
          Kind = skSum
        end
        item
          Format = '#,###'
          Kind = skSum
        end
        item
          Format = '#,###'
          Kind = skSum
        end
        item
          Format = '#,###'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxtbMTSDataControllerBeforePost
      DataController.OnRecordChanged = cxtbMTSDataControllerRecordChanged
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      object cxColNo2: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.ReadOnly = True
        Visible = False
        OnGetDisplayText = cxColNoGetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 42
      end
      object cxColKode2: TcxGridColumn
        Caption = 'Kode Brg'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Kode'
            FieldName = 'kode'
          end
          item
            Caption = 'Deskripsi'
            FieldName = 'deskripsi'
          end>
        Properties.ListSource = dsBarang
        Options.ShowEditButtons = isebAlways
        Width = 108
      end
      object cxColDeskripsi2: TcxGridColumn
        Caption = 'Deskripsi'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'deskripsi'
          end
          item
            FieldName = 'kode'
          end>
        Properties.ListSource = dsBarang
        Width = 300
      end
      object cxColQty2: TcxGridColumn
        Caption = 'Qty'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.EditFormat = True
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Width = 92
      end
      object cxColSatuan2: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 72
      end
      object cxColKeterangan2: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 281
      end
      object cxColIdSatuan2: TcxGridColumn
        Visible = False
      end
      object cxColKodeBrg2: TcxGridColumn
        Visible = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxtbMTS
    end
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 119
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 101
    Top = 118
    TabOrder = 5
    Width = 444
  end
  object zqrSales: TZReadOnlyQuery
    Tag = 12
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_sales')
    Params = <>
    Properties.Strings = (
      'SELECT * FROM tbl_sales')
    Left = 352
    Top = 13
  end
  object dsSales: TDataSource
    DataSet = zqrSales
    Left = 406
    Top = 21
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'select a.id, a.kode, a.deskripsi, a.id_satuan, b.satuan from '
      'tbl_barang a '
      'left join tbl_satuan b on a.id_satuan = b.id'
      'order by kode;')
    Params = <>
    Left = 478
    Top = 22
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 543
    Top = 23
  end
end
