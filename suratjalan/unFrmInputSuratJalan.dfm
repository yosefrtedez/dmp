inherited frmInputSuratJalan: TfrmInputSuratJalan
  Caption = 'Input Surat Jalan'
  ClientHeight = 687
  ClientWidth = 1119
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
    TabOrder = 31
    ExplicitTop = 638
    ExplicitWidth = 1119
    inherited btnSimpan: TButton
      Top = 11
      ExplicitTop = 11
    end
    inherited btnBatal: TButton
      Top = 11
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
    Top = 226
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 112
    Top = 224
    Properties.CharCase = ecUpperCase
    TabOrder = 16
    Width = 416
  end
  object cxgrdPP: TcxGrid
    Left = 8
    Top = 280
    Width = 1103
    Height = 211
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 20
    object cxtbSJ: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.PriorPage.Visible = False
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = False
      NavigatorButtons.Refresh.Visible = True
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
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
      DataController.OnAfterDelete = cxtbSJDataControllerAfterDelete
      DataController.OnBeforePost = cxtbSJDataControllerBeforePost
      DataController.OnRecordChanged = cxtbSJDataControllerRecordChanged
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Appending = True
      OptionsView.Navigator = True
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
        Properties.ReadOnly = True
        Width = 66
      end
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 237
      end
      object cxColNoSO: TcxGridColumn
        Caption = 'No. SO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 92
      end
      object cxColQtySO: TcxGridColumn
        Caption = 'Qty. SO'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        Width = 70
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty. Kirim'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Width = 73
      end
      object cxColQtyTerkirim: TcxGridColumn
        Caption = 'Qty. Terkirim'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Width = 89
      end
      object cxColJmlIkatPerBal: TcxGridColumn
        Caption = 'Jml. Ikat / Bal'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        Width = 85
      end
      object cxColHargaIkat: TcxGridColumn
        Caption = 'Harga / Ikat'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Width = 75
      end
      object cxColHarga: TcxGridColumn
        Caption = 'Harga Jual'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Width = 76
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
        Properties.ReadOnly = True
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
        Width = 101
      end
      object cxColIdSatuan: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
      object cxColIdSO: TcxGridColumn
        Visible = False
      end
      object cxColIdBrg: TcxGridColumn
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
    Properties.OnChange = cxlCustomerPropertiesChange
    TabOrder = 8
    Width = 416
  end
  object cxLabel2: TcxLabel
    Left = 11
    Top = 171
    Caption = 'Nopol'
  end
  object cxtNopol: TcxTextEdit
    Left = 112
    Top = 170
    Properties.ReadOnly = False
    TabOrder = 12
    Width = 146
  end
  object cxtSopir: TcxTextEdit
    Left = 112
    Top = 197
    Properties.ReadOnly = False
    TabOrder = 14
    Width = 146
  end
  object cxLabel3: TcxLabel
    Left = 11
    Top = 198
    Caption = 'Sopir'
  end
  object cxLabel4: TcxLabel
    Left = 888
    Top = 499
    Caption = 'Diskon (%)'
  end
  object cxsDiskon: TcxSpinEdit
    Left = 976
    Top = 498
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    Properties.OnChange = cxsDiskonPropertiesChange
    TabOrder = 21
    Width = 121
  end
  object DPP: TcxLabel
    Left = 888
    Top = 526
    Caption = 'Setelah Diskon'
  end
  object cxsStlhDiskon: TcxSpinEdit
    Left = 976
    Top = 525
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 23
    Width = 121
  end
  object cxsPPN: TcxSpinEdit
    Left = 976
    Top = 579
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 28
    Width = 121
  end
  object cxChkPPN: TcxCheckBox
    Left = 888
    Top = 579
    Caption = 'PPN (10%)'
    TabOrder = 27
    OnClick = cxChkPPNClick
    Width = 82
  end
  object cxLabel5: TcxLabel
    Left = 888
    Top = 553
    Caption = 'DPP'
  end
  object cxsDPP: TcxSpinEdit
    Left = 976
    Top = 552
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 25
    Width = 121
  end
  object cxLabel6: TcxLabel
    Left = 888
    Top = 607
    Caption = 'Harga Total'
  end
  object cxsHargaTotal: TcxSpinEdit
    Left = 976
    Top = 606
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 29
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
    Top = 252
    Caption = 'Tgl. Jatuh Tempo'
  end
  object cxdTglJthTempo: TcxDateEdit
    Left = 112
    Top = 251
    TabOrder = 18
    Width = 146
  end
  object Button1: TButton
    Left = 534
    Top = 113
    Width = 75
    Height = 25
    Caption = 'Pilih SO'
    TabOrder = 7
    OnClick = Button1Click
  end
  object cxLabel9: TcxLabel
    Left = 11
    Top = 144
    Caption = 'Alamat'
  end
  object cxtAlamat: TcxTextEdit
    Left = 112
    Top = 142
    Properties.CharCase = ecUpperCase
    TabOrder = 10
    Width = 416
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
    Top = 153
  end
  object dsCust: TDataSource
    DataSet = zqrCust
    Left = 720
    Top = 153
  end
  object zqrSO: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
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
    Top = 153
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
    Top = 153
  end
end
