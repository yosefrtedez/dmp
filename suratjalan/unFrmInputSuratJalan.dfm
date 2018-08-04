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
    ExplicitWidth = 973
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
    TabOrder = 24
    ExplicitTop = 570
    ExplicitWidth = 973
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
    TabOrder = 3
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
    Top = 197
    Properties.CharCase = ecUpperCase
    TabOrder = 11
    Width = 416
  end
  object cxgrdPP: TcxGrid
    Left = 8
    Top = 230
    Width = 1103
    Height = 211
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 13
    ExplicitWidth = 957
    object cxtbKoreksi: TcxGridTableView
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
      DataController.OnBeforePost = cxtbKoreksiDataControllerBeforePost
      DataController.OnRecordChanged = cxtbKoreksiDataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        OnGetDisplayText = cxColNoGetDisplayText
        Width = 32
      end
      object cxColKodeBrg: TcxGridColumn
        Caption = 'Kode Brg'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 95
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
      object cxColNoSO: TcxGridColumn
        Caption = 'No. SO'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ListColumns = <>
        Width = 92
      end
      object cxColQtySO: TcxGridColumn
        Caption = 'Qty. SO'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        Width = 68
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
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
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
        Width = 80
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 82
      end
      object cxColKeterangan: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 109
      end
      object cxtbKoreksiColumn1: TcxGridColumn
        Caption = 'Subtotal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
      end
      object cxColIdSatuan: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbKoreksi
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
    TabOrder = 5
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
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 146
  end
  object cxtSopir: TcxTextEdit
    Left = 112
    Top = 169
    Properties.ReadOnly = True
    TabOrder = 9
    Width = 146
  end
  object cxLabel3: TcxLabel
    Left = 11
    Top = 170
    Caption = 'Sopir'
  end
  object cxLabel4: TcxLabel
    Left = 888
    Top = 448
    Caption = 'Diskon (%)'
  end
  object cxsDiskon: TcxSpinEdit
    Left = 976
    Top = 447
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 14
    Width = 121
  end
  object DPP: TcxLabel
    Left = 888
    Top = 475
    Caption = 'Setelah Diskon'
  end
  object cxsStlhDiskon: TcxSpinEdit
    Left = 976
    Top = 474
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 16
    Width = 121
  end
  object cxsPPN: TcxSpinEdit
    Left = 976
    Top = 528
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 21
    Width = 121
  end
  object cxCheckBox1: TcxCheckBox
    Left = 888
    Top = 528
    Caption = 'PPN (10%)'
    TabOrder = 20
    Width = 82
  end
  object cxLabel5: TcxLabel
    Left = 888
    Top = 502
    Caption = 'DPP'
  end
  object cxsDPP: TcxSpinEdit
    Left = 976
    Top = 501
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 18
    Width = 121
  end
  object cxLabel6: TcxLabel
    Left = 888
    Top = 556
    Caption = 'Harga Total'
  end
  object cxsHargaTotal: TcxSpinEdit
    Left = 976
    Top = 555
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 22
    Width = 121
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select id, kode, deskripsi '
      'from tbl_barang')
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
end
