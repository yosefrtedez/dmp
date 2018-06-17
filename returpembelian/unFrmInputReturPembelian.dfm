inherited frmInputReturPembelian: TfrmInputReturPembelian
  Caption = 'frmInputReturPembelian'
  ClientHeight = 656
  ClientWidth = 960
  OnCreate = FormCreate
  ExplicitWidth = 960
  ExplicitHeight = 656
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 960
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 186
      Height = 19
      Caption = 'Input Retur Pembelian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 607
    Width = 960
    TabOrder = 15
  end
  object cxlbl1: TcxLabel
    Left = 11
    Top = 62
    Caption = 'No. Bukti'
  end
  object cxlbl2: TcxLabel
    Left = 10
    Top = 89
    Caption = 'No. Invoice'
  end
  object cxlbl4: TcxLabel
    Left = 11
    Top = 116
    Caption = 'Tgl. Retur'
  end
  object cxlbl5: TcxLabel
    Left = 10
    Top = 143
    Caption = 'Nama Supplier'
  end
  object cxlbl6: TcxLabel
    Left = 10
    Top = 170
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
    TabOrder = 4
    Width = 146
  end
  object cxdTglDatang: TcxDateEdit
    Left = 112
    Top = 115
    TabOrder = 6
    Width = 146
  end
  object cxlSupplier: TcxLookupComboBox
    Left = 112
    Top = 142
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
    Properties.OnChange = cxlSupplierPropertiesChange
    TabOrder = 8
    Width = 351
  end
  object cxtAlamat: TcxTextEdit
    Left = 112
    Top = 169
    Properties.ReadOnly = True
    TabOrder = 10
    Width = 416
  end
  object cxtNoBukti: TcxTextEdit
    Left = 112
    Top = 61
    TabOrder = 1
    Width = 146
  end
  object cxChkPosting: TcxCheckBox
    Left = 266
    Top = 61
    Caption = 'Posting'
    TabOrder = 2
    Width = 104
  end
  object cxlbl14: TcxLabel
    Left = 10
    Top = 197
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 112
    Top = 196
    Properties.CharCase = ecUpperCase
    TabOrder = 12
    Width = 416
  end
  object cxgrdPP: TcxGrid
    Left = 10
    Top = 231
    Width = 942
    Height = 293
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 14
    object cxtbRetur: TcxGridTableView
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
      OptionsData.Appending = True
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
      object cxColQty: TcxGridColumn
        Caption = 'Qty. Retur'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        Properties.ReadOnly = False
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
        Width = 88
      end
      object cxColPPn: TcxGridColumn
        Caption = 'PPN'
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
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbRetur
    end
  end
  object zqrSupplier: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    Active = True
    SQL.Strings = (
      'select id, kode, nama '
      'from tbl_supplier order by nama')
    Params = <>
    Left = 755
    Top = 78
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
      'select id, kode, deskripsi from tbl_barang')
    Params = <>
    Properties.Strings = (
      
        'select kode, deskripsi, satuan from tbl_barang order by deskrips' +
        'i')
    Left = 753
    Top = 147
  end
  object dsBarang: TDataSource
    DataSet = zqrBarang
    Left = 814
    Top = 149
  end
end
