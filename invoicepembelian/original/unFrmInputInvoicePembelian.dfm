inherited frmInputInvoicePembelian: TfrmInputInvoicePembelian
  Caption = 'Input Invoice Pembelian'
  ClientHeight = 690
  ClientWidth = 1063
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
      Width = 199
      Height = 19
      Caption = 'Input Invoice Pembelian'
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
    TabOrder = 20
    ExplicitTop = 641
    ExplicitWidth = 1063
  end
  object cxgrdPP: TcxGrid
    Left = 10
    Top = 234
    Width = 1045
    Height = 293
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 13
    object cxtbTblPO: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
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
        Properties.ValueType = vtFloat
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
      object cxColKodeBrg2: TcxGridColumn
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
  object cxlbl3: TcxLabel
    Left = 10
    Top = 89
    Caption = 'Tanggal'
  end
  object cxlbl5: TcxLabel
    Left = 10
    Top = 116
    Caption = 'Nama Supplier'
  end
  object cxlbl6: TcxLabel
    Left = 10
    Top = 143
    Caption = 'Alamat'
  end
  object cxdTgl: TcxDateEdit
    Left = 122
    Top = 88
    Properties.ReadOnly = False
    TabOrder = 3
    Width = 146
  end
  object cxlSupplier: TcxLookupComboBox
    Left = 122
    Top = 115
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
    TabOrder = 5
    Width = 351
  end
  object cxtAlamat: TcxTextEdit
    Left = 122
    Top = 142
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
    Top = 170
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 122
    Top = 169
    Properties.CharCase = ecUpperCase
    TabOrder = 9
    Width = 416
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 197
    Caption = 'No. Penerimaan'
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 122
    Top = 196
    Properties.ListColumns = <>
    TabOrder = 11
    Width = 199
  end
  object cxSpinEdit1: TcxSpinEdit
    Left = 880
    Top = 533
    TabOrder = 14
    Width = 175
  end
  object cxLabel2: TcxLabel
    Left = 800
    Top = 534
    Caption = 'Subtotal'
  end
  object cxLabel3: TcxLabel
    Left = 800
    Top = 561
    Caption = 'PPN'
  end
  object cxSpinEdit2: TcxSpinEdit
    Left = 880
    Top = 560
    TabOrder = 16
    Width = 175
  end
  object cxLabel4: TcxLabel
    Left = 800
    Top = 588
    Caption = 'Total'
  end
  object cxSpinEdit3: TcxSpinEdit
    Left = 880
    Top = 587
    TabOrder = 18
    Width = 175
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
    Left = 857
    Top = 155
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 942
    Top = 157
  end
end
