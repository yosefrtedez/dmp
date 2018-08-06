inherited frmInputSuratJalan: TfrmInputSuratJalan
  Caption = 'Input Barang Masuk'
  ClientHeight = 687
  ClientWidth = 1119
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1119
  ExplicitHeight = 687
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1119
    ExplicitWidth = 1119
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 141
      Height = 19
      Caption = 'Input Surat Jalan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 638
    Width = 1119
    TabOrder = 28
    ExplicitTop = 638
    ExplicitWidth = 1119
    inherited btnSimpan: TButton
      Top = 11
      OnClick = btnSimpanClick
      ExplicitTop = 11
    end
  end
  object cxlbl1: TcxLabel
    Left = 11
    Top = 62
    Caption = 'No. Bukti'
  end
  object cxlbl4: TcxLabel
    Left = 11
    Top = 89
    Caption = 'Tgl. Transaksi'
  end
  object cxdTglDatang: TcxDateEdit
    Left = 112
    Top = 88
    TabOrder = 5
    Width = 146
  end
  object cxtNoBukti: TcxTextEdit
    Left = 112
    Top = 61
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 146
  end
  object cxlbl14: TcxLabel
    Left = 11
    Top = 198
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 112
    Top = 196
    Properties.CharCase = ecUpperCase
    TabOrder = 13
    Width = 416
  end
  object cxgrdPP: TcxGrid
    Left = 8
    Top = 253
    Width = 1103
    Height = 211
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 17
    object cxtbSJ: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,##.00'
          Kind = skSum
          Column = cxColQty
        end
        item
          Format = '#,##.00'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxtbSJDataControllerBeforePost
      DataController.OnRecordChanged = cxtbSJDataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Visible = False
        OnGetDisplayText = cxColNoGetDisplayText
        Width = 32
      end
      object cxColKodeBrg: TcxGridColumn
        Caption = 'Kode Brg'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 66
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
        Width = 237
      end
      object cxColJmlIkatPerBal: TcxGridColumn
        Caption = 'Jml. Ikat / Bal'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.ReadOnly = True
        Width = 85
      end
      object cxColHargaIkat: TcxGridColumn
        Caption = 'Harga / Ikat'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Width = 67
      end
      object cxColNoSO: TcxGridColumn
        Caption = 'No. SO'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxColNoSOPropertiesButtonClick
        Width = 92
      end
      object cxColQtySO: TcxGridColumn
        Caption = 'Qty. SO'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        Width = 62
      end
      object cxColQtyTerkirim: TcxGridColumn
        Caption = 'Qty. Terkirim'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Width = 73
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty.'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = False
        Properties.ValueType = vtFloat
        Width = 73
      end
      object cxColHarga: TcxGridColumn
        Caption = 'Harga Jual'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        Width = 74
      end
      object cxColGudang: TcxGridColumn
        Caption = 'Gudang'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Kode'
            FieldName = 'kode'
          end
          item
            Caption = 'ID'
            FieldName = 'id'
          end
          item
            Caption = 'Nama'
            FieldName = 'nama'
          end>
        Properties.ListSource = dsGudang
        Width = 69
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 63
      end
      object cxColKeterangan: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 109
      end
      object cxColTotal: TcxGridColumn
        Caption = 'Subtotal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        Width = 93
      end
      object cxColIdSatuan: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
      object cxColIdSO: TcxGridColumn
        Visible = False
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbSJ
    end
  end
  object cxLabel1: TcxLabel
    Left = 11
    Top = 116
    Caption = 'Customer'
  end
  object cxlCustomer: TcxLookupComboBox
    Left = 112
    Top = 115
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Nama'
        FieldName = 'nama'
      end>
    Properties.ListSource = dsCust
    TabOrder = 7
    Width = 416
  end
  object cxLabel2: TcxLabel
    Left = 11
    Top = 143
    Caption = 'Nopol'
  end
  object cxtNopol: TcxTextEdit
    Left = 112
    Top = 142
    Properties.ReadOnly = False
    TabOrder = 9
    Width = 146
  end
  object cxtSopir: TcxTextEdit
    Left = 112
    Top = 169
    Properties.ReadOnly = False
    TabOrder = 11
    Width = 146
  end
  object cxLabel3: TcxLabel
    Left = 11
    Top = 170
    Caption = 'Sopir'
  end
  object cxLabel4: TcxLabel
    Left = 888
    Top = 471
    Caption = 'Diskon (%)'
  end
  object cxsDiskon: TcxSpinEdit
    Left = 976
    Top = 470
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    Properties.OnChange = cxsDiskonPropertiesChange
    TabOrder = 18
    Width = 121
  end
  object DPP: TcxLabel
    Left = 888
    Top = 498
    Caption = 'Setelah Diskon'
  end
  object cxsStlhDiskon: TcxSpinEdit
    Left = 976
    Top = 497
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 20
    Width = 121
  end
  object cxsPPN: TcxSpinEdit
    Left = 976
    Top = 551
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 25
    Width = 121
  end
  object cxChkPPN: TcxCheckBox
    Left = 888
    Top = 551
    Caption = 'PPN (10%)'
    TabOrder = 24
    Width = 82
  end
  object cxLabel5: TcxLabel
    Left = 888
    Top = 525
    Caption = 'DPP'
  end
  object cxsDPP: TcxSpinEdit
    Left = 976
    Top = 524
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 22
    Width = 121
  end
  object cxLabel6: TcxLabel
    Left = 888
    Top = 579
    Caption = 'Harga Total'
  end
  object cxsHargaTotal: TcxSpinEdit
    Left = 976
    Top = 578
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 26
    Width = 121
  end
  object cxLabel7: TcxLabel
    Left = 264
    Top = 62
    Caption = 'No. Faktur'
  end
  object cxtNoFaktur: TcxTextEdit
    Left = 328
    Top = 61
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 146
  end
  object cxLabel8: TcxLabel
    Left = 11
    Top = 224
    Caption = 'Tgl. Jatuh Tempo'
  end
  object cxdTglJthTempo: TcxDateEdit
    Left = 112
    Top = 223
    TabOrder = 15
    Width = 146
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select id, kode, deskripsi '
      'from tbl_barang'
      'where f_dijual = 1')
    Params = <>
    Properties.Strings = (
      
        'select kode, deskripsi, satuan from tbl_barang order by deskrips' +
        'i')
    Left = 581
    Top = 56
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 633
    Top = 56
  end
  object zqrGudang: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select * from tbl_gudang order by id')
    Params = <>
    Properties.Strings = (
      
        'select kode, deskripsi, satuan from tbl_barang order by deskrips' +
        'i')
    Left = 717
    Top = 63
  end
  object dsGudang: TDataSource
    DataSet = zqrGudang
    Left = 784
    Top = 63
  end
  object zqrCust: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select id, kode, nama '
      'from tbl_customer order by nama')
    Params = <>
    Left = 660
    Top = 125
  end
  object dsCust: TDataSource
    DataSet = zqrCust
    Left = 720
    Top = 125
  end
  object zqrSO: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    Active = True
    SQL.Strings = (
      'SELECT a.id, a.no_bukti '
      'FROM tbl_so_head a'
      'LEFT JOIN tbl_so_det b ON a.id = b.id_ref '
      'WHERE a.id_cust = :id_cust AND b.id_brg = :id_brg')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_brg'
        ParamType = ptUnknown
      end>
    Left = 852
    Top = 125
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_brg'
        ParamType = ptUnknown
      end>
  end
  object dsSO: TDataSource
    DataSet = zqrSO
    Left = 912
    Top = 125
  end
end
