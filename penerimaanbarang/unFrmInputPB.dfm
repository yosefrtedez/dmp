inherited frmInputPB: TfrmInputPB
  Caption = 'Input Penerimaan Barang'
  ClientHeight = 739
  ClientWidth = 1172
  OnCreate = FormCreate
  OnShow = FormShow
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
    TabOrder = 29
    ExplicitTop = 690
    ExplicitWidth = 1172
    inherited btnSimpan: TButton
      Left = 11
      OnClick = btnSimpanClick
      ExplicitLeft = 11
    end
  end
  object cxlbl1: TcxLabel
    Left = 10
    Top = 62
    Caption = 'No. Bukti'
  end
  object cxlbl2: TcxLabel
    Left = 10
    Top = 143
    Caption = 'No. PO'
  end
  object cxlbl3: TcxLabel
    Left = 10
    Top = 170
    Caption = 'Tanggal PO'
  end
  object cxlbl4: TcxLabel
    Left = 10
    Top = 197
    Caption = 'Tgl. Kedatangan'
  end
  object cxlbl5: TcxLabel
    Left = 10
    Top = 89
    Caption = 'Nama Supplier'
  end
  object cxlbl6: TcxLabel
    Left = 10
    Top = 116
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
    Top = 142
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
    TabOrder = 10
    Width = 146
  end
  object cxdTglPO: TcxDateEdit
    Left = 112
    Top = 169
    TabOrder = 12
    Width = 146
  end
  object cxdTglDatang: TcxDateEdit
    Left = 112
    Top = 196
    TabOrder = 20
    Width = 146
  end
  object cxtAlamat: TcxTextEdit
    Left = 112
    Top = 115
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 396
  end
  object cxtNoBukti: TcxTextEdit
    Left = 112
    Top = 61
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 146
  end
  object cxtNopol: TcxTextEdit
    Left = 112
    Top = 223
    Properties.CharCase = ecUpperCase
    TabOrder = 22
    Width = 113
  end
  object cxtSopir: TcxTextEdit
    Left = 268
    Top = 223
    Properties.CharCase = ecUpperCase
    TabOrder = 23
    Width = 198
  end
  object cxgrpbx1: TcxGroupBox
    Left = 538
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
      TabStop = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 137
    end
    object cxtDepartemen: TcxTextEdit
      Tag = 1
      Left = 72
      Top = 46
      TabStop = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 137
    end
  end
  object cxlbl11: TcxLabel
    Left = 378
    Top = 170
    Caption = 'Pembayaran'
    Visible = False
  end
  object cxCboPembayaran: TcxComboBox
    Left = 480
    Top = 169
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      'Cash On Delivery (COD)'
      'Cash Before Delivery (CBD)'
      '7 Hari'
      '14 Hari'
      '30 Hari'
      '45 Hari')
    TabOrder = 13
    Visible = False
    Width = 198
  end
  object cxlbl12: TcxLabel
    Left = 685
    Top = 170
    Caption = 'Valuta'
    Visible = False
  end
  object cxCboRate: TcxComboBox
    Left = 729
    Top = 169
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      'IDR'
      'USD')
    TabOrder = 14
    Visible = False
    Width = 63
  end
  object cxlbl13: TcxLabel
    Left = 798
    Top = 170
    Caption = 'Rate'
    Visible = False
  end
  object cxlbl14: TcxLabel
    Left = 10
    Top = 252
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 112
    Top = 251
    Properties.CharCase = ecUpperCase
    TabOrder = 26
    Width = 464
  end
  object cxtRate: TcxTextEdit
    Left = 831
    Top = 169
    TabOrder = 15
    Visible = False
    Width = 113
  end
  object cxgrdPP: TcxGrid
    Left = 10
    Top = 281
    Width = 1150
    Height = 293
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 28
    object cxtbPB: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = False
      NavigatorButtons.Delete.Visible = True
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
      OptionsView.GroupByBox = False
      object cxColNo: TcxGridColumn
        Caption = 'No'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Visible = False
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
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = True
      end
      object cxColQtyTerima: TcxGridColumn
        Caption = 'Qty. Datang'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = False
        Width = 71
      end
      object cxColQtyDatang: TcxGridColumn
        Caption = 'Qty Terima'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Options.Editing = False
        Width = 73
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
        Visible = False
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
        Visible = False
      end
      object cxColValuta: TcxGridColumn
        Caption = 'Valuta'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'IDR'
          'USD')
        Visible = False
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
        Visible = False
        Options.Editing = False
        Width = 112
      end
      object cxColIdSatuan: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
      object cxColIdBrg: TcxGridColumn
        Visible = False
      end
      object cxColIdGdg: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxSpinEditProperties'
        Visible = False
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbPB
    end
  end
  object cxChkPosting: TcxCheckBox
    Left = 1048
    Top = 139
    Caption = 'Posting'
    State = cbsChecked
    TabOrder = 9
    Visible = False
    Width = 65
  end
  object cxlSupp: TcxLookupComboBox
    Left = 112
    Top = 88
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Supplier'
        FieldName = 'nama'
      end>
    Properties.ListSource = dsSupp
    Properties.OnChange = cxlSuppPropertiesChange
    TabOrder = 5
    Width = 396
  end
  object cxChkSelesai: TcxCheckBox
    Left = 264
    Top = 61
    Caption = 'Selesai'
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
      
        'WHERE f_completed = 0 AND id_supplier = :id_supplier AND a.f_com' +
        'pleted = 0 AND a.f_app = 1'
      'ORDER BY tanggal')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_supplier'
        ParamType = ptUnknown
      end>
    Left = 712
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_supplier'
        ParamType = ptUnknown
      end>
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
  object zqrSupp: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT id, nama FROM tbl_supplier'
      'ORDER BY nama')
    Params = <>
    Properties.Strings = (
      
        'select kode, deskripsi, satuan from tbl_barang order by deskrips' +
        'i')
    Left = 833
    Top = 67
  end
  object dsSupp: TDataSource
    DataSet = zqrSupp
    Left = 918
    Top = 101
  end
end
