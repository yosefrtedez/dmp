inherited frmInputInvoicePenjualan: TfrmInputInvoicePenjualan
  Caption = 'Input Invoice Pembelian'
  ClientHeight = 690
  ClientWidth = 1098
  OnShow = FormShow
  ExplicitWidth = 1098
  ExplicitHeight = 690
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1098
    ExplicitWidth = 1063
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 195
      Height = 19
      Caption = 'Input Invoice Penjualan'
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
    Width = 1098
    TabOrder = 24
    ExplicitTop = 641
    ExplicitWidth = 1063
  end
  object cxgrdPP: TcxGrid
    Left = 10
    Top = 227
    Width = 1080
    Height = 293
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 13
    ExplicitWidth = 1045
    object cxtbInv: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Enabled = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Enabled = False
      NavigatorButtons.Append.Visible = False
      NavigatorButtons.Delete.Enabled = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Refresh.Visible = False
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
          Column = cxColTotal
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxtbTblPODataControllerBeforePost
      DataController.OnRecordChanged = cxtbTblPODataControllerRecordChanged
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
            Caption = 'Kode '
            FieldName = 'kode'
          end
          item
            Caption = 'Deskripsi'
            FieldName = 'deskripsi'
          end>
        Properties.ListSource = dsBarang
        Options.Editing = False
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
        Options.Editing = False
        Width = 237
      end
      object cxColQty: TcxGridColumn
        Caption = 'Qty'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = False
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Options.Editing = False
      end
      object cxColSatuan: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 82
      end
      object cxColHarga: TcxGridColumn
        Caption = 'Harga'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        HeaderAlignmentHorz = taRightJustify
        Options.Editing = False
        Width = 88
      end
      object cxColPPN: TcxGridColumn
        Caption = 'PPN'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'PPN'
          'NON PPN')
        Options.Editing = False
      end
      object cxColValuta: TcxGridColumn
        Caption = 'Valuta'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'IDR'
          'USD')
        Visible = False
        Options.Editing = False
        Width = 61
      end
      object cxColDiscount: TcxGridColumn
        Caption = 'Disc (%)'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        Visible = False
      end
      object cxColKeterangan: TcxGridColumn
        Caption = 'Keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 220
      end
      object cxColTotal: TcxGridColumn
        Caption = 'Total'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = False
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taRightJustify
        Options.Editing = False
        Width = 112
      end
      object cxColIdSatuan: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
      object cxColKodeBrg2: TcxGridColumn
        Visible = False
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbInv
    end
  end
  object cxlbl1: TcxLabel
    Left = 10
    Top = 62
    Caption = 'No. Bukti'
  end
  object cxlbl3: TcxLabel
    Left = 10
    Top = 89
    Caption = 'Tanggal'
  end
  object cxlbl5: TcxLabel
    Left = 10
    Top = 119
    Caption = 'Nama Customer'
  end
  object cxlbl6: TcxLabel
    Left = 10
    Top = 144
    Caption = 'Alamat'
  end
  object cxdTgl: TcxDateEdit
    Left = 122
    Top = 88
    Properties.ReadOnly = False
    TabOrder = 3
    Width = 146
  end
  object cxLuCustomer: TcxLookupComboBox
    Left = 122
    Top = 116
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
    Properties.ListSource = dsCustomer
    Properties.OnChange = cxLuSupplierPropertiesChange
    TabOrder = 5
    OnClick = cxLuCustomerClick
    Width = 351
  end
  object cxtAlamat: TcxTextEdit
    Left = 122
    Top = 143
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 351
  end
  object cxtNoBukti: TcxTextEdit
    Left = 122
    Top = 61
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 146
  end
  object cxlbl14: TcxLabel
    Left = 10
    Top = 171
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 122
    Top = 170
    Properties.CharCase = ecUpperCase
    TabOrder = 9
    Width = 416
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 200
    Caption = 'No.Surat Jalan'
  end
  object cxLuSj: TcxLookupComboBox
    Left = 122
    Top = 197
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'No Bukti'
        FieldName = 'no_bukti'
      end>
    Properties.ListSource = dsSjHead
    Properties.OnChange = cxLuSjPropertiesChange
    TabOrder = 11
    Width = 199
  end
  object cxLabel4: TcxLabel
    Left = 848
    Top = 527
    Caption = 'Disc (%)'
  end
  object cxsDiskon: TcxSpinEdit
    Left = 936
    Top = 526
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ReadOnly = True
    Properties.ValueType = vtFloat
    TabOrder = 14
    Width = 121
  end
  object DPP: TcxLabel
    Left = 848
    Top = 554
    Caption = 'Setelah Diskon'
  end
  object cxsStlhDiskon: TcxSpinEdit
    Left = 936
    Top = 553
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 16
    Width = 121
  end
  object cxsPPN: TcxSpinEdit
    Left = 936
    Top = 607
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 21
    Width = 121
  end
  object cxChkPPN: TcxCheckBox
    Left = 848
    Top = 607
    Caption = 'PPN (10%)'
    TabOrder = 20
    Width = 82
  end
  object cxLabel5: TcxLabel
    Left = 848
    Top = 581
    Caption = 'DPP'
  end
  object cxsDPP: TcxSpinEdit
    Left = 936
    Top = 580
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 18
    Width = 121
  end
  object cxLabel6: TcxLabel
    Left = 848
    Top = 635
    Caption = 'Harga Total'
  end
  object cxsHargaTotal: TcxSpinEdit
    Left = 936
    Top = 634
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 22
    Width = 121
  end
  object zqrSjHead: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      
        'select id, no_bukti from tbl_sj_head where f_inv = 0 and  id_cus' +
        't = :id_cust')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cust'
        ParamType = ptUnknown
      end>
    Left = 678
    Top = 67
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cust'
        ParamType = ptUnknown
      end>
  end
  object dsSjHead: TDataSource
    DataSet = zqrSjHead
    Left = 733
    Top = 68
  end
  object zqrCustomer: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select id, kode, nama '
      'from tbl_customer order by nama')
    Params = <>
    Left = 671
    Top = 131
  end
  object dsCustomer: TDataSource
    DataSet = zqrCustomer
    Left = 732
    Top = 132
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
    Left = 857
    Top = 155
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 942
    Top = 157
  end
end
