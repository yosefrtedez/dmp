inherited frmInputSO: TfrmInputSO
  Caption = 'Input Sales Order'
  ClientHeight = 726
  ClientWidth = 1048
  OnCreate = FormCreate
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
      Width = 143
      Height = 19
      Caption = 'Input Sales Order'
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
    TabOrder = 16
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
    TabOrder = 3
    Width = 177
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 64
    Caption = 'No. SO'
  end
  object cxtPO: TcxTextEdit
    Left = 101
    Top = 91
    TabOrder = 6
    Width = 177
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 92
    Caption = 'No. PO Customer'
  end
  object cxlbl2: TcxLabel
    Left = 10
    Top = 119
    Caption = 'Tanggal'
  end
  object cxdTanggal: TcxDateEdit
    Left = 101
    Top = 118
    TabOrder = 8
    Width = 147
  end
  object cxLabel8: TcxLabel
    Left = 8
    Top = 150
    Caption = 'Customer'
  end
  object cxlCust: TcxLookupComboBox
    Left = 101
    Top = 145
    Properties.DropDownSizeable = True
    Properties.DropDownWidth = 3000
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Nama Customer'
        Width = 500
        FieldName = 'nama'
      end
      item
        Caption = 'Kode'
        FieldName = 'kode'
      end
      item
        Caption = 'Alamat'
        Width = 300
        FieldName = 'alamat'
      end>
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = dsCust
    TabOrder = 10
    Width = 472
  end
  object cxLabel10: TcxLabel
    Left = 8
    Top = 173
    Caption = 'Sales'
  end
  object cxlSales: TcxLookupComboBox
    Left = 101
    Top = 172
    Properties.DropDownSizeable = True
    Properties.DropDownWidth = 500
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Width = 100
        FieldName = 'nama'
      end
      item
        Width = 60
        FieldName = 'kode_sales'
      end>
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = dsSales
    TabOrder = 12
    Width = 299
  end
  object GroupBox1: TGroupBox
    Left = 690
    Top = 55
    Width = 279
    Height = 126
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object cxLabel13: TcxLabel
      Left = 17
      Top = 12
      Caption = 'Currency'
    end
    object cxCmbCurr: TcxComboBox
      Left = 80
      Top = 11
      Properties.Items.Strings = (
        'IDR'
        'USD')
      Properties.OnEditValueChanged = cxCmbCurrPropertiesEditValueChanged
      TabOrder = 0
      Text = 'IDR'
      Width = 49
    end
    object cxsKurs: TcxSpinEdit
      Left = 128
      Top = 11
      Properties.DisplayFormat = '#,###'
      Properties.ValueType = vtFloat
      TabOrder = 1
      Width = 121
    end
    object cxLabel9: TcxLabel
      Left = 17
      Top = 39
      Caption = 'Tax'
    end
    object cxCmbTax: TcxComboBox
      Left = 80
      Top = 38
      Properties.Items.Strings = (
        'INCLUDE'
        'EXCLUDE')
      TabOrder = 3
      Text = 'INCLUDE'
      OnEditing = cxCmbTaxEditing
      Width = 89
    end
    object cxLabel3: TcxLabel
      Left = 17
      Top = 66
      Caption = 'TOP'
    end
    object cxCmbTOP: TcxComboBox
      Left = 80
      Top = 65
      Properties.Items.Strings = (
        '0D'
        '7D'
        '14D'
        '21D'
        '30D')
      TabOrder = 5
      Text = '0D'
      Width = 89
    end
    object cxLabel4: TcxLabel
      Left = 15
      Top = 94
      Caption = 'Tgl. Permintaan Kirim'
    end
    object cxdTglRequaired: TcxDateEdit
      Left = 128
      Top = 92
      Properties.ReadOnly = False
      TabOrder = 7
      Width = 121
    end
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 208
    Width = 1032
    Height = 200
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 14
    object cxTblSO: TcxGridTableView
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
      DataController.OnAfterDelete = cxTblSODataControllerAfterDelete
      DataController.OnBeforePost = cxTblSODataControllerBeforePost
      DataController.OnRecordChanged = cxTblSODataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.ReadOnly = True
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
        Properties.DisplayFormat = '#,###'
        Properties.EditFormat = '#,###'
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
  object cxChkMTS: TcxCheckBox
    Left = 284
    Top = 64
    Caption = 'Made To Stok'
    TabOrder = 4
    OnClick = cxChkMTSClick
    Width = 121
  end
  object cxGrid2: TcxGrid
    Left = 453
    Top = 90
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
  object Panel3: TPanel
    Left = 624
    Top = 414
    Width = 393
    Height = 209
    BevelOuter = bvNone
    TabOrder = 15
    object cxLabel11: TcxLabel
      Left = 20
      Top = 18
      Caption = 'Harga Gross'
    end
    object cxsGross: TcxSpinEdit
      Left = 128
      Top = 71
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,#0.00'
      Properties.ReadOnly = True
      Properties.ValueType = vtFloat
      Style.HotTrack = True
      TabOrder = 4
      Width = 161
    end
    object cxLabel12: TcxLabel
      Left = 20
      Top = 45
      Caption = 'Disc Amount'
    end
    object cxsDisc: TcxSpinEdit
      Left = 128
      Top = 44
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,#0.00'
      Properties.ReadOnly = True
      Properties.ValueType = vtFloat
      Style.HotTrack = True
      TabOrder = 2
      Width = 161
    end
    object cxLabel5: TcxLabel
      Left = 21
      Top = 72
      Caption = 'Tax Amount'
    end
    object cxsTax: TcxSpinEdit
      Left = 128
      Top = 17
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,#0.00'
      Properties.ReadOnly = True
      Properties.ValueType = vtFloat
      Style.HotTrack = True
      TabOrder = 0
      Width = 161
    end
    object cxLabel6: TcxLabel
      Left = 22
      Top = 99
      Caption = 'Net Amount'
    end
    object cxsNet: TcxSpinEdit
      Left = 128
      Top = 98
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '#,#0.00'
      Properties.ReadOnly = True
      Properties.ValueType = vtFloat
      Style.HotTrack = True
      TabOrder = 6
      Width = 161
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
