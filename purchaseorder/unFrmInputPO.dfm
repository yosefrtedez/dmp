inherited frmInputPO: TfrmInputPO
  Caption = 'Input Purchase Order'
  ClientHeight = 690
  ClientWidth = 1063
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1063
  ExplicitHeight = 690
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1063
    ExplicitWidth = 1063
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
    Width = 1063
    TabOrder = 25
    ExplicitTop = 641
    ExplicitWidth = 1063
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxgrdPP: TcxGrid
    Left = 10
    Top = 281
    Width = 1045
    Height = 293
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 24
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
        Properties.ReadOnly = True
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
      object cxColIdSatuan: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
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
  object cxlNoPP: TcxLookupComboBox
    Left = 112
    Top = 88
    Properties.CharCase = ecUpperCase
    Properties.DropDownAutoSize = True
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'No Bukti'
        Width = 80
        FieldName = 'no_bukti'
      end
      item
        Caption = 'User'
        FieldName = 'user'
      end
      item
        Caption = 'Dept'
        FieldName = 'user_dept'
      end>
    Properties.ListSource = dsPPHead
    Properties.OnChange = cxLuNoPPPropertiesChange
    TabOrder = 6
    Width = 146
  end
  object cxdTgl: TcxDateEdit
    Left = 112
    Top = 115
    TabOrder = 8
    Width = 146
  end
  object cxdTglDatang: TcxDateEdit
    Left = 112
    Top = 142
    TabOrder = 10
    Width = 146
  end
  object cxlSupplier: TcxLookupComboBox
    Left = 112
    Top = 169
    Properties.DropDownAutoSize = True
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Nama Supplier'
        FieldName = 'nama'
      end
      item
        Caption = 'Kode Supplier'
        FieldName = 'kode'
      end>
    Properties.ListSource = dsSupplier
    Properties.OnChange = cxLuSupplierPropertiesChange
    TabOrder = 12
    Width = 351
  end
  object cxtAlamat: TcxTextEdit
    Left = 112
    Top = 196
    TabOrder = 14
    Width = 351
  end
  object cxtNoBukti: TcxTextEdit
    Left = 112
    Top = 61
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 146
  end
  object cxchk1: TcxCheckBox
    Left = 266
    Top = 61
    Caption = 'Komplit / Selesai'
    Properties.ReadOnly = True
    TabOrder = 2
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
    Top = 224
    Caption = 'Pembayaran'
  end
  object cxCboPembayaran: TcxComboBox
    Left = 112
    Top = 223
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      'Cash On Delivery (COD)'
      'Cash Before Delivery (CBD)'
      '7 Hari'
      '14 Hari'
      '30 Hari'
      '45 Hari')
    TabOrder = 16
    Width = 198
  end
  object cxlbl12: TcxLabel
    Left = 318
    Top = 224
    Caption = 'Valuta'
  end
  object cxCboRate: TcxComboBox
    Left = 358
    Top = 223
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      'IDR'
      'USD')
    Properties.OnChange = cxCbo2PropertiesChange
    TabOrder = 17
    Width = 63
  end
  object cxlbl13: TcxLabel
    Left = 427
    Top = 224
    Caption = 'Rate'
  end
  object cxlbl14: TcxLabel
    Left = 10
    Top = 251
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 112
    Top = 250
    Properties.CharCase = ecUpperCase
    TabOrder = 22
    Width = 416
  end
  object cxtRate: TcxTextEdit
    Left = 460
    Top = 223
    TabOrder = 18
    Width = 113
  end
  object cxChkApproval: TcxCheckBox
    Left = 266
    Top = 81
    Caption = 'Approval'
    Properties.ReadOnly = True
    TabOrder = 5
    Width = 104
  end
  object zqrPPHead: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT id, no_bukti, user, user_dept'
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
      'select id, kode, nama '
      'from tbl_supplier order by nama')
    Params = <>
    Left = 707
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
      'select id, kode, deskripsi from tbl_barang')
    Params = <>
    Properties.Strings = (
      
        'select kode, deskripsi, satuan from tbl_barang order by deskrips' +
        'i')
    Left = 705
    Top = 243
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 782
    Top = 245
  end
end
