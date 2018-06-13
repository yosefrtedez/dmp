inherited frmInputPO: TfrmInputPO
  Caption = 'frmInputPO'
  ClientHeight = 690
  ClientWidth = 1009
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1009
  ExplicitHeight = 690
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1009
    ExplicitWidth = 1009
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 174
      Height = 19
      Caption = 'Input Purchase Order'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 641
    Width = 1009
    TabOrder = 29
    ExplicitTop = 641
    ExplicitWidth = 1009
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxgrdPP: TcxGrid
    Left = 10
    Top = 337
    Width = 975
    Height = 293
    TabOrder = 28
    object cxtbTblPO: TcxGridTableView
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
          Column = cxColTotal
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxtbTblPODataControllerBeforePost
      DataController.OnRecordChanged = cxtbTblPODataControllerRecordChanged
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        OnGetDisplayText = cxColNoGetDisplayText
        Width = 42
      end
      object cxColKodeBrg: TcxGridColumn
        Caption = 'Kode Brg'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Width = 102
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
        Width = 149
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = False
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Width = 82
      end
      object cxColHarga: TcxGridColumn
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        Width = 88
      end
      object cxColPPn: TcxGridColumn
        Caption = 'PPn'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'NON PPN'
          'PPN')
      end
      object cxColValuta: TcxGridColumn
        Caption = 'Valuta'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'IDR'
          'USD')
        SortIndex = 0
        SortOrder = soAscending
        Width = 61
      end
      object cxColKeterangan: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 200
      end
      object cxColTotal: TcxGridColumn
        Caption = 'Total'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = False
        Width = 112
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbTblPO
    end
  end
  object cxlbl1: TcxLabel
    Left = 10
    Top = 62
    Caption = 'No. Bukti'
  end
  object cxlbl2: TcxLabel
    Left = 10
    Top = 89
    Caption = 'No. PP'
  end
  object cxlbl3: TcxLabel
    Left = 10
    Top = 116
    Caption = 'Tanggal'
  end
  object cxlbl4: TcxLabel
    Left = 10
    Top = 143
    Caption = 'Tgl. Kedatangan'
  end
  object cxlbl5: TcxLabel
    Left = 10
    Top = 170
    Caption = 'Nama Supplier'
  end
  object cxlbl6: TcxLabel
    Left = 10
    Top = 197
    Caption = 'Alamat'
  end
  object cxlbl7: TcxLabel
    Left = 10
    Top = 224
    Caption = 'Nopol'
  end
  object cxlbl8: TcxLabel
    Left = 10
    Top = 251
    Caption = 'Sopir'
  end
  object cxLuNoPP: TcxLookupComboBox
    Left = 112
    Top = 88
    Properties.CharCase = ecUpperCase
    Properties.KeyFieldNames = 'no_bukti'
    Properties.ListColumns = <
      item
        Caption = 'No Bukti'
        Width = 80
        FieldName = 'no_bukti'
      end>
    Properties.ListSource = dsPPHead
    Properties.OnChange = cxLuNoPPPropertiesChange
    TabOrder = 5
    Width = 122
  end
  object cxdTgl: TcxDateEdit
    Left = 112
    Top = 115
    TabOrder = 7
    Width = 146
  end
  object cxdTglDatang: TcxDateEdit
    Left = 112
    Top = 142
    TabOrder = 9
    Width = 146
  end
  object cxLuSupplier: TcxLookupComboBox
    Left = 112
    Top = 169
    Properties.KeyFieldNames = 'kode'
    Properties.ListColumns = <
      item
        FieldName = 'nama'
      end>
    Properties.ListSource = dsSupplier
    Properties.OnChange = cxLuSupplierPropertiesChange
    TabOrder = 11
    Width = 203
  end
  object cxtAlamat: TcxTextEdit
    Left = 112
    Top = 196
    TabOrder = 13
    Width = 351
  end
  object cxtNoBukti: TcxTextEdit
    Left = 112
    Top = 61
    TabOrder = 2
    Width = 113
  end
  object cxtNopol: TcxTextEdit
    Left = 112
    Top = 223
    Properties.CharCase = ecUpperCase
    TabOrder = 16
    Width = 113
  end
  object cxtSopir: TcxTextEdit
    Left = 112
    Top = 250
    Properties.CharCase = ecUpperCase
    TabOrder = 18
    Width = 113
  end
  object cxchk1: TcxCheckBox
    Left = 261
    Top = 60
    Caption = 'Komplit / Selesai'
    TabOrder = 1
    Width = 104
  end
  object cxgrpbx1: TcxGroupBox
    Left = 387
    Top = 62
    Caption = 'User Requesting'
    TabOrder = 4
    Height = 89
    Width = 233
    object cxlbl9: TcxLabel
      Left = 8
      Top = 48
      Caption = 'Divisi'
    end
    object cxlbl10: TcxLabel
      Left = 8
      Top = 24
      Caption = 'Nama User'
    end
    object cxtUser: TcxTextEdit
      Tag = 1
      Left = 72
      Top = 19
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 137
    end
    object cxtDepartemen: TcxTextEdit
      Tag = 1
      Left = 73
      Top = 46
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 137
    end
  end
  object cxlbl11: TcxLabel
    Left = 10
    Top = 278
    Caption = 'Pembayaran'
  end
  object cxCboPembayaran: TcxComboBox
    Left = 111
    Top = 277
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      'Cash On Delivery (COD)'
      'Cash Before Delivery (CBD)'
      '7 Hari'
      '14 Hari'
      '30 Hari'
      '45 Hari')
    TabOrder = 20
    Width = 146
  end
  object cxlbl12: TcxLabel
    Left = 266
    Top = 278
    Caption = 'Valuta'
  end
  object cxCboRate: TcxComboBox
    Left = 309
    Top = 277
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      'IDR'
      'USD')
    Properties.OnChange = cxCbo2PropertiesChange
    TabOrder = 21
    Width = 63
  end
  object cxlbl13: TcxLabel
    Left = 378
    Top = 278
    Caption = 'Rate'
  end
  object cxlbl14: TcxLabel
    Left = 10
    Top = 305
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 111
    Top = 304
    Properties.CharCase = ecUpperCase
    TabOrder = 26
    Width = 416
  end
  object cxtRate: TcxTextEdit
    Left = 411
    Top = 277
    TabOrder = 22
    Width = 113
  end
  object cxlbltemp: TcxLabel
    Left = 478
    Top = 197
    Caption = 'cxlbltemp'
    Visible = False
  end
  object zqrPPHead: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT no_bukti'
      'FROM tbl_pp_head WHERE f_app = 1;')
    Params = <>
    Left = 692
    Top = 82
  end
  object dsPPHead: TDataSource
    DataSet = zqrPPHead
    Left = 769
    Top = 67
  end
  object zqrSupplier: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select * from tbl_supplier order by nama')
    Params = <>
    Left = 731
    Top = 182
  end
  object dsSupplier: TDataSource
    DataSet = zqrSupplier
    Left = 768
    Top = 181
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select * from tbl_barang')
    Params = <>
    Properties.Strings = (
      
        'select kode, deskripsi, satuan from tbl_barang order by deskrips' +
        'i')
    Left = 705
    Top = 243
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 734
    Top = 245
  end
end
