inherited frmInputPB: TfrmInputPB
  Caption = 'Input Penerimaan Barang'
  ClientHeight = 739
  ClientWidth = 1172
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitTop = -58
  ExplicitWidth = 1172
  ExplicitHeight = 739
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1172
    ExplicitWidth = 1172
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 210
      Height = 19
      Caption = 'Input Penerimaan Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 690
    Width = 1172
    TabOrder = 28
    ExplicitTop = 690
    ExplicitWidth = 1172
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
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
    Caption = 'No. PO'
  end
  object cxlbl3: TcxLabel
    Left = 10
    Top = 116
    Caption = 'Tanggal PO'
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
    Left = 234
    Top = 224
    Caption = 'Sopir'
  end
  object cxlNoPO: TcxLookupComboBox
    Left = 112
    Top = 88
    Properties.CharCase = ecUpperCase
    Properties.DropDownAutoSize = True
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'No PO'
        Width = 80
        FieldName = 'no_bukti'
      end
      item
        Caption = 'Tanggal'
        FieldName = 'tanggal'
      end
      item
        Caption = 'Nama Supplier'
        FieldName = 'nama_supplier'
      end>
    Properties.ListSource = dsPO
    Properties.OnChange = cxlNoPPPropertiesChange
    TabOrder = 5
    Width = 146
  end
  object cxdTglPO: TcxDateEdit
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
    Width = 146
  end
  object cxtNopol: TcxTextEdit
    Left = 112
    Top = 223
    Properties.CharCase = ecUpperCase
    TabOrder = 15
    Width = 113
  end
  object cxtSopir: TcxTextEdit
    Left = 268
    Top = 223
    Properties.CharCase = ecUpperCase
    TabOrder = 16
    Width = 198
  end
  object cxgrpbx1: TcxGroupBox
    Left = 653
    Top = 55
    Caption = 'User Requesting'
    TabOrder = 1
    Visible = False
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
    Top = 251
    Caption = 'Pembayaran'
  end
  object cxCboPembayaran: TcxComboBox
    Left = 112
    Top = 250
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      'Cash On Delivery (COD)'
      'Cash Before Delivery (CBD)'
      '7 Hari'
      '14 Hari'
      '30 Hari'
      '45 Hari')
    TabOrder = 19
    Width = 198
  end
  object cxlbl12: TcxLabel
    Left = 317
    Top = 251
    Caption = 'Valuta'
  end
  object cxCboRate: TcxComboBox
    Left = 361
    Top = 250
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      'IDR'
      'USD')
    TabOrder = 20
    Width = 63
  end
  object cxlbl13: TcxLabel
    Left = 430
    Top = 251
    Caption = 'Rate'
  end
  object cxlbl14: TcxLabel
    Left = 10
    Top = 278
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 112
    Top = 277
    Properties.CharCase = ecUpperCase
    TabOrder = 25
    Width = 464
  end
  object cxtRate: TcxTextEdit
    Left = 463
    Top = 250
    TabOrder = 21
    Width = 113
  end
  object cxgrdPP: TcxGrid
    Left = 10
    Top = 308
    Width = 1150
    Height = 293
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 27
    object cxtbPB: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = False
      NavigatorButtons.Refresh.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,##.00'
          Kind = skSum
          Column = cxColQtyPO
        end
        item
          Format = '#,##.00'
          Kind = skSum
          Column = cxColTotal
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxtbPBDataControllerBeforePost
      DataController.OnRecordChanged = cxtbPBDataControllerRecordChanged
      OptionsData.Inserting = False
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
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
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 237
      end
      object cxColQtyPO: TcxGridColumn
        Caption = 'Qty. PO'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = True
      end
      object cxColQtyTerima: TcxGridColumn
        Caption = 'Qty. Terima'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 66
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
        Properties.ReadOnly = True
        Width = 88
      end
      object cxColGdg: TcxGridColumn
        Caption = 'Gudang'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Gudang'
            FieldName = 'nama'
          end>
        Properties.ListSource = dsGdg
        Width = 106
      end
      object cxColPPn: TcxGridColumn
        Caption = 'PPN'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'NON PPN'
          'PPN')
        Properties.ReadOnly = True
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
      object cxColIdBrg: TcxGridColumn
        Visible = False
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbPB
    end
  end
  object cxtNamaSupp: TcxTextEdit
    Left = 112
    Top = 169
    Properties.ReadOnly = True
    TabOrder = 11
    Width = 433
  end
  object cxChkPosting: TcxCheckBox
    Left = 264
    Top = 61
    Caption = 'Posting'
    State = cbsChecked
    TabOrder = 3
    Visible = False
    Width = 121
  end
  object zqrPO: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.id, a.no_bukti, a.tanggal, b.nama nama_supplier'
      'FROM tbl_po_head a'
      'LEFT JOIN tbl_supplier b ON b.id = a.id_supplier'
      'WHERE f_completed = 0'
      'ORDER BY tanggal')
    Params = <>
    Left = 776
    Top = 248
  end
  object dsPO: TDataSource
    DataSet = zqrPO
    Left = 832
    Top = 248
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
    Left = 777
    Top = 195
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 838
    Top = 197
  end
  object zqrGdg: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT * FROM tbl_gudang')
    Params = <>
    Left = 920
    Top = 224
  end
  object dsGdg: TDataSource
    DataSet = zqrGdg
    Left = 976
    Top = 224
  end
end
