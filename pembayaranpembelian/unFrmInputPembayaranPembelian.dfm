inherited frmInputPembayaranPembelian: TfrmInputPembayaranPembelian
  Caption = 'Input Pembayaran Pembelian'
  ClientHeight = 690
  ClientWidth = 1061
  OnShow = FormShow
  ExplicitWidth = 1061
  ExplicitHeight = 690
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1061
    ExplicitWidth = 1061
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
    Width = 1061
    TabOrder = 17
    ExplicitTop = 641
    ExplicitWidth = 1061
  end
  object cxgrdPP: TcxGrid
    Left = 11
    Top = 288
    Width = 1037
    Height = 293
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 16
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
        end
        item
          Format = '#,#0.00'
          Kind = skSum
          Column = cxColJmlDibayar
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnAfterPost = cxtbInvDataControllerAfterPost
      DataController.OnBeforePost = cxtbTblPODataControllerBeforePost
      DataController.OnRecordChanged = cxtbInvDataControllerRecordChanged
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxColNoInvoice: TcxGridColumn
        Caption = 'No. Invoice'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'No. Invoice'
            FieldName = 'no_bukti'
          end
          item
            Caption = 'Subtotal'
            FieldName = 'subtotal'
          end>
        Properties.ListSource = dsInv
        Width = 124
      end
      object cxColTglInvoice: TcxGridColumn
        Caption = 'Tgl. Invoice'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 107
      end
      object cxtbInvColumn1: TcxGridColumn
        Caption = 'Tgl. Jatuh Tempo'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 103
      end
      object cxColSaldo: TcxGridColumn
        Caption = 'Saldo'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 122
      end
      object cxColJmlDibayar: TcxGridColumn
        Caption = 'Jumlah Dibayar'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taRightJustify
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
        Caption = 'Nama Customer'
        FieldName = 'nama'
      end
      item
        Caption = 'Kode Supplier'
        FieldName = 'kode'
      end>
    Properties.ListSource = dsSupplier
    Properties.OnChange = cxLuSupplierPropertiesChange
    Properties.OnEditValueChanged = cxlSupplierPropertiesEditValueChanged
    TabOrder = 5
    Width = 351
  end
  object cxtAlamat: TcxTextEdit
    Left = 122
    Top = 142
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 460
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
    TabOrder = 14
    Width = 416
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 170
    Caption = 'Akun Kas'
  end
  object cxlAkun: TcxLookupComboBox
    Left = 122
    Top = 169
    Properties.DropDownAutoSize = True
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Akun'
        FieldName = 'nama'
      end
      item
        Caption = 'No. Akun'
        FieldName = 'noakun'
      end>
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = dsAkun
    Properties.OnEditValueChanged = cxlAkunPropertiesEditValueChanged
    TabOrder = 9
    Width = 351
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 197
    Caption = 'Terbilang'
  end
  object cxtAkun: TcxTextEdit
    Left = 479
    Top = 169
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    TabOrder = 10
    Width = 103
  end
  object cxmTerbilang: TcxMemo
    Left = 122
    Top = 196
    Properties.ReadOnly = True
    TabOrder = 12
    Height = 51
    Width = 351
  end
  object zqrInv: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT b.id, b.no_bukti, '
      
        'SUM((a.qty * a.harga) - ((a.qty * a.harga) * a.disc_persen / 100' +
        ')  + if(a.ppn = '#39'PPN'#39',((a.qty * a.harga) - ((a.qty * a.harga) * ' +
        'a.disc_persen / 100)) * 0.1,0)) subtotal'
      'FROM tbl_invoicepembelian_det a '
      'LEFT JOIN tbl_invoicepembelian_head b ON a.no_bukti = a.no_bukti'
      'WHERE b.id_supp = :id_supp'
      'GROUP BY b.id, b.no_bukti')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_supp'
        ParamType = ptUnknown
      end>
    Left = 692
    Top = 82
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_supp'
        ParamType = ptUnknown
      end>
  end
  object dsInv: TDataSource
    DataSet = zqrInv
    Left = 761
    Top = 83
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
    Left = 776
    Top = 181
  end
  object zqrAkun: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'select id, noakun, nama '
      'from tbl_coa where ifnull(induk,'#39#39') <> '#39#39' and tipe = 1;')
    Params = <>
    Left = 844
    Top = 146
  end
  object dsAkun: TDataSource
    DataSet = zqrAkun
    Left = 913
    Top = 147
  end
end
