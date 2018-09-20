inherited frmInputSO: TfrmInputSO
  Caption = 'Input Sales Order'
  ClientHeight = 726
  ClientWidth = 1055
  OnShow = FormShow
  ExplicitTop = -28
  ExplicitWidth = 1055
  ExplicitHeight = 726
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1055
    ExplicitWidth = 1055
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
    Width = 1055
    TabOrder = 22
    ExplicitTop = 677
    ExplicitWidth = 1055
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
  object cxtPO: TcxTextEdit
    Left = 101
    Top = 91
    TabOrder = 5
    Width = 177
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 92
    Caption = 'No. PO Customer'
  end
  object cxlbl2: TcxLabel
    Left = 8
    Top = 119
    Caption = 'Tanggal'
  end
  object cxdTanggal: TcxDateEdit
    Left = 101
    Top = 118
    TabOrder = 7
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
    TabOrder = 9
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
        Caption = 'Sales'
        Width = 100
        FieldName = 'nama'
      end>
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = dsSales
    TabOrder = 11
    Width = 299
  end
  object GroupBox1: TGroupBox
    Left = 690
    Top = 64
    Width = 279
    Height = 129
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
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
      Left = 201
      Top = 55
      Caption = 'Tax'
      Visible = False
    end
    object cxCmbTax: TcxComboBox
      Left = 264
      Top = 54
      Properties.Items.Strings = (
        'INCLUDE'
        'EXCLUDE')
      TabOrder = 5
      Text = 'INCLUDE'
      Visible = False
      OnEditing = cxCmbTaxEditing
      Width = 89
    end
    object cxLabel3: TcxLabel
      Left = 17
      Top = 39
      Caption = 'TOP'
    end
    object cxCmbTOP: TcxComboBox
      Left = 80
      Top = 38
      Properties.Items.Strings = (
        '0D'
        '7D'
        '14D'
        '21D'
        '30D')
      TabOrder = 3
      Text = '0D'
      Width = 89
    end
    object cxLabel4: TcxLabel
      Left = 15
      Top = 67
      Caption = 'Tgl. Permintaan Kirim'
    end
    object cxdTglRequired: TcxDateEdit
      Left = 128
      Top = 65
      Properties.ReadOnly = False
      TabOrder = 7
      Width = 121
    end
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 205
    Width = 1039
    Height = 200
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 13
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
      DataController.OnAfterDelete = cxTblSODataControllerAfterDelete
      DataController.OnBeforePost = cxTblSODataControllerBeforePost
      DataController.OnRecordChanged = cxTblSODataControllerRecordChanged
      OptionsBehavior.FocusCellOnTab = True
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
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Deskripsi'
            FieldName = 'deskripsi'
          end
          item
            Caption = 'Kode'
            FieldName = 'kode'
          end>
        Properties.ListSource = dsBarang
        Width = 193
      end
      object cxColJmlIkat: TcxGridColumn
        Caption = 'Jml. Ikat / Bal'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.ReadOnly = True
        Width = 85
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
      object cxColHargaIkat: TcxGridColumn
        Caption = 'Harga / Ikat'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Width = 74
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
        Visible = False
        HeaderAlignmentHorz = taRightJustify
        Width = 98
      end
      object cxColDisc: TcxGridColumn
        Caption = 'Disc(%)'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Visible = False
        HeaderAlignmentHorz = taRightJustify
      end
      object cxColDiscAmount: TcxGridColumn
        Caption = 'Disc Amount'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,###'
        Properties.EditFormat = '#,###'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        Visible = False
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
        Visible = False
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
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 101
      end
      object cxColNetAmount: TcxGridColumn
        Caption = 'Total'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.EditFormat = True
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
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
      object cxColIdBrg: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
      object cxColKode2: TcxGridColumn
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
    TabOrder = 3
    OnClick = cxChkMTSClick
    Width = 121
  end
  object cxsTax: TcxSpinEdit
    Left = 770
    Top = 418
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    Style.HotTrack = True
    TabOrder = 14
    Visible = False
    Width = 161
  end
  object cxsNet: TcxSpinEdit
    Left = 770
    Top = 499
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    Style.HotTrack = True
    TabOrder = 20
    Visible = False
    Width = 161
  end
  object cxLabel6: TcxLabel
    Left = 664
    Top = 500
    Caption = 'Net Amount'
    Visible = False
  end
  object cxLabel5: TcxLabel
    Left = 663
    Top = 473
    Caption = 'Tax Amount'
    Visible = False
  end
  object cxsDisc: TcxSpinEdit
    Left = 770
    Top = 445
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    Style.HotTrack = True
    TabOrder = 16
    Visible = False
    Width = 161
  end
  object cxLabel12: TcxLabel
    Left = 662
    Top = 446
    Caption = 'Disc Amount'
    Visible = False
  end
  object cxsGross: TcxSpinEdit
    Left = 770
    Top = 472
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    Style.HotTrack = True
    TabOrder = 18
    Visible = False
    Width = 161
  end
  object cxLabel11: TcxLabel
    Left = 662
    Top = 419
    Caption = 'Harga Gross'
    Visible = False
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
    Left = 487
    Top = 15
  end
end
