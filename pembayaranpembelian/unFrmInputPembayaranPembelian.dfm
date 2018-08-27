inherited frmInputPembayaranPembelian: TfrmInputPembayaranPembelian
  Caption = 'Input Purchase Order'
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
      Width = 242
      Height = 19
      Caption = 'Input Pembayaran Pembelian'
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
    TabOrder = 14
    ExplicitTop = 641
    ExplicitWidth = 1063
  end
  object cxgrdPP: TcxGrid
    Left = 11
    Top = 290
    Width = 1045
    Height = 293
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 13
    object cxtbInv: TcxGridTableView
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
        end
        item
          Format = '#,##.00'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnBeforePost = cxtbTblPODataControllerBeforePost
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxColNoInvoice: TcxGridColumn
        Caption = 'No. Invoice'
        Width = 121
      end
      object cxColTglInvoice: TcxGridColumn
        Caption = 'Tgl. Invoice'
        DataBinding.ValueType = 'DateTime'
        Width = 101
      end
      object cxColSaldo: TcxGridColumn
        Caption = 'Saldo'
        DataBinding.ValueType = 'Float'
        Width = 122
      end
      object cxColJmlDibayar: TcxGridColumn
        Caption = 'Jumlah Dibayar'
        DataBinding.ValueType = 'Float'
        Width = 128
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
    Top = 254
    Caption = 'Keterangan'
  end
  object cxtKeterangan: TcxTextEdit
    Left = 122
    Top = 253
    Properties.CharCase = ecUpperCase
    TabOrder = 11
    Width = 416
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 170
    Caption = 'Akun Kas'
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 122
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
    TabOrder = 9
    Width = 351
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
end
