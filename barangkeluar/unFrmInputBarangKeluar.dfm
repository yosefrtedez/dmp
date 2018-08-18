inherited frmInputBarangKeluar: TfrmInputBarangKeluar
  Caption = 'Input Barang Keluar'
  ClientHeight = 771
  ClientWidth = 1165
  OnShow = FormShow
  ExplicitTop = -121
  ExplicitWidth = 1165
  ExplicitHeight = 771
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1165
    ExplicitWidth = 1165
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 165
      Height = 19
      Caption = 'Input Barang Keluar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 722
    Width = 1165
    TabOrder = 29
    ExplicitTop = 722
    ExplicitWidth = 1165
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
    TabOrder = 1
    Width = 146
  end
  object cxlbl14: TcxLabel
    Left = 11
    Top = 143
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 112
    Top = 142
    Properties.CharCase = ecUpperCase
    TabOrder = 7
    Width = 416
  end
  object cxgrdPP: TcxGrid
    Left = 10
    Top = 254
    Width = 1147
    Height = 195
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 17
    object cxtbBrgKeluar: TcxGridTableView
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
      DataController.OnBeforePost = cxtbReturDataControllerBeforePost
      DataController.OnRecordChanged = cxtbReturDataControllerRecordChanged
      OptionsBehavior.FocusCellOnTab = True
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
      object cxColJmlIkatPerBal: TcxGridColumn
        Caption = 'Jml. Ikat Per Bal'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taRightJustify
        Width = 89
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty. Keluar'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = False
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Width = 81
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 68
      end
      object cxColHargaIkat: TcxGridColumn
        Caption = 'Harga / Ikat'
        DataBinding.ValueType = 'Float'
        Width = 81
      end
      object cxColHarga: TcxGridColumn
        Caption = 'Harga Jual'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Width = 101
      end
      object cxColGudang: TcxGridColumn
        Caption = 'Gudang'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Kode'
            FieldName = 'kode'
          end
          item
            Caption = 'ID'
            FieldName = 'id'
          end>
        Properties.ListSource = dsGudang
        Width = 80
      end
      object cxColQtyKG: TcxGridColumn
        Caption = 'Qty. KG'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Width = 82
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
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taRightJustify
        Width = 112
      end
      object cxColIdSatuan: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
      object cxColIdBrg: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
      object cxColKodeBrg2: TcxGridColumn
        Visible = False
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbBrgKeluar
    end
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
  object cxLabel1: TcxLabel
    Left = 11
    Top = 116
    Caption = 'Customer'
  end
  object cxLabel2: TcxLabel
    Left = 824
    Top = 458
    Caption = 'Diskon (%)'
  end
  object cxsDiskon: TcxSpinEdit
    Left = 912
    Top = 457
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    Properties.OnChange = cxsDiskonPropertiesChange
    TabOrder = 19
    Width = 121
  end
  object DPP: TcxLabel
    Left = 824
    Top = 485
    Caption = 'Setelah Diskon'
  end
  object cxsStlhDiskon: TcxSpinEdit
    Left = 912
    Top = 484
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 21
    Width = 121
  end
  object cxsPPN: TcxSpinEdit
    Left = 912
    Top = 538
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 26
    Width = 121
  end
  object cxChkPPN: TcxCheckBox
    Left = 824
    Top = 538
    Caption = 'PPN (10%)'
    TabOrder = 25
    OnClick = cxChkPPNClick
    Width = 82
  end
  object cxLabel3: TcxLabel
    Left = 824
    Top = 512
    Caption = 'DPP'
  end
  object cxsDPP: TcxSpinEdit
    Left = 912
    Top = 511
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 23
    Width = 121
  end
  object cxLabel4: TcxLabel
    Left = 824
    Top = 566
    Caption = 'Harga Total'
  end
  object cxsHargaTotal: TcxSpinEdit
    Left = 912
    Top = 565
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 27
    Width = 121
  end
  object cxLabel5: TcxLabel
    Left = 11
    Top = 170
    Caption = 'Tgl. Jatuh Tempo'
  end
  object cxdTglJthTempo: TcxDateEdit
    Left = 112
    Top = 169
    TabOrder = 9
    Width = 146
  end
  object cxLabel6: TcxLabel
    Left = 11
    Top = 197
    Caption = 'Jenis Transaksi'
  end
  object cxCmbJenisTrs: TcxComboBox
    Left = 112
    Top = 196
    Properties.DropDownListStyle = lsEditFixedList
    Properties.OnChange = cxCmbJenisTrsPropertiesChange
    TabOrder = 11
    Width = 146
  end
  object cxLabel7: TcxLabel
    Left = 11
    Top = 224
    Caption = 'No. Surat Jalan'
  end
  object cxtNoSJ: TcxTextEdit
    Left = 112
    Top = 223
    TabOrder = 13
    Width = 146
  end
  object btnPilihHarga: TButton
    Left = 8
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Pilih Harga'
    TabOrder = 18
    OnClick = btnPilihHargaClick
  end
  object cxLabel8: TcxLabel
    Left = 264
    Top = 224
    Caption = 'No. Faktur'
  end
  object cxtNoFaktur: TcxTextEdit
    Left = 332
    Top = 223
    TabOrder = 14
    Width = 146
  end
  object zqrSupplier: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select id, kode, nama '
      'from tbl_supplier order by nama')
    Params = <>
    Left = 756
    Top = 77
  end
  object dsSupplier: TDataSource
    DataSet = zqrSupplier
    Left = 816
    Top = 77
  end
  object zqrBarang: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select id, kode, deskripsi '
      'from tbl_barang'
      '-- ')
    Params = <>
    Properties.Strings = (
      
        'select kode, deskripsi, satuan from tbl_barang order by deskrips' +
        'i')
    Left = 912
    Top = 83
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 982
    Top = 85
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
    Left = 1034
    Top = 90
  end
  object dsGudang: TDataSource
    DataSet = zqrGudang
    Left = 1071
    Top = 92
  end
  object zqrCust: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select id, kode, nama '
      'from tbl_customer order by nama')
    Params = <>
    Left = 588
    Top = 77
  end
  object dsCust: TDataSource
    DataSet = zqrCust
    Left = 648
    Top = 77
  end
end
