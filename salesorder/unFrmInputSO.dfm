inherited frmInputSO: TfrmInputSO
  Caption = 'frmInputSO'
  ClientHeight = 646
  ClientWidth = 1048
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1048
  ExplicitHeight = 646
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1048
    ExplicitWidth = 1048
    object Label1: TLabel
      Left = 10
      Top = 16
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
    Top = 597
    Width = 1048
    TabOrder = 23
    ExplicitTop = 597
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
    TabOrder = 4
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
    TabOrder = 6
    Width = 147
  end
  object cxLabel8: TcxLabel
    Left = 8
    Top = 150
    Caption = 'Customer'
  end
  object cxLUCust: TcxLookupComboBox
    Left = 101
    Top = 145
    Properties.DropDownSizeable = True
    Properties.DropDownWidth = 3000
    Properties.KeyFieldNames = 'kode'
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
    TabOrder = 8
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
    Properties.KeyFieldNames = 'kode_sales'
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
    Top = 52
    Width = 270
    Height = 93
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
      Left = 19
      Top = 43
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
  end
  object cxLabel4: TcxLabel
    Left = 687
    Top = 151
    Caption = 'Tgl. Permintaan Kirim'
  end
  object cxdTglRequaired: TcxDateEdit
    Left = 797
    Top = 151
    Properties.ReadOnly = False
    TabOrder = 11
    Width = 160
  end
  object cxLabel11: TcxLabel
    Left = 710
    Top = 414
    Caption = 'Harga Gross'
  end
  object cxsGross: TcxSpinEdit
    Left = 799
    Top = 414
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    Style.HotTrack = True
    TabOrder = 16
    Width = 161
  end
  object cxLabel12: TcxLabel
    Left = 710
    Top = 443
    Caption = 'Disc Amount'
  end
  object cxsDisc: TcxSpinEdit
    Left = 799
    Top = 441
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    Style.HotTrack = True
    TabOrder = 17
    Width = 161
  end
  object cxLabel5: TcxLabel
    Left = 709
    Top = 471
    Caption = 'Tax Amount'
  end
  object cxsTax: TcxSpinEdit
    Left = 799
    Top = 468
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    Style.HotTrack = True
    TabOrder = 19
    Width = 161
  end
  object cxLabel6: TcxLabel
    Left = 710
    Top = 496
    Caption = 'Net Amount'
  end
  object cxsNet: TcxSpinEdit
    Left = 799
    Top = 495
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    Style.HotTrack = True
    TabOrder = 21
    Width = 161
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 208
    Width = 952
    Height = 200
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
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 108
      end
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'kode'
        Properties.ListColumns = <
          item
            FieldName = 'deskripsi'
          end
          item
            FieldName = 'kode'
          end>
        Properties.ListSource = dsBarang
        HeaderAlignmentHorz = taCenter
        Width = 193
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,###'
        Properties.EditFormat = '#,###'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taCenter
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'M'
          'CM'
          'KG'
          'GR'
          'ROLL'
          'PCS'
          'TON')
        HeaderAlignmentHorz = taCenter
        Width = 72
      end
      object cxColHarga: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,###'
        Properties.EditFormat = '#,###'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object cxColGross: TcxGridColumn
        Caption = 'Harga Gross'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,###'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
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
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxTblSO
    end
  end
  object zqrCust: TZReadOnlyQuery
    Tag = 12
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_customer'
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
      'select kode, deskripsi, satuan from tbl_barang order by kode;')
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
