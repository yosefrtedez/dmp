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
    TabOrder = 7
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
    Width = 177
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 64
    Caption = 'No. SO'
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
  object cxGrid1: TcxGrid
    Left = 8
    Top = 126
    Width = 1032
    Height = 200
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    Visible = False
    object cxTblSO: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      NavigatorButtons.Refresh.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Position = spFooter
        end
        item
          Kind = skSum
          Column = cxColGross
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,###'
          Kind = skSum
          Column = cxColGross
        end
        item
          Format = '#,###'
          Kind = skSum
          Column = cxColDiscAmount
        end
        item
          Format = '#,###'
          Kind = skSum
          Column = cxColTaxAmount
        end
        item
          Format = '#,###'
          Kind = skSum
          Column = cxColNetAmount
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxTblSODataControllerBeforePost
      DataController.OnRecordChanged = cxTblSODataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.ReadOnly = True
        Visible = False
        OnGetDisplayText = cxColNoGetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 42
      end
      object cxColKode: TcxGridColumn
        Caption = 'Kode Brg'
        PropertiesClassName = 'TcxTextEditProperties'
        Options.ShowEditButtons = isebAlways
        Width = 108
      end
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
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
        Width = 193
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.EditFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 72
      end
      object cxColHarga: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.EditFormat = True
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Width = 87
      end
      object cxColGross: TcxGridColumn
        Caption = 'Harga Gross'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taRightJustify
        Width = 98
      end
      object cxColDisc: TcxGridColumn
        Caption = 'Disc(%)'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object cxColDiscAmount: TcxGridColumn
        Caption = 'Disc Amount'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,###'
        Properties.EditFormat = '#,###'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taCenter
        Width = 102
      end
      object cxColTaxable: TcxGridColumn
        Caption = 'DPP'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,###'
        Properties.EditFormat = '#,###'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taCenter
        Width = 112
      end
      object cxColTaxAmount: TcxGridColumn
        Caption = 'PPN'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,###'
        Properties.EditFormat = '#,###'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taCenter
        Width = 101
      end
      object cxColNetAmount: TcxGridColumn
        Caption = 'Net Amount'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,###'
        Properties.EditFormat = '#,###'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taCenter
        Width = 133
      end
      object cxColKeterangan: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 281
      end
      object cxColIdSatuan: TcxGridColumn
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxTblSO
    end
  end
  object cxGrid2: TcxGrid
    Left = 8
    Top = 126
    Width = 1032
    Height = 200
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
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
      DataController.OnRecordChanged = cxtbMTSDataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      object cxColNo2: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.ReadOnly = True
        OnGetDisplayText = cxColNoGetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 42
      end
      object cxColKode2: TcxGridColumn
        Caption = 'Kode Brg'
        PropertiesClassName = 'TcxTextEditProperties'
        Options.ShowEditButtons = isebAlways
        Width = 108
      end
      object cxColDeskripsi2: TcxGridColumn
        Caption = 'Deskripsi'
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
        Width = 193
      end
      object cxColQty2: TcxGridColumn
        Caption = 'Qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,###'
        Properties.EditFormat = '#,###'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
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
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxtbMTS
    end
  end
  object zqrCust: TZReadOnlyQuery
    Tag = 12
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, kode, nama FROM tbl_customer'
      'WHERE f_aktif = 1'
      'ORDER BY nama')
    Params = <>
    Left = 280
    Top = 13
  end
  object dsCust: TDataSource
    DataSet = zqrCust
    Left = 310
    Top = 13
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
    Left = 382
    Top = 13
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'select a.id, a.kode, a.deskripsi, a.id_satuan, b.satuan from '
      'tbl_barang a '
      'left join tbl_satuan b on a.id_satuan = b.id'
      'order by kode;')
    Params = <>
    Left = 430
    Top = 14
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 463
    Top = 15
  end
end
